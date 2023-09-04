import 'package:flutter/material.dart';
import 'package:tunyce/core/common/app_colors.dart';
import 'package:tunyce/widgets/drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: const AppDrawer(),
      body: const SafeArea(
          child: Column(
        children: [
          Center(
            child: Text('Home Screen'),
          )
        ],
      )),
    );
  }
}
