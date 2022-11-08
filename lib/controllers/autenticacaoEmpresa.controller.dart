import 'package:vacancies_go/models/empresa.model.dart';
import 'package:vacancies_go/repository/empresa.repository.dart';

class AutenticacaoEmpresa {
  EmpresaRepository empresaRepository = EmpresaRepository();

  List<String> listaDeDominiosPermitidos = [
    "gmail.com",
    "yahoo.com",
    "bol.com.r",
    "live.com",
    "outlook.com",
    "hotmail.com",
  ];

  bool validarEmailEmpresa(String emailEmpresa) {
    bool emailValido = false;

    List<String> empresaEDominio = emailEmpresa.split("@");

    if (emailEmpresa.contains("@")) {
      for (var dominio in listaDeDominiosPermitidos) {
        if (empresaEDominio[1] == dominio) {
          emailValido = true;
          break;
        }
      }
    }

    return emailValido;
  }

  bool verificarSeAsSenhasSaoIguaisEmpresa(String senhaum, String senhadois) {
    return senhaum == senhadois;
  }

  bool validarSenhaEmpresa(String senhaEmpresa) {
    bool senhaValida = false;

    if (senhaEmpresa.length >= 8) {
      senhaValida = true;
    }

    return senhaValida;
  }

  Future<bool> _autenticarEmailEmpresa(String emailempresa) async {
    return await empresaRepository.autenticarEmailEmpresa(emailempresa);
  }

  Future<bool> _autenticarSenhaEmpresa(String senhaempresa) async {
    return await empresaRepository.autenticarSenhaEmpresa(senhaempresa);
  }

  Future<bool> validarLoginEmpresa(String email, String senha) async {
    bool emailCadastradoEmpresa = await _autenticarEmailEmpresa(email);
    bool senhaCadastradaEmpresa = await _autenticarSenhaEmpresa(senha);

    if (validarEmailEmpresa(email) &&
        validarSenhaEmpresa(senha) &&
        emailCadastradoEmpresa &&
        senhaCadastradaEmpresa) {
      return true;
    }
    return false;
  }

  Future<void> cadastrarUsuarioEmpresa(EmpresaModel empresaModel) async {
    await empresaRepository.salvarEmpresa(empresaModel);
  }
}
