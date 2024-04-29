import 'package:facebook_clon/config/palette.dart';
import 'package:facebook_clon/models/models.dart';
import 'package:facebook_clon/widgets/circle_button.dart';
import 'package:facebook_clon/widgets/custom_tapbar.dart';
import 'package:facebook_clon/widgets/user_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomAppBar extends StatelessWidget {
  final User currentUser;
  final List<IconData> icons;
  final int selectedIndex;
  final Function(int) onTap;

  const CustomAppBar({
    super.key,
    required this.currentUser,
    required this.icons,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      height: 65,
      decoration: BoxDecoration(color: Colors.white, boxShadow: const [
        BoxShadow(color: Colors.black12, offset: Offset(0, 2), blurRadius: 4)
      ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              "facebook",
              style: TextStyle(
                color: Palette.facebookBlue,
                fontSize: 32,
                fontWeight: FontWeight.bold,
                letterSpacing: -1.2,
              ),
            ),
          ),
          Container(
            height: double.infinity,
            width: 600,
            child: CustomTabBar(
                icons: icons,
                selectedIndex: selectedIndex,
                onTap: onTap,
                isBottomIndicator: true),
          ),
          Expanded(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              UserCard(user: currentUser),
              const SizedBox(
                width: 12,
              ),
              CircleButton(icon: Icons.search, iconSize: 30, onPressed: () {}),
              CircleButton(icon: Icons.message, iconSize: 30, onPressed: () {})
            ],
          ))
        ],
      ),
    );
  }
}
