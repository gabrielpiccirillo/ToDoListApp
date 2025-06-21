import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:todo_list_app/controllers/task_controller.dart';
import 'package:todo_list_app/screens/edit_task_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TaskController controller = Get.put(TaskController());
    final TextEditingController titleController = TextEditingController();
    final TextEditingController descController = TextEditingController();
    final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('To-Do List'),
        backgroundColor: Colors.blue.shade700,
        foregroundColor: Colors.white,
        elevation: 2,
      ),
      body: Obx(
        () => controller.tasks.isEmpty
            ? const Center(
                child: Text(
                  'Nenhuma tarefa adicionada',
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
              )
            : AnimatedList(
                key: listKey,
                initialItemCount: controller.tasks.length,
                itemBuilder: (context, index, animation) {
                  final task = controller.tasks[index];
                  return FadeTransition(
                    opacity: animation,
                    child: SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(1, 0),
                        end: Offset.zero,
                      ).animate(animation),
                      child: Card(
                        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ListTile(
                          title: Text(
                            task.title,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              decoration: task.isCompleted ? TextDecoration.lineThrough : null,
                              color: task.isCompleted ? Colors.grey : Colors.black87,
                            ),
                          ),
                          subtitle: Text(
                            task.description.isNotEmpty ? task.description : 'Sem descrição',
                            style: TextStyle(color: Colors.grey.shade600),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          leading: Checkbox(
                            value: task.isCompleted,
                            activeColor: Colors.blue.shade700,
                            onChanged: (value) => controller.toggleTaskCompletion(task),
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.edit, color: Colors.blue),
                                onPressed: () => Get.to(() => EditTaskScreen(task: task)),
                              ),
                              IconButton(
                                icon: const Icon(Icons.delete, color: Colors.red),
                                onPressed: () {
                                  controller.deleteTask(task);
                                  listKey.currentState?.removeItem(
                                    index,
                                    (context, animation) => const SizedBox(),
                                    duration: const Duration(milliseconds: 300),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          titleController.clear();
          descController.clear();
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              title: const Text('Nova Tarefa'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: titleController,
                    decoration: InputDecoration(
                      labelText: 'Título',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: descController,
                    decoration: InputDecoration(
                      labelText: 'Descrição',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                    maxLines: 3,
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () => Get.back(),
                  child: const Text('Cancelar'),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (titleController.text.isNotEmpty) {
                      controller.addTask(titleController.text, descController.text);
                      listKey.currentState?.insertItem(controller.tasks.length - 1);
                      Get.back();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade700,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  child: const Text('Adicionar'),
                ),
              ],
            ),
          );
        },
        backgroundColor: Colors.blue.shade700,
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
      ).animate().fadeIn().scale(),
    );
  }
}