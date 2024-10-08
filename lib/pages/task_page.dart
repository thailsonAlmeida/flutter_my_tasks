import 'package:flutter/material.dart';
import 'package:my_tasks/pages/login_page.dart';
import 'package:my_tasks/services/github_repos.dart';
import 'package:my_tasks/services/task_list_sreen.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const TaskListScreen(),
    const GitHubRepos(),
    const Text('saindo')
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 2) {
      _logout();
    }
  }

  void _logout() {
    // Limpar dados persistentes, como SharedPreferences

    // Navegar para a tela de login
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: SizedBox(
        height: 100,
        child: BottomNavigationBar(
          backgroundColor: Colors.black,
          items: const <BottomNavigationBarItem>[
            //TaskPage
            BottomNavigationBarItem(
              icon: Icon(
                size: 35,
                Icons.track_changes_rounded,
                color: Colors.white,
              ),
              label: 'Tasks',
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
    );
  }
}
