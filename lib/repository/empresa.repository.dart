import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:vacancies_go/models/empresa.model.dart';

class EmpresaRepository {
  final Future<SharedPreferences> repository = SharedPreferences.getInstance();

  Future<void> salvarEmpresa(EmpresaModel usuario) async {
    SharedPreferences localRepository = await repository;
    await localRepository.setString('usuario', usuario.toString());
  }

  Future<String?> puxarDadosUsuario() async {
    SharedPreferences localRepository = await repository;
    return localRepository.getString("usuario");
  }

  autenticarSenhaEmpresa(String senhaDigitada) async {
    SharedPreferences localRepository = await repository;

    String? dados = localRepository.getString("usuario");

    Map<String, dynamic> dadosDoUsuario = jsonDecode(dados!);

    if (senhaDigitada == dadosDoUsuario["senha"]) {
      return true;
    }
    return false;
  }

  autenticarEmailEmpresa(String emailDigitado) async {
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

    Map<String, dynamic> dadosDaEmpresa = jsonDecode(dados!);

    return dadosDaEmpresa["nomeDeEmpresa"];
  }

  Future<Map<String, dynamic>> retornarNomeEEmailEmpresa() async {
    SharedPreferences localRepo = await repository;

    String? dados = localRepo.getString("usuario");

    Map<String, dynamic> dadosDecodificados = jsonDecode(dados!);

    Map<String, dynamic> nomeEmail = {
      "nome": dadosDecodificados["nomeDeEmpresa"],
      "informacoes": dadosDecodificados["informacoes"],
      "email": dadosDecodificados["email"],
      "cidade": dadosDecodificados["cidade"],
      "cnpj": dadosDecodificados["cnpj"],
      "estado": dadosDecodificados["estado"],
    };

    return nomeEmail;
  }
}
