import 'package:facebook_clon/config/palette.dart';

import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/icon_map.dart';

class CustomTabBar extends StatelessWidget {
  final List<IconData> icons;
  final int selectedIndex;
  final Function(int) onTap;
  final bool isBottomIndicator;
  const CustomTabBar(
      {super.key,
      required this.icons,
      required this.selectedIndex,
      required this.onTap,
      this.isBottomIndicator = false});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicatorPadding: EdgeInsets.zero,
      indicator: BoxDecoration(
        border: isBottomIndicator
            ? Border(
                bottom: BorderSide(
                  color: Palette.facebookBlue,
                  width: 3,
                ),
              )
            : Border(
                top: BorderSide(
                  color: Palette.facebookBlue,
                  width: 3,
                ),
              ),
      ),
      tabs: icons
          .asMap()
          .map((i, e) => MapEntry(
              i,
              Tab(
                icon: Icon(
                  e,
                  color: i == selectedIndex
                      ? Palette.facebookBlue
                      : Colors.black45,
                  size: 30,
                ),
              )))
          .values
          .toList(),
      onTap: onTap,
    );
  }
}
