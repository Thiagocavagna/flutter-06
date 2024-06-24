import 'package:flutter/material.dart';

class Mes extends StatelessWidget {
  final String nome;

  const Mes(this.nome, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(
        title: Text(nome),
      ),
      body: Text('O que aconteceu em $nome...'),
    );
  }
}