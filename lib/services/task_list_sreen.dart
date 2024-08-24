import 'package:flutter/material.dart';
import 'package:my_tasks/repositories/database_helper.dart';

class TaskListScreen extends StatefulWidget {
  const TaskListScreen({super.key});

  @override
  State<TaskListScreen> createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  final DatabaseHelper _dbHelper = DatabaseHelper();
  List<Map<String, dynamic>> _tasks = [];

  @override
  void initState() {
    super.initState();
    _refreshTasks();
  }

  void _refreshTasks() async {
    final tasks = await _dbHelper.getTasks();
    setState(() {
      _tasks = tasks;
    });
  }

  void _showTaskDialog([Map<String, dynamic>? task]) {
    final nameController = TextEditingController(text: task?['name'] ?? '');
    final dateController = TextEditingController(
      text: task != null ? task['dueDate'] : '',
    );
    bool isComplete = task?['isComplete'] == 1;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.black,
          title: Text(
            task == null ? 'Adicionar Tarefa' : 'Editar Tarefa',
            style: const TextStyle(color: Colors.white),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                style: const TextStyle(
                  color: Colors.white,
                ),
                cursorColor: Colors.white,
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Qual tarefa?',
                  labelStyle: TextStyle(
                    color: Colors.white,
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                ),
              ),
              TextField(
                style: const TextStyle(
                  color: Colors.white,
                ),
                cursorColor: Colors.white,
                controller: dateController,
                decoration: const InputDecoration(
                  labelText: 'Data (YYYY-MM-DD)',
                  labelStyle: TextStyle(
                    color: Colors.white,
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Checkbox(
                    value: isComplete,
                    onChanged: (value) {
                      setState(() {
                        isComplete = value ?? false;
                      });
                    },
                  ),
                  const Text(
                    'Completo',
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () async {
                if (task == null) {
                  await _dbHelper.insertTask({
                    'name': nameController.text,
                    'dueDate': dateController.text,
                    'isComplete': isComplete ? 1 : 0,
                  });
                } else {
                  await _dbHelper.updateTask({
                    'id': task['id'],
                    'name': nameController.text,
                    'dueDate': dateController.text,
                    'isComplete': isComplete ? 1 : 0,
                  });
                }
                _refreshTasks();
                Navigator.of(context).pop();
              },
              child: Text(
                task == null ? 'Adicionar' : 'Atualizar',
                style: const TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'Cancelar',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void _deleteTask(int id) async {
    await _dbHelper.deleteTask(id);
    _refreshTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          size: 35,
          Icons.track_changes_rounded,
          color: Colors.white,
        ),
        backgroundColor: const Color.fromRGBO(33, 31, 38, 75),
      ),
      body: ListView.builder(
        itemCount: _tasks.length,
        itemBuilder: (context, index) {
          final task = _tasks[index];
          return Container(
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black12),
              borderRadius: const BorderRadius.all(Radius.circular(8.0)),
            ),
            child: ListTile(
              title: Text(
                task['name'],
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 25,
                  color: Colors.black87,
                ),
              ),
              subtitle: Text(
                '${task['dueDate']}',
                style: const TextStyle(
                  fontSize: 22,
                  color: Colors.black54,
                ),
              ),
              leading: Checkbox(
                value: task['isComplete'] == 1,
                onChanged: (value) {
                  final updatedTask = Map<String, dynamic>.from(task);
                  updatedTask['isComplete'] = value! ? 1 : 0;
                  _dbHelper.updateTask(updatedTask);
                  _refreshTasks();
                },
                shape: const CircleBorder(),
                activeColor: Colors.green[700],
              ),
              onTap: () => _showTaskDialog(task),
              onLongPress: () => _deleteTask(task['id']),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showTaskDialog(),
        backgroundColor: const Color.fromRGBO(44, 44, 44, 1),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
