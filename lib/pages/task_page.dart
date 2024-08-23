import 'package:flutter/material.dart';
import 'package:my_tasks/services/github_repos.dart';
import 'package:my_tasks/services/task_list_sreen.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  int _selectedIndex = 0;

  static const TextStyle optionStyle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
  );

  static final List<Widget> _widgetOptions = <Widget>[
    /*Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black12),
        ),
        padding: const EdgeInsets.all(8),
        child: Wrap(
          children: [
            Row(
              verticalDirection: VerticalDirection.down,
              children: [
                SizedBox(
                  width: 50,
                  height: 50,
                  child: GestureDetector(
                    child: const Center(
                        child: Icon(
                      Icons.circle_outlined,
                      size: 40,
                    )),
                    onTap: () {
                      const Text('checked');
                    },
                  ),
                ),
                const Text(
                  'Apresentação do caixa com 5 desing patterns',
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),

            //data
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 48),
                  child: const Text(
                    '16/07/2024',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black54,
                    ),
                  ),
                ),
              ],
            ),

            //editar e excluir
            Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ButtonCustom(
                  text: 'Excluir',
                  width: 71,
                  heith: 32,
                  fontSize: 22,
                  color: Colors.white,
                  colorFont: Colors.black54,
                  onTap: () {
                    'Excluir';
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ButtonCustom(
                  text: 'Editar',
                  width: 71,
                  heith: 32,
                  fontSize: 22,
                  color: Colors.white,
                  colorFont: Colors.black54,
                  onTap: () {
                    'Editar';
                  },
                ),
              ),
            ]),
          ],
        ),
      ),
    ),
    */
    const TaskListScreen(),
    const GitHubRepos(),
    const Center(child: Text('saindo ... em construção')),
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
        /*
        appBar: AppBar(
          leading: const Icon(
            size: 35,
            Icons.track_changes_rounded,
            color: Colors.white,
          ),
          backgroundColor: const Color.fromRGBO(33, 31, 38, 75),
        ),*/
        body: Container(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        /*floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: const Color.fromRGBO(44, 44, 44, 1),
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),*/
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
