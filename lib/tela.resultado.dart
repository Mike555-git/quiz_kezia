import 'package:flutter/material.dart';



class TelaResultado extends StatelessWidget {
  final int pontuacao;
  final int totalPerguntas;

  const TelaResultado({super.key, required this.pontuacao, required this.totalPerguntas});

  @override
  Widget build(BuildContext context) {
    
    String mensagemResultado;
    String imagemResultado;

    if (pontuacao >= 1 && pontuacao <= 4) {
      mensagemResultado = 'MUITO RUIM';
      imagemResultado = 'https://d9radp1mruvh.cloudfront.net/media/challenge_img/quiz2.jpg'; 
    } else if (pontuacao >= 5 && pontuacao <= 6) {
      mensagemResultado = 'DA PRA FAZER MELHOR';
      imagemResultado = 'https://d9radp1mruvh.cloudfront.net/media/challenge_img/quiz2.jpg'; 
    } else if (pontuacao >= 8 && pontuacao <= 9) {
      mensagemResultado = 'BOA CARA';
      imagemResultado = 'https://d9radp1mruvh.cloudfront.net/media/challenge_img/quiz2.jpg'; 
      mensagemResultado = 'MANDOU BRASA PARABÉNS';
      imagemResultado = 'https://d9radp1mruvh.cloudfront.net/media/challenge_img/quiz2.jpg'; 
    } else {
      
      mensagemResultado = 'Tente novamente!';
      imagemResultado = 'https://d9radp1mruvh.cloudfront.net/media/challenge_img/quiz2.jpg'; 
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Resultado final'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            
            Image.network(
              imagemResultado,
              height: 300,
              width: 300,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20),
            Text(
              mensagemResultado,
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
             Text(
              'Sua pontuação foi:$pontuacao',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 10),
            Text(
              '$pontuacao / $totalPerguntas',
              style: const TextStyle(fontSize: 36, color: Color.fromARGB(255, 175, 76, 76)),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); 
              },
              child: const Text('Voltar ao Menu Principal'),
            ),
          ],
        ),
      ),
    );
  }
}
