import 'package:flutter/material.dart';

void main() => runApp(const TaskApp());

class TaskApp extends StatelessWidget {
  const TaskApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TaskFlow',
      home: const TaskHome(),
    );
  }
}

class Task {
  String title;
  bool isCompleted;
  Task({required this.title, this.isCompleted = false});
}

class TaskHome extends StatefulWidget {
  const TaskHome({super.key});

  @override
  State<TaskHome> createState() => _TaskHomeState();
}

class _TaskHomeState extends State<TaskHome> {
  final List<Task> tasks = [];
  final TextEditingController _controller = TextEditingController();

  void addTask() {
    if (_controller.text.trim().isEmpty) return;
    setState(() {
      tasks.add(Task(title: _controller.text.trim()));
      _controller.clear();
    });
  }

  void toggleTask(int index) {
    setState(() {
      tasks[index].isCompleted = !tasks[index].isCompleted;
    });
  }

  void deleteTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("TaskFlow")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(labelText: "Nueva tarea"),
                  ),
                ),
                IconButton(icon: const Icon(Icons.add), onPressed: addTask)
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (_, i) => ListTile(
                title: Text(
                  tasks[i].title,
                  style: TextStyle(
                    decoration: tasks[i].isCompleted
                        ? TextDecoration.lineThrough
                        : null,
                  ),
                ),
                leading: Checkbox(
                  value: tasks[i].isCompleted,
                  onChanged: (_) => toggleTask(i),
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () => deleteTask(i),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
