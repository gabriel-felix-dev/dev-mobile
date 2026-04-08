import 'package:atividade_avaliativa_2/views/Resultado.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController quantidadeVitorias = TextEditingController();
  TextEditingController quantidadeEmpates = TextEditingController();
  TextEditingController quantidadeDerrotas = TextEditingController();

  late int vitorias;
  late int empates;
  late int derrotas;
  late int resultadoFinal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[900],
        title: Text("Call of Uninassau"),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.green[800],
        padding: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Preencha os campos abaixo com a quantidade de vitórias, derrotas e empate na MD10:"),
            TextField(
              decoration: InputDecoration(label: Text("Quantidade de vitórias: ")),
              controller: quantidadeVitorias,
            ),
            TextField(
              decoration: InputDecoration(label: Text("Quantidade de empates: ")),
              controller: quantidadeEmpates,
            ),
            TextField(
              decoration: InputDecoration(label: Text("Quantidade de derrotas: ")),
              controller: quantidadeDerrotas,
            ),
            ElevatedButton(onPressed: () {
              setState(() {
                vitorias = int.parse(quantidadeVitorias.text);
                empates = int.parse(quantidadeEmpates.text);
                derrotas =int.parse(quantidadeDerrotas.text);
                resultadoFinal = (vitorias * 10) + (empates * 5) + (derrotas * -2);
              });

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Resultado(),
                  settings: RouteSettings(
                    arguments: resultadoFinal
                  ) 
                  ),
                );
            }, child: Text("Resultado")),
          ],
        )
      ),
    );
  }
}