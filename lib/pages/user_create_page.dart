import 'package:flutter/material.dart';
import 'package:my_tasks/pages/components/button_custom.dart';

class UserCreatePage extends StatelessWidget {
  const UserCreatePage({super.key});

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

            const SizedBox(
              height: 100,
              child: TextField(
                obscureText: true,
                obscuringCharacter: "*",
                decoration: InputDecoration(
                  label: Text('Repetir senha'),
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock_rounded),
                ),
              ),
            ),

            //Button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ButtonCustom(
                  text: 'Cancelar',
                  onTap: () {},
                  color: Colors.white,
                  colorFont: Colors.black,
                ),
                ButtonCustom(
                  text: 'Criar',
                  onTap: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
