import 'dart:convert';

class EmpresaModel {
  String? nomeDaEmpresa;
  String? cnpj;
  String? cidade;
  String? informacoes;
  String? estado;
  String? email;
  String? senha;

  EmpresaModel({
    required this.nomeDaEmpresa,
    required this.cnpj,
    required this.cidade,
    required this.informacoes,
    required this.estado,
    required this.email,
    required this.senha,
  });

  EmpresaModel.fromMap(Map<String, dynamic> dadosempresa) {
    nomeDaEmpresa = dadosempresa['nomeDeEmpresa'];
    cidade = dadosempresa["cidade"];
    informacoes = dadosempresa["informacoes"];
    estado = dadosempresa["estado"];
    cnpj = dadosempresa["cnpj"];
  }

  Map<String, dynamic> toJson() {
    return {
      "nomeDeEmpresa": nomeDaEmpresa,
      "cidade": cidade,
      "informacoes": informacoes,
      "estado": estado,
      "cnpj": cnpj,
      "email": email,
      "senha": senha,
    };
  }

  @override
  String toString() {
    return jsonEncode(toJson());
  }
}
