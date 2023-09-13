import 'dart:developer';

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
import 'package:video_player/video_player.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final homeController = Get.find<HomeController>();

  late VideoPlayerController _controller;

  bool _showPlayer = false;

  void _playVideo({int index = 0, bool init = false}) {
    if (index < 0 || index >= homeController.searchedVideos.value.length) {
      return;
    }
    _controller = VideoPlayerController.networkUrl(
      // Uri.parse("${homeController.searchedVideos.value[index].video}"),
      Uri.parse('https://samplelib.com/lib/preview/mp4/sample-5s.mp4'),
      // Uri.parse('https://samplelib.com/lib/preview/mp4/sample-30s.mp4'),
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
    _playVideo(init: true);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  _videoDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));

    return [
      if (duration.inHours > 0) hours,
      minutes,
      seconds,
    ].join(':');
  }

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
                  onTap: () => setState(() {
                        _showPlayer = false;
                      }),
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
              if (_showPlayer)
                Container(
                  height: 310,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade900,
                      borderRadius: const BorderRadius.vertical(
                        bottom: Radius.circular(12),
                      )),
                  child: _controller.value.isInitialized
                      ? Column(
                          children: [
                            SizedBox(
                              child: AspectRatio(
                                aspectRatio: _controller.value.aspectRatio,
                                child: VideoPlayer(_controller),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Row(
                              children: [
                                ValueListenableBuilder(
                                  valueListenable: _controller,
                                  builder:
                                      (context, VideoPlayerValue value, child) {
                                    return CustomText(
                                      text: _videoDuration(value.position),
                                      size: 20,
                                    );
                                  },
                                ),
                                Expanded(
                                  child: SizedBox(
                                    height: 20,
                                    child: VideoProgressIndicator(
                                      _controller,
                                      allowScrubbing: true,
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 10,
                                        vertical: 0,
                                      ),
                                    ),
                                  ),
                                ),
                                CustomText(
                                  text: _videoDuration(
                                      _controller.value.duration),
                                  size: 20,
                                )
                              ],
                            ),
                            IconButton(
                              onPressed: () => _controller.value.isPlaying
                                  ? _controller.pause()
                                  : _controller.play(),
                              icon: Icon(
                                _controller.value.isPlaying
                                    ? Icons.pause
                                    : Icons.play_arrow,
                                color: AppColors.primaryColor,
                              ),
                            ),
                          ],
                        )
                      : customLoader(),
                ),
              const SizedBox(height: 20),
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
                                          onPressed: () {
                                            log("VideoUrl: ${video.video}");
                                            FocusScope.of(context).unfocus();
                                            Future.delayed(
                                                const Duration(
                                                    milliseconds: 600), () {
                                              setState(() {
                                                _showPlayer = true;
                                                _playVideo(index: index);
                                              });
                                            });
                                          },
                                          icon: const Icon(
                                            Icons.play_circle,
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
