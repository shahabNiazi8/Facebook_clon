import 'package:facebook_clon/models/models.dart';
import 'package:facebook_clon/widgets/user_card.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class MoreOptionList extends StatelessWidget {
  final User currentUser;
  final List<List> _moreOptionList = [
    [MdiIcons.shieldAccount, Colors.purple, 'covid 19 Info Center'],
    [MdiIcons.accountMultiple, Colors.cyan, 'Friends'],
    [MdiIcons.facebookMessenger, Colors.amberAccent, 'Messanger'],
    [MdiIcons.abTesting, Colors.purple, 'covid 19 Info Center'],
    [MdiIcons.accountMultiple, Colors.cyan, 'Friends'],
    [MdiIcons.facebookMessenger, Colors.amberAccent, 'Messanger'],
    [MdiIcons.shieldAccount, Colors.purple, 'covid 19 Info Center'],
  ];
  MoreOptionList({super.key, required this.currentUser});

  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: BoxConstraints(maxWidth: 280),
        child: ListView.builder(
          itemCount: 1 + _moreOptionList.length,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: UserCard(user: currentUser),
              );
            }
            var option = _moreOptionList[index - 1];

            return Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: _Option(
                icon: option[0],
                color: option[1],
                label: option[2],
              ),
            );
          },
        ));
  }
}

class _Option extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String label;
  const _Option(
      {super.key,
      required this.icon,
      required this.color,
      required this.label});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => print(label),
      child: Row(
        children: [
          Icon(
            icon,
            size: 38,
            color: color,
          ),
          SizedBox(width: 10),
          Flexible(
              child: Text(
            label,
            style: TextStyle(fontSize: 16),
            overflow: TextOverflow.ellipsis,
          ))
        ],
      ),
    );
  }
}
