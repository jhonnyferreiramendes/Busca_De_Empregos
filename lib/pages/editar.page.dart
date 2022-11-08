import 'package:flutter/material.dart';

class Editar extends StatelessWidget {
  const Editar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'Editar is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
