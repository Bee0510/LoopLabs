// ignore_for_file: camel_case_types, must_be_immutable, use_key_in_widget_constructors, prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:yt_shorts/Components/side_column.dart';
import 'package:yt_shorts/Models/VideoInfo.dart';

import 'description_row.dart';

class VideoScreen_deco extends StatefulWidget {
  int index;
  VideoInfo v;
  String video_Url;
  String thumbnail;
  String handle;
  String description;
  String likes;
  String comments;
  VideoScreen_deco({
    required this.v,
    required this.index,
    required this.video_Url,
    required this.thumbnail,
    required this.handle,
    required this.description,
    required this.comments,
    required this.likes,
  });

  @override
  State<VideoScreen_deco> createState() => _VideoScreen_decoState();
}

class _VideoScreen_decoState extends State<VideoScreen_deco> {
  late VideoPlayerController controller;
  @override
  void initState() {
    controller = VideoPlayerController.network(widget.video_Url);
    controller.addListener(() {
      setState(() {});
    });
    controller.setLooping(true);
    controller.initialize().then((value) => null);
    controller.play();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        InkWell(
          onTap: () {
            setState(() {
              controller.value.isPlaying
                  ? controller.pause()
                  : controller.play();
            });
          },
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: controller.value.isInitialized
                ? AspectRatio(
                    aspectRatio: controller.value.aspectRatio,
                    child: VideoPlayer(controller),
                  )
                : Center(
                    child: CircularProgressIndicator.adaptive(),
                  ),
          ),
        ),
        side_column(comments: widget.comments, likes: widget.likes),
        description_row(
            handle: widget.handle,
            description: widget.description,
            thumbnail: widget.thumbnail),
        upper_row(),
      ],
    );
  }
}

class upper_row extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 30,
        right: 10,
        child: Container(
          height: 40,
          width: 150,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.search,
                    size: 25,
                    color: Colors.white,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.camera_alt_outlined,
                    size: 25,
                    color: Colors.white,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.more_vert,
                    size: 25,
                    color: Colors.white,
                  ))
            ],
          ),
        ));
  }
}
