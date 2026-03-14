import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: Home()));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Somador de cliques'),
        ),
        // body: Center(child: Text('Você precionou o botão $_count veze(s).')), // Body original 
        // body: Container( // Body Container
        //   width: 200,
        //   height: 200,
        //   padding: EdgeInsets.all(50.0),
        //   color: Colors.lightBlueAccent,
        //   child: Text('Olá, Flutter', style: TextStyle(color: Colors.white),),
        // ),
        // body: Column( // Body column
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     Container(
        //       width: 80,
        //       height: 80,
        //       decoration: BoxDecoration(
        //         color: Colors.red, 
        //         shape: BoxShape.circle
        //       ),
        //     ),
        //     SizedBox(height: 15),
        //     Container(
        //       width: 80,
        //       height: 80,
        //       decoration: BoxDecoration(
        //         color: Colors.yellow, 
        //         shape: BoxShape.circle
        //       ),
        //     ),
        //     SizedBox(height: 15),
        //     Container(
        //       width: 80,
        //       height: 80,
        //       decoration: BoxDecoration(
        //         color: Colors.green,
        //         shape: BoxShape.circle
        //       )
        //     )
        //   ] 
        // ),
        body: Row(
          children: [Icon(
            Icons.account_circle, size: 40,
            color: Colors.blue),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                'Nome de usuário',
                style: TextStyle(fontSize:18,
                fontWeight: FontWeight.bold),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Seguir'),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => setState(() => _count++),
          tooltip: 'Increment Counter',
          child: const Icon(Icons.add),
      ),
    );
  }
}
