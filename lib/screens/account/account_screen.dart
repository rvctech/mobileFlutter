import 'package:flutter/material.dart';
import 'package:tunyce/widgets/drawer.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: const AppDrawer(),
      body: const SafeArea(
          child: Column(
        children: [
          Center(
            child: Text('AccountScwsefccreen'),
          )
        ],
      )),
    );
  }
}
