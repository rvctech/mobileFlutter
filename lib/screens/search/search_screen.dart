import 'package:flutter/material.dart';
import 'package:tunyce/widgets/drawer.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: const AppDrawer(),
      body: const SafeArea(
          child: Column(
        children: [
          Center(
            child: Text('SearchScreen'),
          )
        ],
      )),
    );
  }
}