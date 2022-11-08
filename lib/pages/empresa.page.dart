import 'package:flutter/material.dart';
import 'package:vacancies_go/controllers/home.controller.dart';
import 'package:vacancies_go/models/empresa.model.dart';

class EmpresaPage extends StatefulWidget {
  const EmpresaPage({Key? key}) : super(key: key);

  @override
  State<EmpresaPage> createState() => _EmpresaPage();
}

class _EmpresaPage extends State<EmpresaPage> {
  EmpresaModel? dadosDaEmpresa;

  HomeController homeController = HomeController();

  carregarDadosDaEmpresa() async {
    EmpresaModel empresalocal = await homeController.popularEmpresa();
    setState(() {
      dadosDaEmpresa = empresalocal;
    });
  }

  @override
  void initState() {
    carregarDadosDaEmpresa();
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
                child: Text("Email da Empresa: ${dadosDaEmpresa?.email}"),
              ),
              Container(
                child:
                    Text("Nome da Empresa: ${dadosDaEmpresa?.nomeDaEmpresa}"),
              ),
              Container(
                child: Text("Cidade: ${dadosDaEmpresa?.cidade}"),
              ),
              Container(
                child: Text("Informacoes: ${dadosDaEmpresa?.informacoes}"),
              ),
              Container(
                child: Text("Cnpj: ${dadosDaEmpresa?.cnpj}"),
              ),
              Container(
                child: Text("Estado: ${dadosDaEmpresa?.estado}"),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
