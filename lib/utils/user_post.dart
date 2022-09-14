import 'package:flutter/material.dart';

class UserPost extends StatelessWidget {

  final String imagePath;
  final String userName;
  final String userPic;

  UserPost({required this.imagePath, required this.userName, required this.userPic});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Column(
        children: [
          //name
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //profile picture
                Row(
                  children: [
                    Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: Image.asset(userPic, fit: BoxFit.cover,),
                      ),
                    ),

                    SizedBox(width: 10,),

                    Text(userName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                ),

                Icon(Icons.more_horiz),

                //name

                //more options icon
              ],
            ),
          ),

          //post
          Container(
            height: 400,
            child: Image.asset(imagePath),
          ),

          //buttons
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.favorite_border_outlined,
                    size: 32,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Icon(Icons.chat_bubble_outline,
                      size: 32),
                    ),
                    Icon(Icons.share, size: 32,),
                  ],
                ),
                Icon(Icons.bookmark_border, size: 32,),

              ],
            ),
          ),

          // liked by
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              children: [
                Text('Liked by '),
                Text ('markzugaberg', style: TextStyle(
                  fontWeight: FontWeight.bold
                ),),
              ],
            ),
          )

          //comments
        ],
      ),
    );
  }
}
