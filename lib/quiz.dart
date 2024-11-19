import 'package:flutter/material.dart';
import 'tela.resultado.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Map<String, Object>> _perguntas = [
    {
      'pergunta': '1. Qual é a capital do Brasil?',
      'opcoes': ['São Paulo', 'Brasília', 'Rio de Janeiro', 'Salvador'],
      'respostaCorreta': 'Brasília',
      'imagem': 'https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/2752.png',
    },
    {
      'pergunta': '2. Qual é a capital da França?',
      'opcoes': ['Londres', 'Madrid', 'Paris', 'Berlim'],
      'respostaCorreta': 'Paris',
      'imagem': 'https://images.tcdn.com.br/img/img_prod/695394/bandeira_franca_estampada_uma_face_0_70x1_00m_1521_1_0a00f4a7f1e44f4bac0eff0412b80b58.jpg', 
    },
    {
      'pergunta': '3. Qual é o maior planeta do Sistema Solar?',
      'opcoes': ['Terra', 'Marte', 'Júpiter', 'Saturno'],
      'respostaCorreta': 'Júpiter',
      'imagem': 'https://thumbs.dreamstime.com/z/planeta-jupiter-no-sistema-solar-visto-do-espa%C3%A7o-119182068.jpg', 
    },
    {
      'pergunta': '4. Quantos jogadores tem um time de futebol em campo?',
      'opcoes': ['12', '14', '11', '16'],
      'respostaCorreta': '11',
      'imagem': 'https://images.squarespace-cdn.com/content/v1/586db838d1758e14c21e19c7/1549419539921-RBYOTVP6JCPN9Z2WLN16/FLAMENGO1.png'
    },
    {
      'pergunta': '5. Quem escreveu "Dom Casmurro"?',
      'opcoes': ['Machado de Assis', 'José de Alencar', 'Jorge Amado', 'Clarice Lispector'],
      'respostaCorreta': 'Machado de Assis',
      'imagem': 'https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/authors/1602797769i/22458._UX200_CR0,11,200,200_.jpg', 
    },
    {
      'pergunta': '6. Qual é o maior deserto do mundo?',
      'opcoes': ['Deserto do Saara', 'Deserto da Antártica', 'Deserto de Gobi', 'Deserto de Kalahari'],
      'respostaCorreta': 'Deserto da Antártica',
      'imagem': 'https://mais.opovo.com.br/_midias/jpg/2022/10/11/295x500/1_antartica2_870x480-19934936.jpg', 
    },
    {
      'pergunta': '7. Qual é o nome do super-herói que é conhecido como o "Homem de Ferro"?',
      'opcoes': ['Bruce Wayne', 'Tony Stark', 'Peter Parker', 'Clark Kent'],
      'respostaCorreta': 'Tony Stark',
      'imagem': 'https://upload.wikimedia.org/wikipedia/pt/thumb/b/be/Invincible_Iron_Man_Vol_2_2.jpg/250px-Invincible_Iron_Man_Vol_2_2.jpg', 
    },
    {
      'pergunta': '8. Quem pintou a Mona Lisa?',
      'opcoes': ['Vincent van Gogh', 'Pablo Picasso', 'Leonardo da Vinci', 'Michelangelo'],
      'respostaCorreta': 'Leonardo da Vinci',
      'imagem': 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/ec/Mona_Lisa%2C_by_Leonardo_da_Vinci%2C_from_C2RMF_retouched.jpg/640px-Mona_Lisa%2C_by_Leonardo_da_Vinci%2C_from_C2RMF_retouched.jpg', 
    },
    {
      'pergunta': '9. Em que ano o homem pisou na Lua pela primeira vez?',
      'opcoes': ['1965', '1969', '1972', '1980'],
      'respostaCorreta': '1969',
      'imagem': 'https://ensinarhistoria.com.br/s21/wp-content/uploads/2018/07/homem-lua-232x250.jpg', 
    },
    {
      'pergunta': '10. Qual é a capital da Austrália?',
      'opcoes': ['Sydney', 'Melbourne', 'Canberra', 'Brisbane'],
      'respostaCorreta': 'Canberra',
      'imagem': 'https://images.tcdn.com.br/img/img_prod/695394/bandeira_australia_estampada_uma_face_0_90x1_28m_1013_1_6deb6e9282b054841263393b98eecc81.jpg', 
    },
  ];

  int _indicePergunta = 0;
  int _pontuacao = 0;
  bool _isRespostaCorreta = false;

  void _verificarResposta(String respostaSelecionada) {
    final respostaCorreta = _perguntas[_indicePergunta]['respostaCorreta'] as String;

    setState(() {
      if (respostaSelecionada == respostaCorreta) {
        _pontuacao++;
        _isRespostaCorreta = true;
      } else {
        _isRespostaCorreta = false;
      }

      if (_indicePergunta < _perguntas.length - 2) {
        
        Future.delayed(const Duration(seconds: 1), () {
          setState(() {
            _indicePergunta++;
            _isRespostaCorreta = false;
          });
        });
      } else {
        
        Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => TelaResultado(
            pontuacao: _pontuacao,
            totalPerguntas: _perguntas.length,
          ),
        ),
      ).then((_) {
        
        setState(() {
          _indicePergunta = 0;
          _pontuacao = 0;
        });
      });

      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          
          LinearProgressIndicator(
            value: (_indicePergunta + 1) / _perguntas.length,
            backgroundColor: Colors.grey[200],
            color: Colors.blue,
            minHeight: 10,
          ),
          const SizedBox(height: 20),
          Expanded(
            flex: 7,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                 
                  Text(
                    'Pergunta ${_indicePergunta + 1} de ${_perguntas.length}',
                    style: Theme.of(context).textTheme.headlineSmall,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                 
                  Image.network(
                    _perguntas[_indicePergunta]['imagem'] as String,
                    height: 300, 
                    width: 300,  
                    fit: BoxFit.cover, 
                  ),
                  const SizedBox(height: 20),
                  Text(
                    _perguntas[_indicePergunta]['pergunta'] as String,
                    style: Theme.of(context).textTheme.headlineSmall,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  ...(_perguntas[_indicePergunta]['opcoes'] as List<String>).map((opcao) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: ElevatedButton(
                        key: ValueKey(opcao),
                        onPressed: () => _verificarResposta(opcao),
                        child: Text(opcao),
                      ),
                    );
                  }).toList(),
                  // Feedback de resposta
                  if (_isRespostaCorreta)
                    Text(
                      _isRespostaCorreta ? 'Resposta Correta!' : 'Resposta Errada!',
                      style: TextStyle(
                        fontSize: 20,
                        color: _isRespostaCorreta ? const Color.fromARGB(255, 76, 175, 125) : const Color.fromARGB(255, 244, 54, 111),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}