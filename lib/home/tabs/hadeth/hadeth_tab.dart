import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_1/app_colors.dart';
import 'package:islami_1/home/tabs/hadeth/hadeth_details_screen.dart';
import 'package:islami_1/model/hadeth_model.dart';

class HadethTab extends StatefulWidget {
  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  List<HadethModel> hadethList = [];

  @override
  Widget build(BuildContext context) {
    if (hadethList.isEmpty) {
      loadHadethFile();
    }
    return Container(
        child: Column(
          children: [
            Image.asset('assets/images/logo.png'),
            hadethList.isEmpty ?
            Center(
                child: CircularProgressIndicator(color: AppColors.primarydark,))
                :
            CarouselSlider.builder(
              options: CarouselOptions(
                height: 500,
                viewportFraction: 0.75,
                scrollDirection: Axis.horizontal,
                enableInfiniteScroll: true,
                enlargeCenterPage: true,

              ),
              itemCount: hadethList.length,
              itemBuilder: (BuildContext context, int itemIndex,
                  int pageViewIndex) =>
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(
                          HadethDetailsScreen.routeName,
                          arguments: hadethList[itemIndex]
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AppColors.primarydark,
                          image: const DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage(
                                  'assets/images/hadeth_bg_image.png'))
                      ),
                      child:
                      Column(
                        children: [
                          Text(
                            hadethList[itemIndex].title,
                            style: TextStyle(
                                fontSize: 18
                            ),
                          ),
                          Expanded(child: Text(
                            hadethList[itemIndex].content.join(''),
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ))
                        ],
                      ),
                    ),
                  ),
            ),
          ],
        )
    );
  }

  void loadHadethFile() async {
    for (int i = 1; i <= 50; i++) {
      String hadethContent = await rootBundle.loadString(
          'assets/files/h$i.txt');
      List<String> hadethLines = hadethContent.split('\n');
      for (int i = 0; i < hadethLines.length; i++) {

      }
      String title = hadethLines[0];
      hadethLines.removeAt(0);
      HadethModel hadethModel = HadethModel(title: title, content: hadethLines);
      hadethList.add(hadethModel);
      setState(() {

      });
    }
  }
}
