import 'package:flutter/material.dart';

class Resultado extends StatefulWidget {
  const Resultado({super.key});

  @override
  State<Resultado> createState() => _ResultadoState();
}

class _ResultadoState extends State<Resultado> {
  Widget statusPatente(int totalPontos) {
    if (totalPontos >= 60) {
      return const Text('Você subiu de patente!',
        style: TextStyle(fontSize: 18),
        textAlign: TextAlign.center,);
    }

    if (totalPontos >= 21) {
      return const Text('Você manteve a sua patente.',
        style: TextStyle(fontSize: 18),
        textAlign: TextAlign.center,);
    }

    if (totalPontos < 21) {
      return const Text('Você foi rebaixado.',
        style: TextStyle(fontSize: 18),
        textAlign: TextAlign.center,);
    }

    return const Text('Erro no cálculo.');
  }

  @override
  Widget build(BuildContext context) {
    final int resultadoFinal =
        ModalRoute.of(context)?.settings.arguments as int;

    return Scaffold(
      appBar: AppBar(title: const Text('Call of Uninassau'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Resultado MD10: $resultadoFinal pontos',
              style: const TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            statusPatente(resultadoFinal),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Voltar'),
            ),
          ],
        ),
      ),
    );
  }
}
