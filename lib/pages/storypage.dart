import 'dart:async';

import 'package:flutter/material.dart';
import 'package:social_media_app/utils/story_bars.dart';

import '../stories/story1.dart';
import '../stories/story2.dart';
import '../stories/story3.dart';

class StoryPage extends StatefulWidget {
  const StoryPage({Key? key}) : super(key: key);

  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {

  final List myStories = [
    StoryOne(),
    StoryTwo(),
    StoryThree()
  ];

  int currentStory = 0;

  List<double> percentWatched =[];

  @override
  void initState() {
    super.initState();
    // initally all stories havent been watched yet

    for(int i = 0; i < myStories.length; i++){
      percentWatched.add(0);
    }

    _startWatchingStory();
  }

  void _startWatchingStory (){
    Timer.periodic(Duration(milliseconds: 50), (timer) {setState(() {

      //only add 0.01 as long as it is below 1
      if(percentWatched[currentStory]+ 0.01 < 1){
        percentWatched[currentStory]+= 0.01;
      }else {
        percentWatched[currentStory] = 1;
        timer.cancel();

        //move to the next story as long as there are more stories to go through
        if (currentStory < myStories.length - 1){
          currentStory++;
          //restart story timer
          _startWatchingStory();
        }
        // if there is no more stories, return to the feed home page
        else {
          Navigator.pop(context);
        }
      }
    }); });
  }

  void _userTapsDown(TapDownDetails details){
    final double screenWidth = MediaQuery.of(context).size.width;
    final double dx = details.globalPosition.dx;

    //what happens when user is tapping first half of the screen

    if(dx < screenWidth / 2){
      setState(() {
        //if user is on the first story, then restart the story
        if (currentStory == 0){
          percentWatched[currentStory]=0;
        }

        //if user is passed the first story
        if (currentStory > 0){
          //set the current and previous watched story back to 0
          percentWatched[currentStory] = 0;
          percentWatched[currentStory - 1] = 0;

          //then go back to the previous story entirely
          currentStory--;
        }
      });
    }

    //what happens when user is tapping second half of the screen
      else{
        setState(() {
          //if there are more stories left, then go to next story
          if (currentStory < myStories.length - 1){
            //finish current story
            percentWatched[currentStory] = 1;
            //go to the next story
            currentStory++;
          }
          else
            {
              //if user is on the last story, the finish the story
              percentWatched[currentStory]=1;
            }
        });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details){
        //called the function, usertapsdown
        _userTapsDown(details);
      },
      child: Scaffold(
        body: Stack(
          children: [

            // stories
            myStories[currentStory],


            //story progress bars
            StoryBars(percentWatched:percentWatched,)
          ],
        ),
      ),
    );
  }
}
