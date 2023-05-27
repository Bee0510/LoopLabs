// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class description_row extends StatelessWidget {
  String thumbnail;
  String handle;
  String description;

  description_row(
      {required this.handle,
      required this.description,
      required this.thumbnail});
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 10,
      left: 10,
      child: Container(
        height: 120,
        width: 300,
        // decoration: BoxDecoration(color: Colors.red),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(
                    thumbnail,
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    '@${handle}',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
                ElevatedButton(
                  style: TextButton.styleFrom(
                      backgroundColor: Color.fromRGBO(255, 0, 0, 100),
                      minimumSize: Size(20, 30),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6))),
                  onPressed: () {},
                  child: Text(
                    'Subscribe',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Text(
                description,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  overflow: TextOverflow.clip,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
