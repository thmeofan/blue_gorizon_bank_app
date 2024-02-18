import 'package:blue_gorizon_bank_app/consts/app_colors.dart';
import 'package:blue_gorizon_bank_app/consts/app_text_styles/synopsis_text_style.dart';
import 'package:flutter/material.dart';

import '../../../util/app_routes.dart';

class IncomeTotalDisplay extends StatelessWidget {
  final double totalIncome;

  IncomeTotalDisplay({Key? key, required this.totalIncome}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          AppRoutes.income,
        );
      },
      child: Container(
        height: screenSize.height * 0.2,
        padding: EdgeInsets.all(
          screenSize.width * 0.03,
        ),
        decoration: const BoxDecoration(
          color: AppColors.lightGreyColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Personal Income', style: SynopsisTextStyle.title),
            const SizedBox(height: 4),
            Text('${totalIncome.toStringAsFixed(0)} \$',
                style: SynopsisTextStyle.banner),
          ],
        ),
      ),
    );
  }
}
