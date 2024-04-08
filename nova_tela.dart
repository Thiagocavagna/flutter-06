import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class NovaTela extends StatefulWidget {
  const NovaTela({Key? key}) : super(key: key);

  @override
  _NovaTelaState createState() => _NovaTelaState();
}

class _NovaTelaState extends State<NovaTela> {
  List<String> titulos = [];
  int contador = 1;

  @override
  void initState() {
    super.initState();
    // Buscar o primeiro post ao inicializar a tela
    buscaEAdicionaPost(contador);
  }

  Future<void> buscaEAdicionaPost(int numero) async {
    final resposta = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/posts/$numero'));

    if (resposta.statusCode == 200) {
      // Se a resposta for bem-sucedida, adiciona o título à lista
      final jsonPost = jsonDecode(resposta.body) as Map<String, dynamic>;
      setState(() {
        titulos.add(jsonPost['title'] as String);
      });
    } else {
      throw Exception('Falha ao carregar poste.');
    }
  }

  void novoPoste() {
    // Incrementar o contador e buscar o próximo post
    contador++;
    buscaEAdicionaPost(contador);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mostrando postes:'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: titulos.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(titulos[index]),
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: novoPoste,
            child: const Text('Novo poste'),
          ),
        ],
      ),
    );
  }
}
