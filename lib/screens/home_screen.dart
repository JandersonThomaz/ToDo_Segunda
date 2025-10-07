import 'package:app_segunda/data/tarefa_respository.dart';
import 'package:app_segunda/models/tarefa.dart';
import 'package:app_segunda/screens/adicionar_task_screen.dart';
import 'package:app_segunda/services/Tarefa_service.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
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
      body: FutureBuilder(
        future: TarefaRespository().listar(),
        builder: (context, asyncSnapshot) {
          if (asyncSnapshot.hasError) {
            return Center(child: Text("Opa... deu erro!"));
          }

          if (!asyncSnapshot.hasData) {
            return Center(child: Text("Opa... nenhuma tarefa criada!"));
          }

          var tarefas = asyncSnapshot.data!;

          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: tarefas.length,
                  itemBuilder: (context, index) => Card(
                    color: Colors.white,
                    elevation: 0,
                    child: ListTile(
                      leading: Checkbox(
                        value: tarefas[index].finalizada,
                        onChanged: (valor) {
                          setState(() {
                            if (valor == true) {
                              tarefas[index].finalizar();

                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    "Tarefa concluida com sucesso!",
                                  ),
                                ),
                              );
                            } else {
                              tarefas[index].iniciar();

                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("Tarefa iniciada com sucesso!"),
                                ),
                              );
                            }
                          });
                        },
                      ),
                      title: Text(tarefas[index].nome),
                      subtitle: Text(tarefas[index].descricao),
                      trailing: Icon(Icons.more_vert),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AdicionarTaskScreen()),
          ).then((valor) {
            setState(() {});

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Tarefa criada com sucesso!"))
            );
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
