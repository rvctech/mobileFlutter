import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:tunyce/controllers/home_controller.dart';
import 'package:tunyce/core/common/app_colors.dart';
import 'package:tunyce/models/seach_results_model.dart';
import 'package:tunyce/widgets/custom_text.dart';
import 'package:tunyce/widgets/drawer.dart';
import 'package:tunyce/widgets/loader.dart';
import 'package:tunyce/widgets/text_input.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        title: const Text('Search'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 22,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextInputWidget(
                  controller: homeController.searchController,
                  hintText: 'Search',
                  prefixIcon: const Icon(
                    Icons.search,
                    color: AppColors.primaryColor,
                  ),
                  onChanged: (value) async {
                    await homeController.searchVideos(value);
                  },
                  suffixIcon: IconButton(
                    onPressed: () async {
                      homeController.searchController.clear();
                      await homeController.searchVideos('');
                    },
                    icon: const Icon(
                      Icons.clear,
                      color: AppColors.primaryColor,
                    ),
                  )),
              const SizedBox(
                height: 20,
              ),
              Obx(
                () => (!homeController.isLoading.value)
                    ? CustomText(
                        text:
                            'Videos: ${homeController.searchedVideos.value.length}',
                        size: 20,
                        weight: FontWeight.bold,
                      )
                    : Container(),
              ),
              const SizedBox(
                height: 20,
              ),
              Obx(
                () => homeController.isLoading.value
                    ? customLoader()
                    : (homeController.searchedVideos.value.isEmpty)
                        ? Center(
                            child: Column(
                              children: [
                                Icon(
                                  MdiIcons.musicNoteOffOutline,
                                  color: AppColors.primaryColor,
                                  size: 100,
                                ),
                                const SizedBox(height: 20),
                                const CustomText(
                                  text: 'Sorry, no videos matching your query',
                                  size: 16,
                                ),
                              ],
                            ),
                          )
                        : Expanded(
                            child: ListView.builder(
                              itemCount:
                                  homeController.searchedVideos.value.length,
                              shrinkWrap: true,
                              primary: true,
                              itemBuilder: (context, index) {
                                Video video =
                                    homeController.searchedVideos.value[index];
                                return Container(
                                  height: 130,
                                  margin: const EdgeInsets.only(bottom: 16),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 14,
                                    vertical: 12,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade800,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Row(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: CachedNetworkImage(
                                          height: 100,
                                          width: 100,
                                          imageUrl: "${video.thumbnail}",
                                          fit: BoxFit.fill,
                                          placeholder: (context, url) =>
                                              Container(
                                                  height: 164,
                                                  width: 78,
                                                  color: Colors.grey[200],
                                                  child: customLoader()),
                                          errorWidget: (context, url, error) =>
                                              Container(
                                            height: 164,
                                            width: 78,
                                            decoration: BoxDecoration(
                                              color: AppColors.primaryColor
                                                  .withOpacity(0.1),
                                              borderRadius:
                                                  BorderRadius.circular(8),
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
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            CustomText(
                                              text: '${video.name}',
                                            ),
                                            const SizedBox(height: 10),
                                            CustomText(
                                              text: DateFormat.yMEd()
                                                  .add_jms()
                                                  .format(video.dateAdded!),
                                              size: 14,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.bottomRight,
                                        child: IconButton(
                                          onPressed: () {},
                                          icon: const Icon(
                                            Icons.more_horiz,
                                            color: AppColors.primaryColor,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
