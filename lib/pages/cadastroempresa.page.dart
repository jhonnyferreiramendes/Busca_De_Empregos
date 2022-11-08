import 'package:flutter/material.dart';
import 'package:vacancies_go/models/empresa.model.dart';
import 'package:vacancies_go/controllers/autenticacao.controller.dart';

import '../controllers/autenticacaoEmpresa.controller.dart';

class CadastroEmpresa extends StatefulWidget {
  const CadastroEmpresa({Key? key}) : super(key: key);

  @override
  State<CadastroEmpresa> createState() => _CadastroEmpresa();
}

class _CadastroEmpresa extends State<CadastroEmpresa> {
  TextEditingController _nomeempresaController = TextEditingController();
  TextEditingController _cnpjController = TextEditingController();
  TextEditingController _informacoesController = TextEditingController();
  TextEditingController _cidadeController = TextEditingController();
  TextEditingController _estadoController = TextEditingController();
  TextEditingController _emailEmpController = TextEditingController();
  TextEditingController _passwordEmpController = TextEditingController();
  TextEditingController _passwordconfirmEmpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
            colors: [Colors.blue, Colors.red],
          ))),
          elevation: 0,
          title: const Text(
            "PAGINA DE CADASTRO EMPRESA",
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ),

        // Parte de Preenchimento de dados
        body: SingleChildScrollView(
          reverse: true,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              child: Column(
                children: <Widget>[
                  //
                  TextFormField(
                    controller: _nomeempresaController,
                    decoration:
                        const InputDecoration(labelText: "Nome Empresa"),
                  ),
                  //
                  TextFormField(
                    controller: _cnpjController,
                    decoration: const InputDecoration(labelText: "Cnpj"),
                  ),
                  //
                  TextFormField(
                    controller: _informacoesController,
                    decoration: const InputDecoration(labelText: "Informacoes"),
                  ),
                  //
                  TextFormField(
                    controller: _cidadeController,
                    decoration: const InputDecoration(labelText: "Cidade"),
                  ),
                  //
                  TextFormField(
                    controller: _estadoController,
                    decoration: const InputDecoration(labelText: "Estado"),
                  ),
                  //
                  TextFormField(
                    controller: _emailEmpController,
                    decoration: const InputDecoration(labelText: "Email"),
                  ),
                  //
                  TextFormField(
                    controller: _passwordEmpController,
                    obscureText: true,
                    obscuringCharacter: '*',
                    decoration: const InputDecoration(
                      labelText: 'Senha',
                    ),
                    onChanged: (String textoDigitado) {
                      print(textoDigitado);
                    },
                  ),
                  TextFormField(
                    controller: _passwordconfirmEmpController,
                    obscureText: true,
                    obscuringCharacter: '*',
                    decoration: const InputDecoration(
                      labelText: 'Confirmar Senha',
                    ),
                    onChanged: (String textoDigitadoEmpresa) {
                      print(textoDigitadoEmpresa);
                    },
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 24),
                    child: ElevatedButton(
                      onPressed: () async {
                        AutenticacaoEmpresa autenticacaoEmpresa =
                            AutenticacaoEmpresa();

                        bool senhasIguais = autenticacaoEmpresa
                            .verificarSeAsSenhasSaoIguaisEmpresa(
                          _passwordEmpController.text,
                          _passwordconfirmEmpController.text,
                        );

                        bool emailValido = autenticacaoEmpresa
                            .validarEmailEmpresa(_emailEmpController.text);
                        bool senhaValida = autenticacaoEmpresa
                            .validarSenhaEmpresa(_passwordEmpController.text);

                        if (senhasIguais && emailValido && senhaValida) {
                          EmpresaModel empresaModel = EmpresaModel(
                            nomeDaEmpresa: _nomeempresaController.text,
                            cnpj: _cnpjController.text,
                            cidade: _cidadeController.text,
                            informacoes: _informacoesController.text,
                            estado: _estadoController.text,
                            email: _emailEmpController.text,
                            senha: _passwordEmpController.text,
                          );

                          await autenticacaoEmpresa
                              .cadastrarUsuarioEmpresa(empresaModel);

                          Navigator.pop(context);
                        } else {
                          print("Senhas iguais $senhasIguais");
                          print("Email valido $emailValido");
                          print("Senha valida $senhaValida");
                        }
                      },
                      child: Text("Cadastrar Dados"),
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(300, 40),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
