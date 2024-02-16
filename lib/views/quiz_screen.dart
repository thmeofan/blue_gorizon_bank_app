import 'package:blue_gorizon_bank_app/data/models/quiz_model.dart';
import 'package:blue_gorizon_bank_app/views/synopsis/widgets/quiz_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../consts/app_colors.dart';
import '../consts/app_text_styles/synopsis_text_style.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.lightGreyColor,
        elevation: 0,
        title: const Text(
          'Good morning',
          style: SynopsisTextStyle.appbar,
        ),
      ),
      body: Container(
        color: AppColors.lightGreyColor,
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
               // itemCount: widget.newsModel.length,
                itemBuilder: (BuildContext context, int index) {
               //   return QuizItemWidget(quizModel: quiz,);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
