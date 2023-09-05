import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tunyce/controllers/home_controller.dart';
import 'package:tunyce/core/common/app_colors.dart';
import 'package:tunyce/models/latest_mix_response.dart';
import 'package:tunyce/widgets/custom_text.dart';
import 'package:tunyce/widgets/drawer.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({super.key});

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  final homeController = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Library'),
      ),
      drawer: const AppDrawer(),
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: homeController.latestMixes?.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                LatestMix? mix = homeController.latestMixes?[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: CachedNetworkImage(
                          height: 100,
                          width: 100,
                          imageUrl: "${mix?.thumbnail}",
                          fit: BoxFit.fill,
                          placeholder: (context, url) => Container(
                            height: 164,
                            width: 78,
                            color: Colors.grey[200],
                            child: const Center(
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    AppColors.primaryColor),
                              ),
                            ),
                          ),
                          errorWidget: (context, url, error) => Container(
                            height: 164,
                            width: 78,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Icon(
                              Icons.music_note,
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: CustomText(
                          text: '${mix?.name}',
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      )),
    );
  }
}
