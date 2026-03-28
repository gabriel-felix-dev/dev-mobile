import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(home: Home()));
}

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
        title: Text("Tela de cadastro", 
        style: TextStyle(color: Colors.deepOrange),
        textDirection: te),
      ),
      body: Container(
        padding: const EdgeInsets.all(30),
        color: Colors.blue.shade100,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Cadastro do Usuário",
              style: TextStyle(fontSize: 30, color: Colors.black)),
            const TextField(
              decoration: InputDecoration(
                labelText: "Nome", filled: true, fillColor:Colors.white)),
            const TextField(
              obscureText: true, //Campo de sanha
              decoration: InputDecoration(
                labelText: "Senha", filled: true, fillColor: Colors.white)),
            const TextField(
              decoration: InputDecoration(
                labelText: "Email", filled: true, fillColor: Colors.white)),
            const TextField(
              decoration: InputDecoration(
                labelText: "Telefone", filled: true, fillColor: Colors.white)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children:[
                TextButton(
                  style: ButtonStyle(
                    fixedSize:WidgetStateProperty.all(const Size(200,60)),
                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.0)
                      )
                    ),
                    backgroundColor: MaterialStateProperty.all(Colors.white)),
                    onPressed:() {
                      print("Botão pressionado!");
                    },
                    child: const Text(
                      "Limpar tela",
                      style: TextStyle(color: Colors.blue, fontSize: 16),
                    ),
                ),
                TextButton(
                  style: ButtonStyle(
                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.0)
                      )
                    ),
                    backgroundColor: MaterialStateProperty.all(Colors.white)),
                    onPressed: () {
                      print("Botão pressionado 2!");
                    },
                    child: const Text(
                      "Salvar", 
                      style: TextStyle(color: Colors.blue, fontSize: 16),
                    )
                ),
              ] // children Row
            ),
          ] // children da column
        )
      )
    );
  }
}
