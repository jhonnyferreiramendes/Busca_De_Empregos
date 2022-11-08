import 'package:flutter/material.dart';
import 'package:vacancies_go/pages/cadastro.page.dart';
import 'package:vacancies_go/pages/cadastroempresa.page.dart';
import 'package:vacancies_go/pages/home.page.dart';
import 'package:vacancies_go/utils/constantes.dart';
import 'package:vacancies_go/repository/usuario.repository.dart';
import 'package:vacancies_go/controllers/autenticacao.controller.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key? key, required this.title}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = TextEditingController();

  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Container(
            //decoration: BoxDecoration(
            //gradient: LinearGradient(
            //colors: [Colors.blue, Colors.red],
            // )),
            ),
      ),
      // APLICAÇÃO
      body: SingleChildScrollView(
        reverse: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: <Widget>[
              // LOGO DO APLICATIVO
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Image.asset(
                  ConstantesVacanciesGo.logo,
                  height: 200,
                  width: 200,
                ),
              ),
              //
              // CAMPOS DE CREDENCIAIS
              // email
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                  ),
                ),
              ),
              // senha
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                obscuringCharacter: '*',
                decoration: const InputDecoration(
                  labelText: 'Senha',
                ),
              ),
              // BOTÕES DE ACESSO
              // ENTRAR
              Container(
                padding: const EdgeInsets.only(top: 30),
                width: 300,
                height: 68,
                child: ElevatedButton(
                  onPressed: () async {
                    AutenticacaoController autenticadorController =
                        AutenticacaoController();

                    bool dadosValidos =
                        await autenticadorController.validarLogin(
                      _emailController.text,
                      _passwordController.text,
                    );

                    if (dadosValidos) {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage()),
                        ModalRoute.withName('/home'),
                      );
                    } else {
                      print("FALHA NA AUTENTICACAO");
                    }
                  },
                  style: ElevatedButton.styleFrom(primary: Colors.green),
                  child: const Text('ENTRAR'),
                ),
              ),

              // LINHA DIVISORIA
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: Divider(
                  color: Colors.white,
                  thickness: 2,
                ),
              ),

              // Cadastro
              SizedBox(
                width: 300,
                height: 38,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) => CadastroPage()),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(primary: Colors.lightBlue),
                  child: const Text('CADASTRAR PESSOA'),
                ),
              ),

              const Padding(
                padding: EdgeInsets.only(top: 10),
                child: Divider(
                  color: Colors.white,
                  thickness: 2,
                ),
              ),

              SizedBox(
                width: 300,
                height: 38,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) => CadastroEmpresa()),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(primary: Colors.orange),
                  child: const Text('CADASTRAR EMPRESA'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
