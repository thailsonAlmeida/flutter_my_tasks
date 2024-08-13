import 'package:flutter/material.dart';

class Task extends StatefulWidget {
  const Task({super.key});

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  int _selectedIndex = 0;

  static const TextStyle optionStyle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
  );

  static final List<Widget> _widgetOptions = <Widget>[
    const Row(
      children: [
        Icon(Icons.abc),
        Text('Apresentação do caixa com 5 desing patterns'),
        Text('16/07/2024'),
        Text('Excluir'),
        Text('Editar'),
      ],
    ),
    const Text(
      'Index 1: Pesquisar',
      style: optionStyle,
    ),
    const Text(
      'Index 2: Sair',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: const Icon(
            size: 35,
            Icons.track_changes_rounded,
            color: Colors.white,
          ),
          backgroundColor: const Color.fromRGBO(33, 31, 38, 75),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: _widgetOptions.elementAt(_selectedIndex),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: const Color.fromRGBO(44, 44, 44, 1),
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        bottomNavigationBar: SizedBox(
          height: 100,
          child: BottomNavigationBar(
            backgroundColor: Colors.black,
            items: const <BottomNavigationBarItem>[
              //task
              BottomNavigationBarItem(
                icon: Icon(
                  size: 35,
                  Icons.track_changes_rounded,
                  color: Colors.white,
                ),
                label: 'Task',
              ),
              //search
              BottomNavigationBarItem(
                icon: Icon(
                  size: 35,
                  Icons.search,
                  color: Colors.white,
                ),
                label: 'Pesquisar',
              ),
              //exit
              BottomNavigationBarItem(
                icon: Icon(
                  size: 35,
                  Icons.exit_to_app_rounded,
                  color: Colors.white,
                ),
                label: 'Sair',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: const Color.fromARGB(255, 255, 255, 255),
            onTap: _onItemTapped,
          ),
        ),
      ),
    );
  }
}
