import 'package:cached_network_image/cached_network_image.dart';
import '../config/palette.dart';
import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  final String imageUrl;
  final bool isActive;
  final bool hasBorder;

  ProfileAvatar({@required this.imageUrl, this.isActive = false, this.hasBorder= false});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[

        CircleAvatar(
          radius: 20.0,
          backgroundColor: Palette.facebookBlue,
          child: CircleAvatar(
              radius: hasBorder? 17.0: 20.0,
              backgroundColor: Colors.grey[200],
              backgroundImage: CachedNetworkImageProvider(imageUrl)),
        ),
        if (isActive)
          Positioned(
              bottom: 0.0,
              right: 0.0,
              child: Container(
                height: 13.0,
                width: 13.0,
                decoration: BoxDecoration(
                    color: Palette.online,
                    shape: BoxShape.circle,
                    border: Border.all(width: 2.0, color: Colors.white)),
              ))
      ],
    );
  }
}
