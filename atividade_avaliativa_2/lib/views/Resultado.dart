import 'package:flutter/material.dart';

class Resultado extends StatefulWidget {
  const Resultado({super.key});

  @override
  State<Resultado> createState() => _ResultadoState();
}

class _ResultadoState extends State<Resultado> {
  @override
  Widget build(BuildContext context) {

    final int resultadoFinal = ModalRoute.of(context)?.settings.arguments as int;

    return Scaffold(appBar: AppBar(
        backgroundColor: Colors.green[900],
        title: Text("Call of Uninassau"),
        centerTitle: true,
      ),
      body: Center(child: Text("Resultado final: $resultadoFinal"),),
    );
  }
}