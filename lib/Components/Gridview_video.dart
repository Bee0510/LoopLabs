// ignore_for_file: prefer_const_constructors, unused_local_variable, prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:yt_shorts/API_caller.dart';
import 'package:yt_shorts/Screens/ShortsScreen.dart';

import '../Models/VideoInfo.dart';

class Gridview_video extends StatefulWidget {
  @override
  State<Gridview_video> createState() => _Gridview_videoState();
}

class _Gridview_videoState extends State<Gridview_video> {
  API_Caller CallAPI = API_Caller();
  @override
  void initState() {
    CallAPI.getPost();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder(
          future: CallAPI.getPost(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              Map<String, dynamic> index = snapshot.data;
              VideoInfo videoDetails = VideoInfo.fromJson(index);
              return GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                childAspectRatio: 0.75,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                children:
                    List.generate(videoDetails.data.posts.length, (index) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed('griditem_video');
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(videoDetails
                              .data.posts[index].submission.thumbnail),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: Stack(
                        children: <Widget>[
                          gridview_likedStatus(videoDetails
                              .data.posts[index].reaction.count
                              .toString()),
                          gridview_bottonStatus(
                              videoDetails
                                  .data.posts[index].submission.thumbnail,
                              videoDetails.data.posts[index].creator.handle),
                        ],
                      ),
                    ),
                  );
                }),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }

  Positioned gridview_bottonStatus(String thumbnail, String handle) {
    return Positioned(
        bottom: 6,
        left: 10,
        child: Container(
          padding: EdgeInsets.all(5),
          height: 60,
          width: 130,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                'Gro',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '@$handle',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  overflow: TextOverflow.fade,
                ),
                softWrap: false,
                maxLines: 1,
              ),
              Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundColor: Colors.transparent,
                    backgroundImage: NetworkImage(
                      thumbnail,
                    ),
                    radius: 10,
                  ),
                  SizedBox(width: 2),
                  Container(
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 201, 103, 218),
                        borderRadius: BorderRadius.circular(20)),
                    width: 40,
                    height: 20,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.white,
                          size: 12,
                        ),
                        Text(
                          'Pro',
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }

  Positioned gridview_likedStatus(String likes) {
    return Positioned(
        top: 10,
        left: 10,
        child: Container(
          padding: EdgeInsets.all(2),
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 99, 99, 95),
              borderRadius: BorderRadius.circular(20)),
          width: 40,
          height: 20,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                Icons.favorite,
                color: Colors.redAccent.shade700,
                size: 12,
              ),
              Text(
                likes,
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ));
  }
}
