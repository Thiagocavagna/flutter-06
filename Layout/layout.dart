import 'package:flutter/material.dart';

/// Flutter code sample for [LayoutBuilder].

void main() => runApp(const LayoutBuilderExampleApp());

class LayoutBuilderExampleApp extends StatelessWidget {
  const LayoutBuilderExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LayoutBuilderExample(),
    );
  }
}

class LayoutBuilderExample extends StatelessWidget {
  const LayoutBuilderExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('LayoutBuilder Example')),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth <= 400) {
            return _buildNormalContainer();
          } else if (constraints.maxWidth > 400 &&
              constraints.maxWidth <= 800) {
            return _build2WideContainers();
          } else {
            return _build3WideContainers();
          }
        },
      ),
    );
  }

  Widget _buildNormalContainer() {
    return Center(
      child: Container(
        height: 100.0,
        width: 100.0,
        color: Colors.red,
      ),
    );
  }

  Widget _build2WideContainers() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            height: 180.0,
            width: 180.0,
            color: Colors.red,
          ),
          Container(
            height: 180.0,
            width: 180.0,
            color: Colors.yellow,
          ),
        ],
      ),
    );
  }

  Widget _build3WideContainers() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            height: 250.0,
            width: 250.0,
            color: Colors.red,
          ),
          Container(
            height: 250.0,
            width: 250.0,
            color: Colors.yellow,
          ),
          Container(
            height: 250.0,
            width: 250.0,
            color: Colors.green,
          ),
        ],
      ),
    );
  }
}
