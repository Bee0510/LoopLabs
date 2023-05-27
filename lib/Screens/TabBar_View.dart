// ignore_for_file: camel_case_types, prefer_const_constructors, avoid_unnecessary_containers, unused_field, prefer_const_literals_to_create_immutables

import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:yt_shorts/Screens/HomeScreen.dart';
import 'package:yt_shorts/Screens/Library.dart';
import 'package:yt_shorts/Screens/PostScreen.dart';
import 'package:yt_shorts/Screens/ShortsScreen.dart';
import 'package:yt_shorts/Screens/Subscription.dart';

class TabBar_View extends StatefulWidget {
  const TabBar_View({super.key});

  @override
  State<TabBar_View> createState() => _My_HomeScreenState();
}

class _My_HomeScreenState extends State<TabBar_View> {
  List<Map<String, Object>> _tabList = [];
  @override
  void initState() {
    _tabList = [
      {'Page': Home_Screen(), 'Title': "Home"},
      {'Page': ShortScreenPage(), 'Title': "Shorts"},
      {'Page': PostScreen(), 'Title': ""},
      {'Page': SubscriptionScreen(), 'Title': "Subscription"},
      {'Page': LibraryScreen(), 'Title': "Library"},
    ];
    super.initState();
  }

  int selectPage = 0;
  void togglePage(int page) {
    setState(() {
      selectPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Colors.black),
        child: _tabList[selectPage]['Page'] as Widget,
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black.withOpacity(0.7),
        currentIndex: selectPage,
        onTap: (int index) {
          setState(() {
            selectPage = index;
          });
        },
        items: [
          // Define your tab items here
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_call),
            label: 'Shorts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline_sharp, size: 30),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.subscriptions_outlined),
            label: 'Subscription',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_add),
            label: 'Library',
          ),
        ],
      ),
    );
  }
}
