import 'package:flutter/material.dart';

class AdicionarTaskScreen extends StatelessWidget {
  AdicionarTaskScreen({super.key});

  final tituloController = TextEditingController();
  final descricaoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Adicionar tarefa")),
      body: Column(
        children: [
          //campo do titulo
          Padding(
            padding: EdgeInsets.all(16),
            child: TextField(
              decoration: InputDecoration(
                label: Text("Título"),
                border: OutlineInputBorder(),
                hintText: "Digite o titulo da tarefa",
                floatingLabelBehavior: FloatingLabelBehavior.always,
              ),
              controller: tituloController,
            ),
          ),
          //campo da descrição
          Padding(
            padding: EdgeInsetsGeometry.all(16),
            child: TextField(
              decoration: InputDecoration(
                label: Text("Descrição"),
                border: OutlineInputBorder(),
                hintText: "Digite a descrição da tarefa",
              ),
              controller: descricaoController,
            ),
          ),
          ElevatedButton(
            onPressed: (){}, 
            child: Text("Salvar"),
          ),
        ],
      ),
    );
  }
}
