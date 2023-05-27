// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sized_box_for_whitespace, unused_field, prefer_final_fields, non_constant_identifier_names, avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:yt_shorts/API_caller.dart';
import 'package:yt_shorts/Components/VideoScreen.dart';

import 'package:yt_shorts/Models/VideoInfo.dart';

class ShortScreenPage extends StatefulWidget {
  const ShortScreenPage({super.key});

  @override
  State<ShortScreenPage> createState() => _ShortScreenPageState();
}

class _ShortScreenPageState extends State<ShortScreenPage> {
  List<Post> videolist = [];
  API_Caller _callAPI = API_Caller();

  PageController _controller = PageController(initialPage: 0);

  @override
  void initState() {
    _callAPI.getPost();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _callAPI.getPost(),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          Map<String, dynamic> index = snapshot.data;
          VideoInfo v = VideoInfo.fromJson(index);

          return PageView.builder(
            itemCount: v.data.posts.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return VideoScreen_deco(
                v: v,
                index: index,
                video_Url: v.data.posts[index].submission.mediaUrl,
                description: v.data.posts[index].submission.description,
                handle: v.data.posts[index].creator.handle,
                thumbnail: v.data.posts[index].submission.thumbnail,
                likes: v.data.posts[index].reaction.count.toString(),
                comments: v.data.posts[index].comment.count.toString(),
              );
            },
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
