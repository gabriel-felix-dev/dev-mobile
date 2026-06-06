import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List listaFuncionarios = [];

  //Lendos os dados dos funcionários api/json
  Future<void> lerFuncionarios() async {
    var dadosRecebidos = await http.get(Uri.parse('http://127.0.0.1:5000/'));
    setState(() {
      listaFuncionarios = jsonDecode(dadosRecebidos.body);
    });
  }

  // Cadastrar funcionário pela api/json
  Future<void> cadastrarFuncionario(String nomeCadastrado) async {
    var mapFuncionario = {"nomeFuncionario": nomeCadastrado};
    await http.post(
      Uri.parse('http://127.0.0.1:5000/cadastrarFuncionario'),
      headers: {
        "Accept": "application/json",
        "content-type": "application/json",
      },
      body: json.encode(mapFuncionario),
      encoding: Encoding.getByName("utf-8"),
    );
    setState(() {
      lerFuncionarios();
    });
    Navigator.pop(context);
  }

  //Atualiazar funcionario
  Future<void> atualizarFuncionario(int idRecebido, String nomeRecebido) async {
    print(nomeRecebido);
    print(idRecebido);
    var mapFuncionario = {
      "idFuncionario": idRecebido,
      "nomeFuncionario": nomeRecebido,
    };
    await http.put(
      Uri.parse("http://127.0.0.1:5000/atualizaFuncionario"),
      headers: {
        "Accept": "application/json",
        "content-type": "application/json",
      },
      body: json.encode(mapFuncionario),
      encoding: Encoding.getByName("utf-8"),
    );
    setState(() {
      lerFuncionarios();
    });
    Navigator.pop(context);
  }

  //Remover funcionarios pela api/json
  Future<void> deletarFuncionario(int idRecebido) async {
    var mapFuncionario = {"idFuncionario": idRecebido};
    await http.delete(
      Uri.parse("http://127.0.0.1:5000/removerFuncionario"),
      headers: {
        "Accept": "application/json",
        "content-type": "application/json",
      },
      body: json.encode(mapFuncionario),
      encoding: Encoding.getByName("utf-8"),
    );
    setState(() {
      lerFuncionarios();
    });
    Navigator.pop(context);
  }

  //Pesquisar por nome
  Future<void> pesquisarNome(String nomePesquisa) async {
    var dadosRecebidos = await http.get(
      Uri.parse('http://127.0.0.1:5000/pesquisanome/$nomePesquisa'),
    );
    setState(() {
      listaFuncionarios = jsonDecode(dadosRecebidos.body);
    });
    Navigator.pop(context);
  }

  @override
  void initState() {
    //TODO: implement initState -> Comentário para a IA saber o que fazer;
    super.initState();
    lerFuncionarios();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          TextEditingController controllerNome = TextEditingController();
          showDialog(
            context: context,
            //ALERT PARA ADICIONAR NOVOS FUNCIONARIOS
            builder: (context) => AlertDialog(
              title: Text("Adicionar Funcionários"),
              content: TextField(
                controller: controllerNome,
                decoration: InputDecoration(
                  labelText: "Digite o nome do novo funcionário",
                ),
              ),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    cadastrarFuncionario(controllerNome.text);
                  },
                  child: Text("Salvar"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Cancelar"),
                ),
              ],
            ),
          );
        },
        backgroundColor: Colors.green,
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              TextEditingController controllerNomePesquisa =
                  TextEditingController();
              //ALERT PARA PESQUISAR FUNCIONARIOS POR NOME
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text("Pesquisa por nome"),
                  content: TextField(
                    decoration: InputDecoration(
                      labelText: "Digite o nome que deseja encontrar",
                    ),
                    controller: controllerNomePesquisa,
                  ),
                  actions: [
                    ElevatedButton(
                      onPressed: () {
                        pesquisarNome(controllerNomePesquisa.text);
                      },
                      child: Text("Pesquisar"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("Cancelar"),
                    ),
                  ],
                ),
              );
            },
            icon: Icon(color: Colors.white, Icons.search),
          ),
        ],
        title: Text("Cadastro de Funcionários"),
        backgroundColor: Colors.green,
      ),
      body: ListView.builder(
        itemCount: listaFuncionarios.length,
        itemBuilder: (context, index) => ListTile(
          title: Text("Nome:" + listaFuncionarios[index]["nomeFuncionario"]),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: () {
                  TextEditingController controllerNomeEdit =
                      TextEditingController();
                  controllerNomeEdit.text =
                      listaFuncionarios[index]["nomeFuncionario"];
                  //ALERT PARA ATUALIZAR OS DADOS DOS FUNCIONARIOS
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text("Atualiza funcionário"),
                      content: TextField(
                        decoration: InputDecoration(
                          labelText: "Digite o novo nome",
                        ),
                        controller: controllerNomeEdit,
                      ),
                      actions: [
                        ElevatedButton(
                          onPressed: () {
                            atualizarFuncionario(
                              listaFuncionarios[index]["idFuncionario"],
                              controllerNomeEdit.text,
                            );
                          },
                          child: Text("Atualizar"),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text("Cancelar"),
                        ),
                      ],
                    ),
                  );
                },
                icon: Icon(Icons.edit_document),
              ),
              IconButton(
                onPressed: () {
                  //ALERT PARA REMOVER FUNCIONÁRIOS
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text("Deletando um funcionário"),
                      content: Text(
                        "Deseja remover o  funcionário " +
                            listaFuncionarios[index]["nomeFuncionario"] +
                            "?",
                      ),
                      actions: [
                        ElevatedButton(
                          onPressed: () {
                            deletarFuncionario(
                              listaFuncionarios[index]["idFuncionario"],
                            );
                          },
                          child: Text("Deletar"),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text("Cancelar"),
                        ),
                      ],
                    ),
                  );
                },
                icon: Icon(Icons.delete),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
