import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_clon/config/palette.dart';
import 'package:facebook_clon/data/data.dart';
import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  final String imgUrl;
  final bool isActive;
  final bool hasBorder;

  const ProfileAvatar(
      {super.key,
      required this.imgUrl,
      this.isActive = false,
      this.hasBorder = false});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 20,
          backgroundColor: Palette.facebookBlue,
          child: CircleAvatar(
            radius: hasBorder ? 17 : 20,
            backgroundColor: Colors.grey[200],
            backgroundImage: CachedNetworkImageProvider(imgUrl),
          ),
        ),
        Positioned(
            bottom: 0.0,
            right: 0.0,
            child: Container(
              height: 15,
              width: 15,
              decoration: BoxDecoration(
                  color: Palette.online,
                  shape: BoxShape.circle,
                  border: Border.all(width: 2, color: Colors.white)),
            )),
        SizedBox.shrink(),
      ],
    );
  }
}
