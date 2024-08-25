import 'package:flutter/material.dart';
import 'package:my_tasks/pages/components/button_custom.dart';
import 'package:my_tasks/repositories/user_repository.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final UserRepository _userRepository = UserRepository();

  String _messageError = '';

  Future<void> _login() async {
    final username = _usernameController.text;
    final password = _passwordController.text;

    final user = await _userRepository.authenticateUser(username, password);

    user != null
        ? Navigator.pushReplacementNamed(context, '/home')
        : setState(
            () {
              _messageError = 'Usuário ou senha inválida';
            },
          );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
            Container(
              padding: const EdgeInsets.only(top: 10, bottom: 20),
              child: const SizedBox(
                width: 60,
                child: Image(
                  image: AssetImage(
                    'assets/images/logo.png',
                  ),
                ),
              ),
            ),

            //inputs
            SizedBox(
              height: 100,
              child: TextField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  label: Text('Usuário'),
                  labelStyle: TextStyle(color: Colors.black54),
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(),
                ),
                cursorColor: Colors.black54,
              ),
            ),

            SizedBox(
              height: 100,
              child: TextField(
                controller: _passwordController,
                obscureText: true,
                obscuringCharacter: "*",
                decoration: const InputDecoration(
                  label: Text('Senha'),
                  labelStyle: TextStyle(color: Colors.black54),
                  prefixIcon: Icon(Icons.lock_rounded),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(),
                ),
                cursorColor: Colors.black54,
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //create
                Container(
                  margin: const EdgeInsets.only(right: 20),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/register');
                    },
                    child: const Text(
                      'Registrar',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),

                //Button
                ButtonCustom(
                  text: 'Acessar',
                  onTap: () {
                    //Navigator.pushNamed(context, '/home');
                    _login();
                  },
                ),
              ],
            ),
            if (_messageError.isNotEmpty)
              Text(_messageError, style: const TextStyle(color: Colors.red))
          ],
        ),
      ),
    );
  }
}
