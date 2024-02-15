import 'package:flutter/material.dart';
import 'package:task_manager/components/tasks.dart';

class TaskInherited extends InheritedWidget {
  TaskInherited({
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  final List<Task> taskList = [
    Task('Aprender Flutter no intervalo do curso!', 'assets/images/flutter.png',
        2),
    Task('Andar de Bike', 'assets/images/bike.webp', 5),
    Task('Meditar', 'assets/images/meditar.jpeg', 1),
    Task('Ler', 'assets/images/ler.jpg', 3),
    Task('Jogar', 'assets/images/jogar.jpg', 4),
    Task('Jogar', 'assets/images/jogar.jpg', 4),
  ];

  void newTask(String name, String photo, int difficulty) {
    taskList.add(Task(name, photo, difficulty));
  }

  static TaskInherited of(BuildContext context) {
    final TaskInherited? result = context.dependOnInheritedWidgetOfExactType<TaskInherited>();
    assert(result != null, 'No  found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(TaskInherited oldWidget) {
    return oldWidget.taskList.length != taskList.length;
  }
}
