// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:my_tasks/pages/components/button_custom.dart';
import 'package:my_tasks/repositories/user_repository.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final UserRepository _userRepository = UserRepository();

  /*
  String _messageError = '';
  Future<void> _register() async {
    final username = _usernameController.text;
    final password = _passwordController.text;
    final result = await _userRepository.registerUser(username, password);

    result != 1
        ? Navigator.pop(context)
        : setState(() {
            _messageError = 'Usuário existente';
          });
  }
  */

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
                    'assets/images/logo_usercreate.png',
                  ),
                ),
              ),
            ),

            //input_user
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

            //input_password
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

            //buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //cancel
                Container(
                  margin: const EdgeInsets.only(right: 20),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    child: const Text(
                      'Cancelar',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),

                //crete
                ButtonCustom(
                  text: 'Criar',
                  onTap: () async {
                    //_register();

                    try {
                      await _userRepository.createUser(
                        _usernameController.text,
                        _passwordController.text,
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Usuário criado com sucesso!')),
                      );
                      Navigator.pop(context);
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(e.toString())),
                      );
                    }
                  },
                )
              ],
            ),
            /*
            if (_messageError.isNotEmpty)
              Text(_messageError, style: const TextStyle(color: Colors.red))*/
          ],
        ),
      ),
    );
  }
}
