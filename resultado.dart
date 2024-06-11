import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Resultado extends StatelessWidget {
  String _textoRecebido;

  Resultado(this._textoRecebido, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resultado:'),
      ),
      body: Center(
        child: Column(children: [
          criaContainer(_textoRecebido, 20.0, GoogleFonts.sevillana()),
          criaContainer(_textoRecebido, 20.0, GoogleFonts.roboto()),
          criaContainer(_textoRecebido, 20.0, GoogleFonts.sourceCodePro()),
          // Image.asset('assets/imagens/pencil.png'),
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Image.asset('assets/imagens/pencil.png')),
        ]),
      ),
    );
  }

  Container criaContainer(String texto, double espaco, TextStyle fonte) {
    return Container(
        padding: EdgeInsets.all(espaco), child: criaTexto(texto, fonte));
  }

  Text criaTexto(String texto, TextStyle estilo) {
    return Text(
      texto,
      style: estilo,
    );
  }
}
