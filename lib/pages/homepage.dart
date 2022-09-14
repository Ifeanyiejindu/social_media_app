import 'package:flutter/material.dart';
import 'package:social_media_app/utils/story_bubbles.dart';
import 'package:social_media_app/utils/user_post.dart';

import 'storypage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _currentIndex = 0;

  final List userPosts = [
    //the details we will have here are:
    //[userName, imagePath, userPic]

    ['ifeanyiejindu', 'lib/images/post1.png', 'lib/images/user1.png',],
    ['godwinfrank', 'lib/images/post2.png','lib/images/user2.png',],
    ['clarejones', 'lib/images/post3.png', 'lib/images/user3.png',],

  ];

  final List userStories = [
    //the details we will have here are:
    //[userName, imagePath, userPic]

    ['feedermike','lib/images/user1.png',],
    ['brownfits', 'lib/images/user2.png',],
    ['viberclub', 'lib/images/user3.png',],
    ['nothingness', 'lib/images/user4.png',],

  ];

  void _openStory(){
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return StoryPage();
    },),);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [

            //top side + some buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Instagram',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),),

                  //buttons
                  Row(
                    children: [
                      Icon(Icons.add_box_outlined),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Icon(Icons.favorite_border),
                      ),
                      Icon(Icons.chat_bubble_outline),
                    ],
                  ),

                ],
              ),
            ),
            SizedBox(height: 25,),

            //stories
            SizedBox(
              height: 100,
              child: ListView.builder(
                  itemCount: userStories.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                return StoryBubbles(name: userStories[index][0],
                    storyPic: userStories[index][1],
                onTap: _openStory,);
              })),

            SizedBox(height: 25,),

            //feed
            UserPost(
              userName: userPosts[0][0],
              imagePath: userPosts[0][1],
            userPic: userPosts[0][2],),
            UserPost(userName: userPosts[1][0],
            imagePath: userPosts[1][1],
            userPic: userPosts[1][2],),
            UserPost(userName: userPosts[2][0],
            imagePath: userPosts[2][1],
            userPic: userPosts[2][2],),



          ],
        ),
      ),
    );
  }
}
