import 'package:flutter/material.dart';
import 'package:pratica_navigator/views/tela1.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tela inicial"),
        centerTitle: true,
      ),
      body: Center(
        child: TextButton(
          style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.amber)),
          onPressed: (){
          Navigator.push(context,
          MaterialPageRoute(
            builder: (context) => Tela1(),
            settings: RouteSettings(arguments: "Gabriel Felix")));
        }, 
        child: Text(
          "Mudar de rota"))),
    );
  }
}