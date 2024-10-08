import 'package:flutter/material.dart';
import 'package:my_tasks/pages/register_page.dart';
import 'package:my_tasks/services/github_repos.dart';
import 'package:my_tasks/pages/login_page.dart';
import 'package:my_tasks/services/task_list_sreen.dart';
import 'package:my_tasks/pages/task_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/home': (context) => const TaskPage(),
        '/task_list': (context) => const TaskListScreen(),
        '/github_repos': (context) => const GitHubRepos(),
      },
    );
  }
}
