import 'package:flutter/material.dart';
import 'package:my_tasks/services/github_repos.dart';
import 'package:my_tasks/pages/login_page.dart';
import 'package:my_tasks/services/task_list_sreen.dart';
import 'package:my_tasks/pages/task_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
      routes: {
        '/github_repos': (context) => const GitHubRepos(),
        '/task_page': (context) => const TaskPage(),
        '/task_list': (context) => const TaskListScreen(),
      },
    );
  }
}
