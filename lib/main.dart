import 'package:app_segunda/services/Tarefa_service.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    var tarefas = TarefaService().listarTodas();

    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.deepPurple,
          foregroundColor: Colors.white
        )
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("App segunda"),           
          ),
        body: ListView.builder(
          itemCount: tarefas.length,
          itemBuilder: (context, index) => ListTile(
            leading: Text(tarefas[index].id.toString()),
            title: Text(tarefas[index].nome),
            subtitle: Text(tarefas[index].descricao),
            trailing: Icon(Icons.more_vert),
          )),
        floatingActionButton: FloatingActionButton(
          onPressed: null,
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
