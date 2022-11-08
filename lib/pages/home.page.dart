import 'package:flutter/material.dart';
import 'package:vacancies_go/pages/empresa.page.dart';
import 'package:vacancies_go/pages/login.page.dart';
import 'package:vacancies_go/pages/perfil.page.dart';
import 'package:vacancies_go/controllers/home.controller.dart';
import 'package:vacancies_go/models/usuario.model.dart';

import '../utils/constantes.dart';
import 'editar.page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      //
      appBar: AppBar(
        flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
          colors: [Colors.blue, Colors.red],
        ))),
        title: Text(
          "Bem Vindo ao VacanciesGo ${dadosDoUsuario?.nomeDeUsuario})",
          style: TextStyle(fontSize: 18),
        ),
        actions: [
          IconButton(
            tooltip: "Deslogar",
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginPage(title: "Login"),
                ),
                ModalRoute.withName('/login'),
              );
            },
            icon: const Icon(
              Icons.exit_to_app,
            ),
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountEmail: Text("Email do usuário: ${dadosDoUsuario?.email}"),
              accountName:
                  Text("Nome do usuário: ${dadosDoUsuario?.nomeDeUsuario}"),
              currentAccountPicture: CircleAvatar(
                child: Text("***"),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        reverse: true,
        child: Center(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Image.asset(
                  ConstantesVacanciesGo.perfil,
                  height: 100,
                  width: 100,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 90),
                child: SizedBox(
                  width: 100,
                  height: 38,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => PerfilPage()),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(primary: Colors.green),
                    child: const Text('Perfil'),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 110),
                child: Image.asset(
                  ConstantesVacanciesGo.empresa,
                  height: 100,
                  width: 100,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 130),
                child: SizedBox(
                  width: 100,
                  height: 38,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => EmpresaPage()),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(primary: Colors.green),
                    child: const Text('Empresa'),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 150),
                child: Image.asset(
                  ConstantesVacanciesGo.editar,
                  height: 100,
                  width: 100,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 180),
                child: SizedBox(
                  width: 100,
                  height: 38,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => Editar()),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(primary: Colors.green),
                    child: const Text('Editar'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
