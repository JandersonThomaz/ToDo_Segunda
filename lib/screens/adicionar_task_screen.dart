import 'package:flutter/material.dart';

class AdicionarTaskScreen extends StatelessWidget {
  const AdicionarTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Adicionar tarefa"),
      ),
      body: Column(
        children: [
          TextField(
          )
        ],
      )
    );
  }
  
}