class Tarefa {
  int id;
  String nome;
  String descricao;
  bool finalizada = false;
  
  Tarefa(this.id, this.nome, this.descricao);

  void finalizar(){
    finalizada = true;
  }

  void iniciar(){
    finalizada = false;
  }

  Map<String, Object?> toMap() {
    return {
      "nome": nome,
      "descricao": descricao,
      "finalizada": finalizada ? 1 : 0
    };
  }
  
}