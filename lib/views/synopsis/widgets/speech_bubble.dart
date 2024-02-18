import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter/material.dart';
import 'dart:math';

class SpeechBubble extends StatelessWidget {
  final String text;
  final bool isQuestion;
  final int? answerCount;
  final String? date;
  final VoidCallback? onOptionsTap;
  final VoidCallback? onTap;

  SpeechBubble({
    Key? key,
    required this.text,
    this.isQuestion = false,
    this.answerCount,
    this.date,
    this.onOptionsTap,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int avatarIndex = Random().nextInt(5) + 1;
    double leftPadding =
        MediaQuery.of(context).size.width * 0.1; // 10% of the screen width

    return Padding(
      padding: EdgeInsets.only(
        top: 8.0,
        bottom: 8.0,
        left: isQuestion
            ? 8.0
            : leftPadding, // Apply additional padding for answers
        right: 8.0,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset('assets/images/avatar$avatarIndex.png',
              width: 40.0, height: 40.0),
          SizedBox(width: 8.0),
          Expanded(
            child: Column(
              crossAxisAlignment: isQuestion
                  ? CrossAxisAlignment.start
                  : CrossAxisAlignment.end,
              children: [
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  margin: EdgeInsets.only(bottom: 4.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Text(
                    text,
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
                Row(
                  mainAxisAlignment: isQuestion
                      ? MainAxisAlignment.spaceBetween
                      : MainAxisAlignment.end,
                  children: [
                    if (isQuestion && answerCount != null) ...[
                      GestureDetector(
                        onTap: onTap,
                        child: Text(
                          '$answerCount answers',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ],
                    if (date != null)
                      Text(
                        date!,
                        style: TextStyle(color: Colors.grey),
                      ),
                  ],
                ),
              ],
            ),
          ),
          if (onOptionsTap != null &&
              isQuestion) // Show options button only for questions
            IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: onOptionsTap,
            ),
        ],
      ),
    );
  }
}
