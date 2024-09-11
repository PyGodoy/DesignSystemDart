import 'package:flutter/material.dart';
import 'package:untitled/DesignSystem/Components/TabBar/tabbar_view_model.dart';

class TabBarSampleScreen extends StatelessWidget {
  const TabBarSampleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TabBar Sample Screen'),
      ),
      body: TabViewScreen(), // Usando o TabViewScreen aqui
    );
  }
}
