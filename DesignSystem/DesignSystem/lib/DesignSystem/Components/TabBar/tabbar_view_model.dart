import 'package:flutter/material.dart';

class TabViewScreen extends StatelessWidget {
  const TabViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Número de abas
      child: Scaffold(
        appBar: AppBar(
          title: Text('TabBar Ex'), //title
          bottom: TabBar(
            //Exibe a barra de abas
            tabs: [
              //lista de abas, cada uma representada por um widget tab
              Tab(text: 'Tab 1'), //icon: Icon(Icons.home),
              Tab(text: 'Tab 2'), //icon: Icon(Icons.search),
              Tab(text: 'Tab 3'), //icon: Icon(Icons.notifications),
            ],
          ),
        ),
        body: TabBarView(
          //função de exibir o conteúdo associado a cada aba
          children: [
            //lista de widgets que correspondem as abas definidas no tabBar
            Center(child: Text('page')),
            Center(child: Text('page')),
            Center(child: Text('page')),
          ],
        ),
      ),
    );
  }
}
