// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yt_shorts/API_caller.dart';
import 'package:yt_shorts/Models/VideoInfo.dart';
import 'package:yt_shorts/Screens/GridItem_video.dart';

import 'package:yt_shorts/Screens/TabBar_View.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarBrightness: Brightness.dark));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TabBar_View(),
      routes: {
        'griditem_video': (context) => griditem_video(),
      },
    );
  }
}
