import 'package:facebook_clon/models/models.dart';
import 'package:facebook_clon/widgets/profile_avatar.dart';
import 'package:facebook_clon/widgets/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CreatePostContainer extends StatelessWidget {
  final User currentUser;
  const CreatePostContainer({super.key, required this.currentUser});

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
        padding: const EdgeInsets.fromLTRB(8, 8, 12, 0),
        color: Colors.white,
        child: Column(
          children: [
            Row(
              children: [
                ProfileAvatar(imgUrl: currentUser.imageUrl),
                const SizedBox(
                  width: 8,
                ),
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration.collapsed(
                        hintText: 'what is in your mind'),
                  ),
                )
              ],
            ),
            const Divider(
              height: 10,
              thickness: 0.5,
            ),
            Container(
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.videocam,
                      color: Colors.red,
                    ),
                    label: const Text("live"),
                  ),
                  const VerticalDivider(
                    width: 8,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.photo_library,
                      color: Colors.green,
                    ),
                    label: const Text("photo"),
                  ),
                  VerticalDivider(
                    width: 8,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.video_call,
                      color: Colors.purpleAccent,
                    ),
                    label: const Text("Room"),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
