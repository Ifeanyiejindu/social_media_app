import 'package:flutter/material.dart';
import 'package:social_media_app/utils/tiktok_posts.dart';

class ReelsPage extends StatefulWidget {
  const ReelsPage({Key? key}) : super(key: key);

  @override
  State<ReelsPage> createState() => _ReelsPageState();
}

class _ReelsPageState extends State<ReelsPage> {

  bool userTappedLike = false;

  void userTapped(
      ){
    setState(() {
      userTappedLike = !userTappedLike;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        scrollDirection: Axis.vertical,
        children: [
          TiktokPosts(
            userName: 'createdbyifeanyi',
            numberOfLikes: '123',
            numberOfComments: '665',
            numberofShares: '444',
            imagePath: 'lib/Tiktok_images/tiktok_post1.png',
            tappedLike: userTapped,
            userLikedpost:userTappedLike,
          ),
          TiktokPosts(
            userName: 'amakaisaac',
            numberOfLikes: '555',
            numberOfComments: '223',
            numberofShares: '567',
            imagePath: 'lib/Tiktok_images/tiktok_post2.png',
            tappedLike: userTapped,
            userLikedpost: false,
          ),
          TiktokPosts(
            userName: 'createbymitchkoko',
            numberOfLikes: '734',
            numberOfComments: '442',
            numberofShares: '554',
            imagePath: 'lib/Tiktok_images/tiktok_post3.png',
            userLikedpost: false,
            tappedLike: userTapped,
          ),

        ],

      ),
    );
  }
}
