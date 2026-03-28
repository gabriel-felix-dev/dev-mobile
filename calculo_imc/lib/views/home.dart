import 'package:calculo_imc/views/pessoa.dart';
import 'package:calculo_imc/views/telaResultado.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController controllerNome = TextEditingController();
  TextEditingController controllerPeso = TextEditingController();
  TextEditingController controllerAltura = TextEditingController();

  late double peso;
  late double altura;

  Pessoa pessoa = Pessoa();

  String classificacaoIMC(double imc){
    if (imc <= 18.5){
      return "Abaixo do normal";
    }
    else if(imc <= 24.9){
      return "Normal";
    }
    else if(imc <= 29.9){
      return "Sobrepeso";
    }
    else if(imc <= 34.9){
      return "Obesidade grau I";
    }
    else if(imc <= 39.9){
      return "Obesidade grau II";
    }
    else{
      return "Obesidade grau III";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              decoration: InputDecoration(label: Text("Insira seu nome",),),
              controller: controllerNome,
            ),
            TextField(
              decoration: InputDecoration(label: Text("Insira seu peso: "),),
              controller: controllerPeso,
            ),
            TextField(
              decoration: InputDecoration(label:Text("Insira sua altura: ",),),
              controller: controllerAltura,
            ),
            ElevatedButton(
              onPressed: (){
                setState(() {
                  pessoa.nome = controllerNome.text;
                  peso = double.parse(controllerPeso.text);
                  altura = double.parse(controllerAltura.text);
                  
                  double calculoImc = peso / (altura * altura);
                  
                  pessoa.imc = calculoImc.toStringAsFixed(2) ;
                  pessoa.classificacao = classificacaoIMC(calculoImc);
                });
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TelaResultado(),
                    settings: RouteSettings(arguments: pessoa,), 
                    ), 
                  );
              }, 
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Colors.blue[300])
              ),
              child: Text(
                "Calcular",
                )
              ),
          ],
        ),
      ),
    );
  }
}