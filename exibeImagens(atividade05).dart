import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_application_1/imagens.dart';

Future<Imagens> buscaImagem(int numero) async {
  final resposta = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/photos/$numero'));

  if (resposta.statusCode == 200) {
    // 200 é OK
    return Imagens.fromJson(jsonDecode(resposta.body) as Map<String, dynamic>);
  } else {
    throw Exception('Falha ao carregar poste.');
  }
}

class NovaTela extends StatefulWidget {
  const NovaTela({super.key});

  @override
  State<NovaTela> createState() => _NovaTelaState();
}

class _NovaTelaState extends State<NovaTela> {
  late Future<Imagens> futuroImagem;
  int contador = 1;
  void novoPoste() {
    setState(() {
      contador++;
      futuroImagem = buscaImagem(contador);
    });
  }

  @override
  void initState() {
    super.initState();
    futuroImagem = buscaImagem(1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mostrando imagem:'),
      ),
      body: Center(
        child: FutureBuilder<Imagens>(
          future: futuroImagem,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Scaffold(
                body: Column(
                  children: [
                    Image.network(snapshot.data!.url),
                    ElevatedButton(
                        onPressed: novoPoste, child: const Text('Nova Imagem'))
                  ],
                ),
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            // By default, show a loading spinner.
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
