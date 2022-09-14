import 'package:flutter/material.dart';

class TiktokPosts extends StatelessWidget {
  final String userName;
  final String numberOfLikes;
  final String numberOfComments;
  final String numberofShares;
  final String imagePath;
  final tappedLike;
  final bool userLikedpost;

  TiktokPosts ({required this.userName,
  required this.numberOfLikes,
  required this.numberOfComments,
  required this.numberofShares,
  required this.imagePath,
  required this.tappedLike,
  required this.userLikedpost});


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          //image/video behind the UI
          Container(
            height: double.infinity,
              child: Image.asset(imagePath,fit: BoxFit.cover,),),



          //ui
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  //username and caption
                  children: [
                    //username
                    Text('@'+ userName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),),
                    SizedBox(height: 10,),
                    Text('first tiktok UI #flutter #koko',
                      style: TextStyle(
                        fontSize: 18,
                      ),),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    //likes button
                    GestureDetector(
                      onTap: tappedLike,
                        child: Icon(Icons.favorite,
                          size: 36,
                        color: userLikedpost ? Colors.red : Colors.white,),),
                    SizedBox(height: 10,),
                    Text(
                      //number of likes
                        numberOfLikes
                    ),
                    SizedBox(height: 20,),
                    Icon(Icons.chat_bubble, size: 36),
                    SizedBox(height: 10,),
                    Text(
                      //number of comments
                        numberOfComments
                    ),
                    SizedBox(height: 20,),
                    Icon(Icons.send,size: 36),
                    SizedBox(height: 10,),
                    Text(
                      //number of shares
                        numberofShares
                    ),
                    SizedBox(height: 25,),

                    //messages button

                    //share button
                  ],
                ),
              )
            ],
          ),
        ],
      )
    );
  }
}
