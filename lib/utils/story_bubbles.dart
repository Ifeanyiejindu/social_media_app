import 'package:flutter/material.dart';

class StoryBubbles extends StatelessWidget {
  final String name;
  final String storyPic;
  final onTap;

  StoryBubbles ({required this.name, required this.storyPic, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Column(
        children: [
          //circle profile pic
          GestureDetector(
            onTap: onTap,
            child: Container(
              height: 70,
              width: 70,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: Image.asset(storyPic, fit: BoxFit.cover,),
              ),
            ),
          ),
          SizedBox(height: 10,),

          //profile picture name
          Text(name),
        ],
      ),
    );
  }
}
