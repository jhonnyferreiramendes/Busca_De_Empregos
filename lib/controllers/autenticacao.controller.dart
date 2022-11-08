import "package:vacancies_go/models/usuario.model.dart";
import 'package:vacancies_go/repository/usuario.repository.dart';

class AutenticacaoController {
  UsuarioRepository userRepository = UsuarioRepository();

  List<String> listaDeDominiosPermitidos = [
    "gmail.com",
    "yahoo.com",
    "bol.com.r",
    "live.com",
    "outlook.com",
    "hotmail.com",
  ];

  bool validarEmail(String email) {
    bool emailValido = false;

    List<String> usuarioEDominio = email.split("@");

    if (email.contains("@")) {
      for (var dominio in listaDeDominiosPermitidos) {
        if (usuarioEDominio[1] == dominio) {
          emailValido = true;
          break;
        }
      }
    }

    return emailValido;
  }

  bool verificarSeAsSenhasSaoIguais(String senha1, String senha2) {
    return senha1 == senha2;
  }

  bool validarSenha(String senha) {
    bool senhaValida = false;

    if (senha.length >= 8) {
      senhaValida = true;
    }

    return senhaValida;
  }

  Future<bool> _autenticarEmail(String email) async {
    return await userRepository.autenticarEmail(email);
  }

  Future<bool> _autenticarSenha(String senha) async {
    return await userRepository.autenticarSenha(senha);
  }

  Future<bool> validarLogin(String email, String senha) async {
    bool emailCadastrado = await _autenticarEmail(email);
    bool senhaCadastrada = await _autenticarSenha(senha);

    if (validarEmail(email) &&
        validarSenha(senha) &&
        emailCadastrado &&
        senhaCadastrada) {
      return true;
    }
    return false;
  }

  Future<void> cadastrarUsuario(UsuarioModel usuarioModel) async {
    await userRepository.salvarUsuario(usuarioModel);
  }
}
