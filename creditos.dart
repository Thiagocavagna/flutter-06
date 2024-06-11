import 'package:flutter/material.dart';

class Creditos extends StatefulWidget {
  const Creditos({Key? key}) : super(key: key);

  @override
  State<Creditos> createState() => _CreditosState();
}

class _CreditosState extends State<Creditos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Créditos'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Settings icon by Ravindra Kalkani ([https://iconscout.com/contributors/ravindra-kalkani])',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
