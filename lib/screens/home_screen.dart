import 'package:app_segunda/screens/adicionar_task_screen.dart';
import 'package:app_segunda/services/Tarefa_service.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen>{

  var tarefas = TarefaService().listarTodas();

  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Olá,", style: TextStyle(fontSize: 16)),
              Text("Janderson", style: TextStyle(fontWeight: FontWeight.w700)),
            ],
          ),
          actions: [
            Icon(Icons.notifications),
            CircleAvatar(child: Icon(Icons.person)),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: tarefas.length,
                itemBuilder: (context, index) => Card(
                  color: Colors.white,
                  elevation: 0,
                  child: ListTile(
                    leading: Text(tarefas[index].id.toString()),
                    title: Text(tarefas[index].nome),
                    subtitle: Text(tarefas[index].descricao),
                    trailing: Icon(Icons.more_vert),
                  ),
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>  AdicionarTaskScreen(),
              ),
            );
          },
          child: Icon(Icons.add),
        ),
      );
  }
  

}