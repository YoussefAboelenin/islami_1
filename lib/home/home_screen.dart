import 'package:flutter/material.dart';
import 'package:islami_1/home/tabs/hadeth/hadeth_tab.dart';
import 'package:islami_1/home/tabs/quran/quran_tab.dart';
import 'package:islami_1/home/tabs/radio/radio__tab.dart';
import 'package:islami_1/home/tabs/sebha/sebha_tab.dart';
import 'package:islami_1/home/tabs/time/time_tab.dart';
import 'package:islami_1/utils/app_colors.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  List<String> backgroundImages = [
    'assets/images/quran_bg.png',
    'assets/images/hadeth_bg.png',
    'assets/images/sebha_bg.png',
    'assets/images/radio_bg.png',
    'assets/images/time_bg.png',
  ];
  List<Widget> tabs = [
    QuranTab(),
    HadethTab(),
    SebhaTab(),
    RadioTab(),
    TimeTab()
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          backgroundImages[selectedIndex],
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          bottomNavigationBar: Theme(
            data:
                Theme.of(context).copyWith(canvasColor: AppColors.primarydark),
            child: BottomNavigationBar(
                currentIndex: selectedIndex,
                onTap: (index) {
                  selectedIndex = index;
                  setState(() {});
                },
                //backgroundColor: AppColors.primarydark,
                //type: BottomNavigationBarType.fixed,
                items: [
                  BottomNavigationBarItem(
                    icon: builtItemBottomNavBar(
                        index: 0, imageName: 'icon_quran'),
                    label: 'Quran',
                  ),
                  BottomNavigationBarItem(
                    icon: builtItemBottomNavBar(
                        index: 1, imageName: 'icon_hadeth'),
                    label: 'Hadeth',
                  ),
                  BottomNavigationBarItem(
                    icon: builtItemBottomNavBar(
                        index: 2, imageName: 'icon_sebha'),
                    label: 'Sebha',
                  ),
                  BottomNavigationBarItem(
                    icon: builtItemBottomNavBar(
                        index: 3, imageName: 'icon_radio'),
                    label: 'Radio',
                  ),
                  BottomNavigationBarItem(
                    icon:
                        builtItemBottomNavBar(index: 4, imageName: 'icon_time'),
                    label: 'Time',
                  ),
                ]),
          ),
          body: tabs[selectedIndex],
        ),
      ],
    );
  }

  Widget builtItemBottomNavBar(
      {required int index, required String imageName}) {
    return selectedIndex == index
        ? Container(
            padding: EdgeInsets.symmetric(vertical: 6, horizontal: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(66),
                color: AppColors.blackBgColor),
            child: ImageIcon(
              AssetImage('assets/images/$imageName.png'),
            ))
        : ImageIcon(
            AssetImage('assets/images/$imageName.png'),
          );
  }
}
