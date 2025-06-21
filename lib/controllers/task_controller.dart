import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:todo_list_app/models/task.dart';
import 'package:todo_list_app/services/hive_service.dart';

class TaskController extends GetxController {
  var tasks = <Task>[].obs;
  final box = HiveService().getBox();

  @override
  void onInit() {
    super.onInit();
    loadTasks();
  }

  void loadTasks() {
    tasks.assignAll(box.values.cast<Task>().toList());
  }

  void addTask(String title, String description) {
    final task = Task(title: title, description: description);
    box.add(task);
    tasks.add(task);
  }

  void updateTask(Task task, String newTitle, String newDescription) {
    task.title = newTitle;
    task.description = newDescription;
    task.save();
    tasks.refresh();
  }

  void toggleTaskCompletion(Task task) {
    task.isCompleted = !task.isCompleted;
    task.save();
    tasks.refresh();
  }

  void deleteTask(Task task) {
    task.delete();
    tasks.remove(task);
  }
}