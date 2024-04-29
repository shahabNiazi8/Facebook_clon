// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:facebook_clon/config/palette.dart';
import 'package:facebook_clon/widgets/profile_avatar.dart';
import 'package:facebook_clon/widgets/responsive.dart';
import 'package:flutter/material.dart';

import 'package:facebook_clon/models/models.dart';
import 'package:flutter/widgets.dart';

class Rooms extends StatelessWidget {
  final List<User> onlineUsers;
  Rooms({
    Key? key,
    required this.onlineUsers,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsive.isDesktop(context);
    return Card(
      margin: EdgeInsets.symmetric(horizontal: isDesktop ? 5.0 : 0.0),
      elevation: isDesktop ? 1.0 : 0.0,
      shape: isDesktop
          ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
          : null,
      child: Container(
        height: 60,
        color: Colors.white,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
            itemCount: 1 + onlineUsers.length,
            // ignore: avoid_types_as_parameter_names
            itemBuilder: (BuildContext, int index) {
              if (index == 0) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: _CreateRoomButton(),
                );
              }
              final User user = onlineUsers[index - 1];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: ProfileAvatar(
                  imgUrl: user.imageUrl,
                  isActive: true,
                ),
              );
            }),
      ),
    );
  }
}

class _CreateRoomButton extends StatelessWidget {
  const _CreateRoomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        // ignore: avoid_print
        onPressed: () => print("create Room"),
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
            side: const BorderSide(
              width: 10,
              color: Colors.pink,
            ),
          ),
        ),
        child: Row(
          children: [
            const Icon(
              Icons.video_call,
              size: 35,
              color: Colors.black,
            ),
            const SizedBox(
              width: 8,
            ),
            const Text("create\nRoom")
          ],
        ));
  }
}
