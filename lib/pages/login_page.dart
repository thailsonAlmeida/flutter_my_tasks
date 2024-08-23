import 'package:flutter/material.dart';
import 'package:my_tasks/pages/components/button_custom.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
            const SizedBox(
              height: 200,
              child: Image(
                image: AssetImage(
                  'assets/images/Logo.png',
                ),
              ),
            ),

            //inputs
            const SizedBox(
              height: 100,
              child: TextField(
                decoration: InputDecoration(
                  label: Text('Usuário'),
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
              ),
            ),

            const SizedBox(
              height: 100,
              child: TextField(
                obscureText: true,
                obscuringCharacter: "*",
                decoration: InputDecoration(
                  label: Text('Senha'),
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock_rounded),
                ),
              ),
            ),

            //create
            Container(
              height: 80,
              alignment: AlignmentDirectional.centerEnd,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {},
                    child: const Text(
                      'Criar conta',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),

            //Button
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ButtonCustom(
                  text: 'Acessar',
                  onTap: () {
                    Navigator.pushNamed(context, '/task_page');
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
