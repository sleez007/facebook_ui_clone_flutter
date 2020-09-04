import 'package:cached_network_image/cached_network_image.dart';
import 'package:fb_clone/config/palette.dart';
import 'package:flutter/material.dart';
import '../models/models.dart';
import './widgets.dart';

class Stories extends StatelessWidget {
  final User currentUser;
  final List<Story> stories;

  Stories({@required this.currentUser, @required this.stories});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      color: Colors.white,
      child: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
          scrollDirection: Axis.horizontal,
          itemCount: 1 + stories.length,
          itemBuilder: (BuildContext ctx, int index) {
            if (index == 0) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: _StoryCard(isAddStory: true, currentUser: currentUser),
              );
            }

            final Story story = stories[index - 1];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: _StoryCard(story: story),
            );
          }),
    );
  }
}

class _StoryCard extends StatelessWidget {
  final bool isAddStory;
  final User currentUser;
  final Story story;

  _StoryCard({ this.currentUser, this.isAddStory = false, this.story});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipRRect(borderRadius: BorderRadius.circular(12.0),child: CachedNetworkImage(imageUrl: isAddStory ? currentUser.imageUrl : story.imageUrl, height: double.infinity, width: 110.0,fit: BoxFit.cover,)),
        Container(
          height: double.infinity,
          width: 110.0,
          decoration: BoxDecoration(
            gradient: Palette.storyGradient,
            borderRadius: BorderRadius.circular(12.0)
          )
        ),
        Positioned(
          top: 8.0,
          left:8.0,
          child: isAddStory ? 
          Container( height: 40.0, width: 40.0,decoration:  BoxDecoration(color: Colors.white, shape: BoxShape.circle), child: IconButton(padding: EdgeInsets.zero,icon: const Icon(Icons.add, size: 30.0, color: Palette.facebookBlue,), onPressed: (){}),)
           : ProfileAvatar(imageUrl: story.user.imageUrl, hasBorder: story.isViewed)
        ),
        Positioned(bottom:8.0,left:8.0,right:8.0,
         child:Text(isAddStory?'Add Story': story.user.name, style:  const TextStyle(color: Colors.white, fontWeight:FontWeight.bold), maxLines: 2,overflow: TextOverflow.ellipsis,) ,
        )
      ],
    );
  }
}
