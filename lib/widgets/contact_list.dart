import 'package:facebook_clon/models/user_model.dart';
import 'package:facebook_clon/widgets/user_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ContactList extends StatelessWidget {
  final List<User> users;
  const ContactList({super.key, required this.users});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxHeight: 500),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                  child: Text(
                'Contact',
                style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              )),
              Icon(
                Icons.search,
                color: Colors.grey[600],
              ),
              SizedBox(width: 8),
              Icon(
                Icons.more_horiz,
                color: Colors.grey[600],
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
                itemCount: users.length,
                itemBuilder: (BuildContext context, int index) {
                  final User user = users[index];
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: UserCard(user: user),
                  );
                }),
          )
        ],
      ),
    );
  }
}
