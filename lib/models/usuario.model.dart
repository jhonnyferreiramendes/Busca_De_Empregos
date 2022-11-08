import 'dart:convert';

class UsuarioModel {
  String? nomeDeUsuario;
  String? sexo;
  String? cidade;
  String? email;
  String? senha;
  String? dadosDoUsuario;
  String? idade;
  String? estado;

  UsuarioModel({
    required this.nomeDeUsuario,
    required this.sexo,
    required this.cidade,
    required this.email,
    required this.senha,
    required this.idade,
    required this.estado,
  });

  UsuarioModel.fromMap(Map<String, dynamic> dados) {
    email = dados['email'];
    sexo = dados['sexo'];
    nomeDeUsuario = dados['nome'];
    cidade = dados["cidade"];
    idade = dados["idade"];
    estado = dados["estado"];
  }

  Map<String, dynamic> toJson() {
    return {
      "nomeDeUsuario": nomeDeUsuario,
      "sexo": sexo,
      "cidade": cidade,
      "email": email,
      "senha": senha,
      "idade": idade,
      "estado": estado,
    };
  }

  @override
  String toString() {
    return jsonEncode(toJson());
  }
}
