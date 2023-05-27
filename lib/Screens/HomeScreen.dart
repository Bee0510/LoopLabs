// ignore_for_file: prefer_const_literals_to_create_immutables, camel_case_types, avoid_unnecessary_containers, prefer_const_constructors, sized_box_for_whitespace
import 'package:flutter/material.dart';

import '../Components/Gridview_video.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({super.key});

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen>
    with TickerProviderStateMixin {
  List<String> genres_item = [
    'Live',
    'Nearly',
    'India',
    'Food',
    'Dance',
    'Cars',
    'Wildlife'
  ];
  bool tapped = false;
  @override
  Widget build(BuildContext context) {
    var tabBar = TabBar(
      indicatorSize: TabBarIndicatorSize.label,
      isScrollable: true,
      controller: TabController(length: 7, vsync: this),
      tabs: [
        _tabView(genres_item[0]),
        _tabView(genres_item[1]),
        _tabView(genres_item[2]),
        _tabView(genres_item[3]),
        _tabView(genres_item[4]),
        _tabView(genres_item[5]),
        _tabView(genres_item[6]),
      ],
    );
    return SafeArea(
      child: Container(
        padding: EdgeInsets.only(left: 15),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: <Widget>[tabBar, SizedBox(height: 10), Gridview_video()],
        ),
      ),
    );
  }

  Tab _tabView(String genre_text) {
    return Tab(
        child: Text(genre_text,
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                overflow: TextOverflow.fade)));
  }

  // Container genres() {
  //   List<String> genres_item = [
  //     'Live',
  //     'Nearly',
  //     'India',
  //     'Food',
  //     'Dance',
  //     'Cars',
  //     'Wildlife'
  //   ];
  //   bool tapped = false;
  //   return Container(
  //     height: 30,
  //     child: ListView.separated(
  //       scrollDirection: Axis.horizontal,
  //       itemCount: genres_item.length,
  //       itemBuilder: (context, index) {
  //         return InkWell(
  //           onTap: () {
  //             setState(() {
  //               tapped = !tapped;
  //             });
  //           },
  //           child: Container(
  //             decoration: BoxDecoration(
  //                 borderRadius: BorderRadius.circular(6),
  //                 color: Colors.black,
  //                 border: Border(
  //                   bottom: BorderSide(
  //                       width: 1, color: Color.fromARGB(255, 45, 44, 44)),
  //                   top: BorderSide(
  //                       width: 1, color: Color.fromARGB(255, 45, 44, 44)),
  //                   right: BorderSide(
  //                       width: 1, color: Color.fromARGB(255, 45, 44, 44)),
  //                   left: BorderSide(
  //                       width: 1, color: Color.fromARGB(255, 45, 44, 44)),
  //                 )),
  //             width: 55,
  //             height: 20,
  //             child: Center(
  //               child: Text(
  //                 genres_item[index],
  //                 style: TextStyle(
  //                     color: tapped ? Colors.red : Colors.white,
  //                     fontSize: 16,
  //                     fontWeight: FontWeight.bold,
  //                     overflow: TextOverflow.fade),
  //               ),
  //             ),
  //           ),
  //         );
  //       },
  //       separatorBuilder: (BuildContext context, int index) {
  //         return SizedBox(
  //           width: 20,
  //         );
  //       },
  //     ),
  //   );
  // }
}
