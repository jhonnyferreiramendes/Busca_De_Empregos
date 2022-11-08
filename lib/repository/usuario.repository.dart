import 'dart:convert';

import 'package:vacancies_go/models/usuario.model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UsuarioRepository {
  final Future<SharedPreferences> repository = SharedPreferences.getInstance();

  Future<void> salvarUsuario(UsuarioModel usuario) async {
    SharedPreferences localRepository = await repository;
    await localRepository.setString('usuario', usuario.toString());
  }

  Future<String?> puxarDadosUsuario() async {
    SharedPreferences localRepository = await repository;
    return localRepository.getString("usuario");
  }

  autenticarSenha(String senhaDigitada) async {
    SharedPreferences localRepository = await repository;

    String? dados = localRepository.getString("usuario");

    Map<String, dynamic> dadosDoUsuario = jsonDecode(dados!);

    if (senhaDigitada == dadosDoUsuario["senha"]) {
      return true;
    }
    return false;
  }

  autenticarEmail(String emailDigitado) async {
    SharedPreferences localRepo = await repository;

    String? dados = localRepo.getString("usuario");

    Map<String, dynamic> dadosDoUsuario = jsonDecode(dados!);

    if (emailDigitado == dadosDoUsuario["email"]) {
      return true;
    }
    return false;
  }

  Future<String?> retornarNomeUsuario() async {
    SharedPreferences localRepo = await repository;

    String? dados = localRepo.getString("usuario");

    Map<String, dynamic> dadosDoUsuario = jsonDecode(dados!);

    return dadosDoUsuario["nomeDeUsuario"];
  }

  Future<Map<String, dynamic>> retornarNomeEEmail() async {
    SharedPreferences localRepo = await repository;

    String? dados = localRepo.getString("usuario");

    Map<String, dynamic> dadosDecodificados = jsonDecode(dados!);

    Map<String, dynamic> nomeEmail = {
      "nome": dadosDecodificados["nomeDeUsuario"],
      "sexo": dadosDecodificados["sexo"],
      "email": dadosDecodificados["email"],
      "cidade": dadosDecodificados["cidade"],
      "idade": dadosDecodificados["idade"],
      "estado": dadosDecodificados["estado"],
    };

    return nomeEmail;
  }
}
