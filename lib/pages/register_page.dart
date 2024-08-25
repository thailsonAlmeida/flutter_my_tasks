import 'package:flutter/material.dart';
import 'package:my_tasks/pages/components/button_custom.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
              child: const Image(
                image: AssetImage(
                  'assets/images/logo_usercreate.png',
                ),
              ),
            ),

            //inputs
            const SizedBox(
              height: 100,
              child: TextField(
                decoration: InputDecoration(
                    label: Text('Usuário'),
                    labelStyle: TextStyle(color: Colors.black54),
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder()),
                cursorColor: Colors.black54,
              ),
            ),

            const SizedBox(
              height: 100,
              child: TextField(
                obscureText: true,
                obscuringCharacter: "*",
                decoration: InputDecoration(
                    label: Text('Senha'),
                    labelStyle: TextStyle(color: Colors.black54),
                    prefixIcon: Icon(Icons.lock_rounded),
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder()),
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
                      Navigator.pushNamed(context, '/login');
                    },
                    child: const Text(
                      'Cancelar',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),

                //Button
                ButtonCustom(
                  text: 'Criar',
                  onTap: () {},
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
