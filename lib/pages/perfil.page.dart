import 'package:flutter/material.dart';
import 'package:vacancies_go/pages/login.page.dart';
import 'package:vacancies_go/pages/perfil.page.dart';
import 'package:vacancies_go/pages/perfil.page.dart';
import 'package:vacancies_go/repository/usuario.repository.dart';
import 'package:vacancies_go/controllers/home.controller.dart';
import 'package:vacancies_go/models/usuario.model.dart';

class PerfilPage extends StatefulWidget {
  const PerfilPage({Key? key}) : super(key: key);

  @override
  State<PerfilPage> createState() => _PerfilPage();
}

class _PerfilPage extends State<PerfilPage> {
  UsuarioModel? dadosDoUsuario;

  HomeController homeController = HomeController();

  carregarDadosDoUsuario() async {
    UsuarioModel usuarioLocal = await homeController.popularUsuario();
    setState(() {
      dadosDoUsuario = usuarioLocal;
    });
  }

  @override
  void initState() {
    carregarDadosDoUsuario();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil'),
        centerTitle: true,
      ),
      // ignore: prefer_const_constructors
      body: Padding(
        padding: const EdgeInsets.only(),
        child: SingleChildScrollView(
          reverse: true,
          child: Center(
            child: Column(children: [
              Container(
                child: Text("Email do usuário: ${dadosDoUsuario?.email}"),
              ),
              Container(
                child:
                    Text("Nome do usuario: ${dadosDoUsuario?.nomeDeUsuario}"),
              ),
              Container(
                child: Text("Sexo: ${dadosDoUsuario?.sexo}"),
              ),
              Container(
                child: Text("Idade: ${dadosDoUsuario?.idade}"),
              ),
              Container(
                child: Text("Cidade: ${dadosDoUsuario?.cidade}"),
              ),
              Container(
                child: Text("Estado: ${dadosDoUsuario?.estado}"),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
