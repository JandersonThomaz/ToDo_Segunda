import 'package:app_segunda/models/Tarefa.dart';

class TarefaService {
  List<Tarefa> listarTodas(){

    List<Tarefa> tarefas = [];

    var tarefa01 = Tarefa(1, "Limpar a casa", "Porque ela precisa estar limpa");
    var tarefa02 = Tarefa(2, "Estudar flutter", "Para não reprovar");
    var tarefa03 = Tarefa(3, "Lavar louça", "Para a louça não ficar suja");

    tarefas.add(tarefa01);
    tarefas.add(tarefa02);
    tarefas.add(tarefa03);
    tarefas.add(tarefa03);
    

    return tarefas;
  }
}