import 'package:app_segunda/data/db_helper.dart';
import 'package:app_segunda/models/tarefa.dart';
import 'package:sqflite/sql.dart';

class TarefaRespository {
  Future<void> salvar(Tarefa tarefa) async {
    final db = await getDatabase();

    await db.insert(
      "tarefas",
      tarefa.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Tarefa>> listar() async {

    List<Tarefa> tarefas = [];
    final db = await getDatabase();

    var tarefasMaps = await db.query("tarefas");

    for (Map tarefaMap in tarefasMaps) {
      Tarefa tarefa = Tarefa(
        tarefaMap["id"],
        tarefaMap["nome"],
        tarefaMap["descricao"],
      );

      if (tarefaMap["finalizada"] == 1) {
        tarefa.finalizar();
      } 
      else {
        tarefa.iniciar();
      }

      tarefas.add(tarefa);
    }
    return tarefas;
  }
}
