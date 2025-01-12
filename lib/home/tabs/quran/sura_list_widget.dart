import 'package:flutter/material.dart';
import 'package:islami_1/model/sura_model.dart';
import 'package:islami_1/utils/app_styles.dart';

class SuraListWidget extends StatelessWidget {
  SuraModel suraModel;
  int index;

  SuraListWidget({required this.suraModel, required this.index});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Image.asset('assets/images/vector_image.png'),
            Text(
              '${index + 1}',
              style: AppStyles.bold20White,
            ),
          ],
        ),
        SizedBox(
          width: 24,
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    suraModel.suraEnglishName,
                    style: AppStyles.bold20White,
                  ),
                  Text(
                    '${suraModel.numOfVerses} Verses',
                    style: AppStyles.bold20White,
                  )
                ],
              ),
              Text(
                suraModel.suraArabicName,
                style: AppStyles.bold20White,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
