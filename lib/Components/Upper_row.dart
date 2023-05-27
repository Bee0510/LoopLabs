// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class upper_row extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 25,
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
