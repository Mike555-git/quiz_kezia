import 'package:flutter/material.dart';
import 'tela.inicial.dart';

void main() => runApp(MenuApp());

class MenuApp extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meu App de Quiz',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: TelaInicial(),
      debugShowCheckedModeBanner: false,
    );
  }
}

