import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_clon/config/palette.dart';
import 'package:facebook_clon/models/models.dart';
import 'package:facebook_clon/widgets/profile_avatar.dart';
import 'package:facebook_clon/widgets/responsive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Stories extends StatelessWidget {
  final User currentUser;
  final List<Story> stories;

  const Stories({
    super.key,
    required this.currentUser,
    required this.stories,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Responsive.isDesktop(context) ? Colors.transparent : Colors.white,
      child: ListView.builder(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
          scrollDirection: Axis.horizontal,
          itemCount: 1 + stories.length,
          itemBuilder: (BuildContext, int index) {
            if (index == 0) {
              return Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 4,
                ),
                child: _storyCard(
                  isAddStory: true,
                  currentUser: currentUser,
                ),
              );
            }
            final Story story = stories[index - 1];
            return Padding(
                padding: EdgeInsets.symmetric(horizontal: 4),
                child: _storyCard(
                  story: story,
                ));
          }),
    );
  }
}

class _storyCard extends StatelessWidget {
  final bool isAddStory;
  final User? currentUser;
  final Story? story;
  const _storyCard(
      {super.key, this.isAddStory = false, this.currentUser, this.story});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: CachedNetworkImage(
            imageUrl: isAddStory ? currentUser!.imageUrl : story!.imageUrl,
            height: double.infinity,
            width: 110,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          height: double.infinity,
          width: 110,
          decoration: BoxDecoration(
            gradient: Palette.storyGradient,
            borderRadius: BorderRadius.circular(12),
            boxShadow: Responsive.isDesktop(context)
                ? const [
                    BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0, 2),
                        blurRadius: 4.0)
                  ]
                : null,
          ),
        ),
        Positioned(
            top: 8,
            left: 8,
            child: isAddStory
                ? Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        color: Colors.white, shape: BoxShape.circle),
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      icon: const Icon(Icons.add),
                      iconSize: 30,
                      onPressed: () => print('add to story'),
                    ),
                  )
                : ProfileAvatar(
                    imgUrl: story!.user.imageUrl,
                    hasBorder: story!.isViewed,
                  )),
        Positioned(
          bottom: 8,
          left: 8,
          right: 8,
          child: Text(
            isAddStory ? 'Add to story' : story!.user.name,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        )
      ],
    );
  }
}
