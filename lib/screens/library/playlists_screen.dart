import 'package:flutter/material.dart';
import 'package:tunyce/widgets/custom_text.dart';

class PlaylistScreen extends StatefulWidget {
  const PlaylistScreen({super.key});

  @override
  State<PlaylistScreen> createState() => _PlaylistScreenState();
}

class _PlaylistScreenState extends State<PlaylistScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Center(
            child: CustomText(
              text: 'PlaylistScreen',
            ),
          )
        ],
      )),
    );
  }
}
