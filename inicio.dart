import 'package:flutter/material.dart';
import 'package:flutter_application_2/Creditos.dart';
import 'package:flutter_application_2/resultado.dart';

class Inicio extends StatefulWidget {
  const Inicio({Key? key});

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  TextEditingController controlador = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: const Text('Créditos'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Creditos(),
                  ),
                );
              },
            ),
            // Adicione mais ListTiles para outros itens do menu, se necessário
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('Resultado:'),
      ),
      body: Column(
        children: [
          TextField(
            controller: controlador,
            // onChanged: (String texto) {
            //   setState(() {});
            // },
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Resultado(controlador.text),
                ),
              );
            },
            child: Text('Verificar'),
          ),
        ],
      ),
    );
  }
}
