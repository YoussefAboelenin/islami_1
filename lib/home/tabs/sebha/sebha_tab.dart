import 'package:flutter/material.dart';
import 'package:islami_1/utils/app_colors.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  List<String> tasbeehWords = ['سبحان الله', 'الحمد لله', 'الله اكبر'];
  double rotationAngle = 0;
  int counter = 0;
  int index = 0;
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(
          'assets/images/logo.png',
          height: screenSize.height * 0.20,
        ),
        Text(
          'سَبِّحِ اسْمَ رَبِّكَ الأعلى',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: AppColors.whiteColor),
        ),
        Center(
          child: Stack(
            children: [
              Positioned(
                child: Image.asset(
                  'assets/images/sebha_head.png',
                ),
                top: screenSize.height * 0.08,
                left: screenSize.width * 0.39,
              ),
              InkWell(
                onTap: () {
                  handelTasbeeh();
                },
                child: Container(
                    margin: EdgeInsets.only(top: 90),
                    child: AnimatedRotation(
                      turns: rotationAngle / 360,
                      duration: Duration(milliseconds: 500),
                      child: Image.asset(
                        'assets/images/sebha_body.png',
                        height: screenSize.height * 0.5,
                      ),
                    )),
              ),
              Positioned(
                top: screenSize.height * 0.30,
                left: screenSize.width * 0.30,
                child: Column(
                  children: [
                    Text(
                      tasbeehWords[index],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: AppColors.whiteColor),
                    ),
                    SizedBox(
                      height: screenSize.height * 0.03,
                    ),
                    Text(
                      '$counter',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: AppColors.whiteColor),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  handelTasbeeh() {
    setState(() {
      if (counter == 33) {
        counter = 0;
        index = (index + 1) % tasbeehWords.length;
      } else {
        counter++;
      }
      rotationAngle += 10;
    });
  }
}
