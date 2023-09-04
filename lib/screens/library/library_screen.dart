import 'package:flutter/material.dart';
import 'package:tunyce/widgets/drawer.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({super.key});

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: const AppDrawer(),
      body: const SafeArea(
          child: Column(
        children: [
          Center(
            child: Text('LibraryScreen'),
          )
        ],
      )),
    );
  }
}
