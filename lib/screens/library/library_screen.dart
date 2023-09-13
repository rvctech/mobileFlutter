import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tunyce/controllers/home_controller.dart';
import 'package:tunyce/widgets/drawer.dart';

import 'artists_screen.dart';
import 'playlists_screen.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({super.key});

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  final homeController = Get.find<HomeController>();

  static const List<Tab> myTabs = <Tab>[
    Tab(text: 'My Playlists'),
    Tab(text: 'My Artists'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      body: DefaultTabController(
        length: myTabs.length,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: myTabs,
            ),
          ),
          body: const TabBarView(children: [
            PlaylistScreen(),
            ArtistsScreen(),
          ]),
        ),
      ),
    );
  }
}
