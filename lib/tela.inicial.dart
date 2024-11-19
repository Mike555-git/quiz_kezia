import 'package:flutter/material.dart';
import 'quiz.dart';


// Tela Inicial
class TelaInicial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QUIZ DE CONHECIMENTOS GERAIS'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              'https://d9radp1mruvh.cloudfront.net/media/challenge_img/quiz2.jpg',
              height: 300,
              width: 300,
            ),
            const SizedBox(height: 30),
            const Text(
              'OLÁ! BEM-VINDO AO QUIZ DE CONHECIMENTOS GERAIS',
              style: TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage(title: 'Quiz')),
                );
              },
              child: const Text('Iniciar Quiz'),
            ),
          ],
        ),
      ),
    );
  }
}