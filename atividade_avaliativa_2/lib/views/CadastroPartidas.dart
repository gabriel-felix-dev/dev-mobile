import 'package:atividade_avaliativa_2/views/Resultado.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController quantidadeVitorias = TextEditingController();
  final TextEditingController quantidadeEmpates = TextEditingController();
  final TextEditingController quantidadeDerrotas = TextEditingController();

  late int vitorias;
  late int empates;
  late int derrotas;
  late int resultadoFinal;
  late int validacao;

  void mostrarAlerta(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Atenção!'),
          content: const Text('Preencha todos os campos corretamente.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Call of Uninassau'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Preencha os campos abaixo com a quantidade de vitórias, empates e derrotas na MD10:',
            ),
            const SizedBox(height: 20),
            TextField(
              keyboardType: TextInputType.number,
              controller: quantidadeVitorias,
              decoration: const InputDecoration(
                labelText: 'Quantidade de vitórias',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              keyboardType: TextInputType.number,
              controller: quantidadeEmpates,
              decoration: const InputDecoration(
                labelText: 'Quantidade de empates',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              keyboardType: TextInputType.number,
              controller: quantidadeDerrotas,
              decoration: const InputDecoration(
                labelText: 'Quantidade de derrotas',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  vitorias = int.tryParse(quantidadeVitorias.text) ?? 0;
                  empates = int.tryParse(quantidadeEmpates.text) ?? 0;
                  derrotas = int.tryParse(quantidadeDerrotas.text) ?? 0;
                  validacao = vitorias + empates + derrotas;

                  if (validacao == 10) {
                    resultadoFinal =
                        (vitorias * 10) + (empates * 5) + (derrotas * -2);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Resultado(),
                        settings: RouteSettings(arguments: resultadoFinal),
                      ),
                    );
                  } else {
                    mostrarAlerta(context);
                  }
                });
              },
              child: const Text('Resultado'),
            ),
          ],
        ),
      ),
    );
  }
}
