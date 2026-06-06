import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AlunoApp extends StatefulWidget {
  const AlunoApp({super.key});

  @override
  State<AlunoApp> createState() => _AlunoAppState();
}

class _AlunoAppState extends State<AlunoApp> {
  final nomeController = TextEditingController();
  final nota1Controller = TextEditingController();
  final nota2Controller = TextEditingController();
  String resultado = '';

  Future<void> salvarDados() async {
    final prefs = await SharedPreferences.getInstance();

    String nome = nomeController.text;
    double nota1 = double.tryParse(nota1Controller.text)!;
    double nota2 = double.tryParse(nota2Controller.text)!;

    await prefs.setString('nome', nome);
    await prefs.setDouble('nota1', nota1);
    await prefs.setDouble('nota2', nota2);

    setState(() {
      resultado = 'Dados salvos com sucesso!';
    });
  }

  Future<void> calcularMedia() async {
    final prefs = await SharedPreferences.getInstance();

    String nome = prefs.getString('nome')!;
    double nota1 = prefs.getDouble('nota1')!;
    double nota2 = prefs.getDouble('nota2')!;

    double media = (nota1 + nota2) / 2;

    String status = media >= 6 ? 'Aprovado' : 'Reprovado';

    setState(() {
      resultado = '$nome tem média $media. Situação: $status.';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Notas do Aluno')),
      body: Padding(
        padding: const EdgeInsets.all(16.00),
        child: Column(
          children: [
            TextField(
              controller: nomeController,
              decoration: InputDecoration(labelText: 'Nome do aluno'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: nota1Controller,
              decoration: InputDecoration(labelText: 'Nota 1'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: nota2Controller,
              decoration: InputDecoration(labelText: 'Nota 2'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: salvarDados, child: Text('Salvar Dados')),
            SizedBox(height: 20),
            ElevatedButton(onPressed: calcularMedia, child: Text('Calcular')),
            SizedBox(height: 20),
            Text(
              resultado,
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
