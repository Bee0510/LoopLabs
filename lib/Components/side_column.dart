// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, camel_case_types

import 'package:flutter/material.dart';

class side_column extends StatelessWidget {
  String likes;
  String comments;
  side_column({required this.comments, required this.likes});
  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 4,
        right: 10,
        child: Container(
          padding: EdgeInsets.only(top: 5),
          height: 400,
          width: 45,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              column_element(
                  Icon(Icons.favorite, color: Colors.white, size: 35), likes),
              column_element(
                  Icon(Icons.comment_rounded, color: Colors.white, size: 35),
                  comments),
              column_element(
                  Icon(Icons.share_rounded, color: Colors.white, size: 35),
                  'Share'),
              column_element(
                  Icon(Icons.save_alt, color: Colors.white, size: 35), 'Save'),
              InkWell(
                child: Container(
                    height: 50,
                    width: 50,
                    child: Image.network(
                      'https://img.freepik.com/free-photo/lone-tree_181624-46361.jpg?w=996&t=st=1684996918~exp=1684997518~hmac=261e56ef00ea709217c13c0c86c3279dd7a450fdaa2cfac13e77161dd2559a0e',
                      fit: BoxFit.contain,
                    )),
              )
            ],
          ),
        ));
  }

  Column column_element(Icon icon, String text) {
    return Column(
      children: [
        Buttons(icon),
        Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        )
      ],
    );
  }
}

class Buttons extends StatefulWidget {
  Icon icon;

  Buttons(this.icon);

  @override
  State<Buttons> createState() => _ButtonsState();
}

class _ButtonsState extends State<Buttons> {
  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: () {}, icon: widget.icon);
  }
}
