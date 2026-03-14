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
        body: Center(child: Text('Você precionou o botão $_count veze(s).')),
        floatingActionButton: FloatingActionButton(
          onPressed: () => setState(() => _count++),
          tooltip: 'Increment Counter',
          child: const Icon(Icons.add),
      ),
    );
  }
}
