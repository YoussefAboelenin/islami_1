import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_1/model/sura_model.dart';
import 'package:islami_1/utils/app_colors.dart';
import 'package:islami_1/utils/app_styles.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = 'sura_details';

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> verses = [];
  String contentSura = '';

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as SuraModel;
    if (contentSura.isEmpty) {
      loadSuraFile(args.fileName);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
          args.suraEnglishName,
          style: AppStyles.bold24primary,
        ),
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            color: AppColors.blackColor,
            child: Image.asset(
              'assets/images/details_bg.png',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
          Column(
            children: [
              SizedBox(
                height: 17,
              ),
              Text(
                args.suraArabicName, style: AppStyles.bold24primary),
              SizedBox(
                height: 25,
              ),
              Expanded(
                  child: contentSura.isEmpty
                      ? Center(
                        child: CircularProgressIndicator(
                        color: AppColors.primarydark,
                      ))
                      : SingleChildScrollView(
                          child: Text(
                            contentSura,
                            style: AppStyles.bold20primary,
                            textDirection: TextDirection.rtl,
                            textAlign: TextAlign.center,
                          ),
                        ))
            ],
          ),
        ],
      ),
    );
  }

  void loadSuraFile(String fileName) async {
    String suraContent = await rootBundle.loadString('assets/files/$fileName');
    List<String> suraLines = suraContent.split('\n');
    for (int i = 0; i < suraLines.length; i++) {
      suraLines[i] += '[${i + 1}]';
    }
    contentSura = suraLines.join();
    //verses = suraLines;
    setState(() {});
  }
}
