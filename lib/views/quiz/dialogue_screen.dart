import 'package:blue_gorizon_bank_app/consts/app_text_styles/quiz_text_style.dart';
import 'package:blue_gorizon_bank_app/consts/app_text_styles/settings_text_style.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../consts/app_colors.dart';
import '../../../../consts/app_text_styles/synopsis_text_style.dart';
import '../../../../data/models/quiz_model.dart';
import '../synopsis/widgets/speech_bubble.dart';

class DialogueScreen extends StatefulWidget {
  final List quizzes;

  const DialogueScreen({Key? key, required this.quizzes}) : super(key: key);

  @override
  State createState() => _DialogueScreenState();
}

class _DialogueScreenState extends State<DialogueScreen> {
  int? expandedQuizIndex;

  void toggleAnswers(int index) {
    setState(() {
      if (expandedQuizIndex == index) {
        expandedQuizIndex = null;
      } else {
        expandedQuizIndex = index;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    String dateString = DateFormat('yyyy-MM-dd').format(DateTime.now());
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          color: AppColors.blueColor,
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
        ),
        backgroundColor: AppColors.lightGreyColor,
        title: const Text(
          'Back',
          style: SettingsTextStyle.back,
        ),
      ),
      body: Container(
        color: AppColors.lightGreyColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Additional features and improvements',
                style: QuizTextStyle.theme,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.start,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                '4 questions',
                style: QuizTextStyle.date,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.start,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: widget.quizzes.length,
                itemBuilder: (BuildContext context, int index) {
                  QuizModel quiz = widget.quizzes[index];
                  bool isExpanded = index == expandedQuizIndex;
                  return Card(
                    color: AppColors.lightGreyColor,
                    margin: EdgeInsets.all(8.0),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                    elevation: 0,
                    child: Column(
                      children: [
                        SpeechBubble(
                          text: quiz.question,
                          isQuestion: true,
                          answerCount: 3,
                          date: dateString,
                          onOptionsTap: () => toggleAnswers(index),
                          onTap: () => toggleAnswers(index),
                        ),
                        if (isExpanded) ...[
                          SpeechBubble(text: quiz.answerOne, isQuestion: false),
                          SpeechBubble(text: quiz.answerTwo, isQuestion: false),
                          SpeechBubble(
                              text: quiz.answerThree, isQuestion: false),
                        ],
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
