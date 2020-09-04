import 'package:fb_clone/data/data.dart';

import '../models/models.dart';
import 'package:flutter/material.dart';
import './profile_avatar.dart';

class CreatePostContainer extends StatelessWidget {
  final User user;

  CreatePostContainer({@required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 0.0),
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              ProfileAvatar(imageUrl: currentUser.imageUrl )
             ,
              const SizedBox(
                width: 8.0,
              ),
              Expanded(
                child: TextField(
                  decoration: InputDecoration.collapsed(
                      hintText: 'What\'s on your mind '),
                ),
              )
            ],
          ),
          const Divider(
            height: 10.0,
            thickness: 0.5,
          ),
          Container(
            height: 40.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FlatButton.icon(onPressed: () {}, icon: const Icon(Icons.videocam, color: Colors.red,), label: Text('Live')),
                const VerticalDivider(width:8.0),
                FlatButton.icon(onPressed: () {}, icon: const Icon(Icons.photo_library, color: Colors.green,), label: Text('Photo')),
                const VerticalDivider(width:8.0),
                FlatButton.icon(onPressed: () {}, icon: const Icon(Icons.video_call, color: Colors.purpleAccent,), label: Text('Room'))
              ],
            ),
          )
        ],
      ),
    );
  }
}
