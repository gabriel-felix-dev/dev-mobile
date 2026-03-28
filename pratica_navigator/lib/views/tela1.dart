import 'package:flutter/material.dart';

class Tela1 extends StatefulWidget {
  const Tela1({super.key});

  @override
  State<Tela1> createState() => _Tela1State();
}

class _Tela1State extends State<Tela1> {
  @override
  Widget build(BuildContext context) {

    String nomeRecebido = ModalRoute.of(context)?.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title:Text("Titulo tela 1",),
      ),
      body: Center(
        child: Text("Minha tela 1 \nautor - $nomeRecebido",),
      ),
    );
  }
}