import 'package:facebook_clon/models/models.dart';
import 'package:facebook_clon/widgets/profile_avatar.dart';
import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  final User user;
  const UserCard({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ProfileAvatar(imgUrl: user.imageUrl),
          const SizedBox(
            width: 6,
          ),
          Text(
            user.name,
            style: const TextStyle(fontSize: 16),
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }
}
