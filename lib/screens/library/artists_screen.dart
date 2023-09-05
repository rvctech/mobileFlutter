import 'package:flutter/material.dart';
import 'package:tunyce/widgets/custom_text.dart';

class ArtistsScreen extends StatefulWidget {
  const ArtistsScreen({super.key});

  @override
  State<ArtistsScreen> createState() => _ArtistsScreenState();
}

class _ArtistsScreenState extends State<ArtistsScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Center(
            child: CustomText(
              text: 'Artist',
            ),
          )
        ],
      )),
    );
  }
}
