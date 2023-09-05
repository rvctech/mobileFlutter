import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tunyce/controllers/home_controller.dart';
import 'package:tunyce/widgets/drawer.dart';
import 'package:video_player/video_player.dart';

import 'artists_screen.dart';
import 'playlists_screen.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({super.key});

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  final homeController = Get.find<HomeController>();
  late VideoPlayerController _controller;

  void _playVideo({int index = 0, bool init = false}) {
    if (index < 0 || index >= homeController.latestMixes!.length) return;
    _controller = VideoPlayerController.networkUrl(
      Uri.parse("https://www.youtube.com/shorts/nMBml1iNvtk"),
      // Uri.parse("${homeController.latestMixes?[index].video}"),
    )
      ..addListener(() => setState(() {}))
      ..setLooping(true)
      ..initialize().then((_) {
        if (init) {
          _controller.play();
        }
        setState(() {});
      });
  }

  @override
  void initState() {
    super.initState();
    _playVideo(init: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
        ));
  }
}
