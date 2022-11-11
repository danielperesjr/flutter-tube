import 'package:flutter/material.dart';
import 'package:flutter_tube/telas/Biblioteca.dart';
import 'package:flutter_tube/telas/EmAlta.dart';
import 'package:flutter_tube/telas/Inicio.dart';
import 'package:flutter_tube/telas/Inscricoes.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _indiceAtual = 0;

  @override
  Widget build(BuildContext context) {

    List<Widget> telas = [
      Inicio(),
      EmAlta(),
      Inscricoes(),
      Biblioteca(),
    ];

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.grey,
          opacity: 1
        ),
        backgroundColor: Colors.white,
        title: Image.asset(
            "images/flutter-logo.png",
          width: 88,
          height: 25,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.videocam),
              onPressed: (){
                print("Ação: videocam");
              },
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){
              print("Ação: search");
            },
          ),
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: (){
              print("Ação: conta");
            },
          )
        ],
      ),
      body: telas[_indiceAtual],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indiceAtual,
        onTap: (index){
          setState(() {
            _indiceAtual = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.blue,
        items: [
          BottomNavigationBarItem(
            label: "Início",
              icon: Icon(Icons.home)
          ),
          BottomNavigationBarItem(
              label: "Em alta",
              icon: Icon(Icons.whatshot)
          ),
          BottomNavigationBarItem(
              label: "Inscrições",
              icon: Icon(Icons.subscriptions)
          ),
          BottomNavigationBarItem(
              label: "Biblioteca",
              icon: Icon(Icons.folder)
          ),
        ],
      ),
    );
  }
}