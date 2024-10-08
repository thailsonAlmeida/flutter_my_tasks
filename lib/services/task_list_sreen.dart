import 'package:flutter/material.dart';
import 'package:my_tasks/repositories/task_repository.dart';

class TaskListScreen extends StatefulWidget {
  const TaskListScreen({super.key});

  @override
  State<TaskListScreen> createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  final TaskRepository taskRepository = TaskRepository();
  List<Map<String, dynamic>> _tasks = [];

  @override
  void initState() {
    super.initState();
    _refreshTasks();
  }

  void _refreshTasks() async {
    final tasks = await taskRepository.getTasks();
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
                readOnly: true,
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2200),
                    builder: (context, child) {
                      return Theme(
                        data: ThemeData.dark().copyWith(
                          colorScheme: const ColorScheme.dark(
                            primary: Colors.blue, // Cabeçalho do calendário
                            onPrimary:
                                Colors.white, // Texto dentro do cabeçalho
                            surface: Colors.black, // Fundo do calendário
                            onSurface:
                                Colors.white, // Texto padrão do calendário
                          ),
                          dialogBackgroundColor: Colors.black,
                        ),
                        child: child!,
                      );
                    },
                  );
                  if (pickedDate != null) {
                    String formattedDate =
                        "${pickedDate.year}-${pickedDate.month.toString().padLeft(2, '0')}-${pickedDate.day.toString().padLeft(2, '0')}";
                    dateController.text = formattedDate;
                  }
                },
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
                  await taskRepository.insertTask({
                    'name': nameController.text,
                    'dueDate': dateController.text,
                    'isComplete': isComplete ? 1 : 0,
                  });
                } else {
                  await taskRepository.updateTask({
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
    await taskRepository.deleteTask(id);
    _refreshTasks();
  }

  void _showSmart() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          content: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text(
                  'Specific (Específica)',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
                ),
                subtitle: Text(
                  'A meta deve ser clara e específica.',
                  style: TextStyle(fontSize: 12),
                ),
              ),
              ListTile(
                title: Text(
                  'Measurable (Mensurável):',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
                ),
                subtitle: Text(
                  'A meta deve ser possível avaliar o progresso.',
                  style: TextStyle(fontSize: 12),
                ),
              ),
              ListTile(
                title: Text(
                  'Attainable (Atingível)',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
                ),
                subtitle: Text(
                  'A meta deve ser realista e possível de alcançar.',
                  style: TextStyle(fontSize: 12),
                ),
              ),
              ListTile(
                title: Text(
                  'Relevant (Relevante)',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
                ),
                subtitle: Text(
                  'A meta deve ser relevante para os objetivos maiores ou valores da pessoa ou organização.',
                  style: TextStyle(fontSize: 12),
                ),
              ),
              ListTile(
                title: Text(
                  'Time-bound (Temporal)',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
                ),
                subtitle: Text(
                  'A meta deve ter um prazo definido, o que cria um senso de urgência e ajuda a focar os esforços.',
                  style: TextStyle(fontSize: 12),
                ),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () async {
                _refreshTasks();
                Navigator.of(context).pop();
              },
              child: const Text(
                'Serei Smart',
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          child: const Icon(
            size: 35,
            Icons.track_changes_rounded,
            color: Colors.white,
          ),
          onTap: () {
            _showSmart();
          },
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
              color: Colors.white,
              border:
                  Border.all(color: const Color.fromARGB(69, 177, 177, 177)),
              borderRadius: const BorderRadius.all(
                Radius.circular(8.0),
              ),
              boxShadow: const [
                BoxShadow(
                    color: Color.fromARGB(69, 133, 133, 133),
                    blurRadius: 2.0,
                    offset: Offset(0, 2))
              ],
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
                  taskRepository.updateTask(updatedTask);
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
