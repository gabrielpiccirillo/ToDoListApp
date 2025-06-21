# To-Do List App

Um aplicativo de lista de tarefas desenvolvido em Flutter, permitindo adicionar, editar, excluir e marcar tarefas como concluídas, com suporte a títulos e descrições. A interface foi projetada com um visual moderno, usando Material Design 3, animações suaves e persistência de dados com Hive.

## Tecnologias Utilizadas
- **Flutter**: Framework para desenvolvimento multiplataforma.
- **Dart**: Linguagem de programação usada no Flutter.
- **Hive**: Banco de dados local leve para persistência de dados.
- **GetX**: Gerenciamento de estado e navegação.
- **Flutter Animate**: Para animações suaves na interface.
- **Flutter Web**: Para disponibilizar a versão web da aplicação.

## Pré-requisitos
- Flutter SDK (versão 3.24 ou superior)
- Dart
- Um emulador Android/iOS ou dispositivo físico
- Navegador (Chrome ou Edge) para testar a versão web
- Git para clonar o repositório

## Como Instalar e Executar

1. **Clone o repositório**:
   ```bash
   git clone [https://github.com/seu-usuario/todo_list_app.git](https://github.com/gabrielpiccirillo/ToDoListApp)
   cd todo_list_app
   ```

2. **Instale as dependências**:
   ```bash
   flutter pub get
   ```

3. **Gere o adaptador do Hive**:
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

4. **Execute o aplicativo**:
   - Para dispositivos móveis/emuladores:
     ```bash
     flutter run
     ```
   - Para a versão web:
     ```bash
     flutter run -d chrome
     ```

5. **Build para web (opcional)**:
   Para hospedar a versão web, gere os arquivos de build:
   ```bash
   flutter build web
   ```
   Os arquivos gerados estarão em `build/web`.

## Estrutura do Projeto
- `lib/models/`: Contém o modelo de dados da tarefa (`task.dart`).
- `lib/controllers/`: Gerenciamento de estado com GetX (`task_controller.dart`).
- `lib/screens/`: Telas da aplicação (`home_screen.dart`, `edit_task_screen.dart`).
- `lib/services/`: Configuração do Hive (`hive_service.dart`).
- `lib/main.dart`: Ponto de entrada da aplicação.

## Funcionalidades
- Adicionar tarefas com título e descrição.
- Editar título e descrição de tarefas existentes.
- Excluir tarefas.
- Marcar tarefas como concluídas.
- Persistência de dados local com Hive.
- Interface moderna com animações suaves, cartões estilizados e paleta de cores personalizada.
- Suporte responsivo para mobile e web.

## Link para a Versão Web
Acesse a versão web hospedada em [https://to-do-list-83898.web.app](#)

## Vídeo Demonstrativo
Assista ao vídeo mostrando o funcionamento do aplicativo: [INSIRA_LINK_AQUI](#) (substitua pelo link do vídeo, ex.: YouTube ou Google Drive).

## Como Contribuir
1. Faça um fork do projeto.
2. Crie uma branch para sua feature (`git checkout -b feature/nova-feature`).
3. Commit suas alterações (`git commit -m 'Adiciona nova feature'`).
4. Push para a branch (`git push origin feature/nova-feature`).
5. Abra um Pull Request.

## Licença
Este projeto está licenciado sob a [MIT License](LICENSE).
