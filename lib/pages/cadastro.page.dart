// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:vacancies_go/models/usuario.model.dart';
import 'package:vacancies_go/controllers/autenticacao.controller.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({Key? key}) : super(key: key);

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  TextEditingController _nomeController = TextEditingController();
  TextEditingController _sexoController = TextEditingController();
  TextEditingController _cidadeController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _passwordconfirmController = TextEditingController();
  TextEditingController _idadeController = TextEditingController();
  TextEditingController _estadoController = TextEditingController();

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
            "PAGINA DE CADASTRO USUARIO",
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
                    controller: _nomeController,
                    decoration:
                        const InputDecoration(labelText: "Nome Completo"),
                  ),
                  //
                  TextFormField(
                    controller: _sexoController,
                    decoration: const InputDecoration(labelText: "Sexo"),
                  ),
                  //
                  TextFormField(
                    controller: _cidadeController,
                    decoration: const InputDecoration(labelText: "Cidade"),
                  ),
                  //
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(labelText: "Email"),
                  ),
                  //
                  TextFormField(
                    controller: _idadeController,
                    decoration: const InputDecoration(labelText: "Idade"),
                  ),
                  //
                  TextFormField(
                    controller: _estadoController,
                    decoration: const InputDecoration(labelText: "Estado"),
                  ),
                  //
                  TextFormField(
                    controller: _passwordController,
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
                    controller: _passwordconfirmController,
                    obscureText: true,
                    obscuringCharacter: '*',
                    decoration: const InputDecoration(
                      labelText: 'Confirmar Senha',
                    ),
                    onChanged: (String textoDigitado) {
                      print(textoDigitado);
                    },
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 24),
                    child: ElevatedButton(
                      onPressed: () async {
                        AutenticacaoController autenticadorController =
                            AutenticacaoController();

                        bool senhasIguais =
                            autenticadorController.verificarSeAsSenhasSaoIguais(
                          _passwordController.text,
                          _passwordconfirmController.text,
                        );

                        bool emailValido = autenticadorController
                            .validarEmail(_emailController.text);
                        bool senhaValida = autenticadorController
                            .validarSenha(_passwordController.text);

                        if (senhasIguais && emailValido && senhaValida) {
                          UsuarioModel usuario = UsuarioModel(
                            nomeDeUsuario: _nomeController.text,
                            email: _emailController.text,
                            senha: _passwordController.text,
                            sexo: _sexoController.text,
                            cidade: _cidadeController.text,
                            idade: _idadeController.text,
                            estado: _estadoController.text,
                          );

                          await autenticadorController
                              .cadastrarUsuario(usuario);

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
