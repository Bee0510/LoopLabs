// ignore_for_file: prefer_const_constructors, camel_case_types

import 'package:flutter/material.dart';
import 'package:yt_shorts/Screens/ShortsScreen.dart';

class griditem_video extends StatefulWidget {
  const griditem_video({super.key});

  @override
  State<griditem_video> createState() => _griditem_videoState();
}

class _griditem_videoState extends State<griditem_video> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ShortScreenPage());
  }
}
