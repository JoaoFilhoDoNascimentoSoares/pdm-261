// 14-agregacao.dart  
// Agregação e Composição
import 'dart:convert';

class Dependente {
  late String _nome;

  Dependente(String nome) {
    this._nome = nome;
  }

  Map<String, dynamic> toMap() {
    return {'nome': _nome};
  }
}

class Funcionario {
  late String _nome;
  late List<Dependente> _dependentes;

  Funcionario(String nome, List<Dependente> dependentes) {
    this._nome = nome;
    this._dependentes = dependentes;
  }

  Map<String, dynamic> toMap() {
    return {
      'nome': _nome,
      'dependentes': _dependentes.map((d) => d.toMap()).toList(),
    };
  }
}

class EquipeProjeto {
  late String _nomeProjeto;
  late List<Funcionario> _funcionarios;

  EquipeProjeto(String nomeprojeto, List<Funcionario> funcionarios) {
    _nomeProjeto = nomeprojeto;
    _funcionarios = funcionarios;
  }

  Map<String, dynamic> toMap() {
    return {
      'nomeProjeto': _nomeProjeto,
      'funcionarios': _funcionarios.map((f) => f.toMap()).toList(),
    };
  }
}

void main() {
  // 1. Criar varios objetos Dependentes
  Dependente dep1 = Dependente('Ana');
  Dependente dep2 = Dependente('Pedro');
  Dependente dep3 = Dependente('Carla');
  Dependente dep4 = Dependente('Lucas');

  // 2. Criar varios objetos Funcionario
  // 3. Associar os Dependentes criados aos respectivos funcionarios
  Funcionario func1 = Funcionario('Carlos', [dep1, dep2]);
  Funcionario func2 = Funcionario('Mariana', [dep3]);
  Funcionario func3 = Funcionario('Roberto', [dep4]);

  // 4. Criar uma lista de Funcionarios
  List<Funcionario> equipe = [func1, func2, func3];

  // 5. Criar um objeto EquipeProjeto com nome e lista de funcionários
  EquipeProjeto projeto = EquipeProjeto('Projeto PDM-261', equipe);

  // 6. Printar no formato JSON o objeto EquipeProjeto
  String json = jsonEncode(projeto.toMap());
  print(json);
}
