import 'package:calculo_imc/views/pessoa.dart';
import 'package:flutter/material.dart';

class TelaResultado extends StatefulWidget {
  const TelaResultado({super.key});

  @override
  State<TelaResultado> createState() => _TelaResultadoState();
}

class _TelaResultadoState extends State<TelaResultado> {
  @override

  Widget build(BuildContext context) {
    
    Pessoa pessoaCalculada = Pessoa();
    
    pessoaCalculada = ModalRoute.of(context)?.settings.arguments as Pessoa;

    String? nome = pessoaCalculada.nome;
    String? imc = pessoaCalculada.imc;
    String? classificacao = pessoaCalculada.classificacao;
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[100],
        title: Text("Resultado IMC"),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Olá, $nome"),
              Text("Seu IMC é de $imc"),
              Text("Sua classificação é $classificacao")
            ],
          ),
        ),
      ),
    );
  }
}