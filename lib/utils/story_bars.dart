import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class StoryBars extends StatelessWidget {
  List <double> percentWatched = [
  ];

  StoryBars ({required this.percentWatched});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 60.0),
      child: Row(
        children: [
          Expanded(child: LinearPercentIndicator(
            barRadius: Radius.circular(16),
            lineHeight: 15,
            percent: percentWatched[0],
            progressColor: Colors.grey[400],
            backgroundColor: Colors.grey[700],
          ),),
          Expanded(child: LinearPercentIndicator(
            barRadius: Radius.circular(16),
            lineHeight: 15,
            percent: percentWatched[1],
            progressColor: Colors.grey[400],
            backgroundColor: Colors.grey[700],
          ),),
          Expanded(child: LinearPercentIndicator(
            barRadius: Radius.circular(16),
            lineHeight: 15,
            percent: percentWatched[2],
            progressColor: Colors.grey[400],
            backgroundColor: Colors.grey[700],
          ),),
        ],
      ),
    );
  }
}
