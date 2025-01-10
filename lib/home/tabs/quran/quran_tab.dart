import 'package:flutter/material.dart';
import 'package:islami_1/app_colors.dart';
import 'package:islami_1/home/tabs/quran/sura_details_screen.dart';
import 'package:islami_1/home/tabs/quran/sura_list_widget.dart';
import 'package:islami_1/model/sura_model.dart';

class QuranTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset('assets/images/logo.png'),
          TextField(
            cursorColor: AppColors.whiteColor,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(
                  color: AppColors.primarydark,
                  width: 2,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(
                  color: AppColors.primarydark,
                  width: 2,
                ),
              ),
              prefixIcon: const ImageIcon(
                  color: AppColors.primarydark,
                  AssetImage('assets/images/icon_search.png')),
              hintText: 'Sura Name',
              hintStyle: TextStyle(
                color: AppColors.whiteColor,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Most Recently ',
            style: TextStyle(
              color: AppColors.whiteColor,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
              color: AppColors.primarydark,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Sura En.'),
                    Text('Sura Ar.'),
                    Text('Aya Number.'),
                  ],
                ),
                Image.asset('assets/images/most_recently_image.png'),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Sura List',
            style: TextStyle(
              color: AppColors.whiteColor,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
              child: ListView.separated(
            padding: EdgeInsets.zero,
            separatorBuilder: (context, index) {
              return const Divider(
                color: AppColors.whiteColor,
                thickness: 2,
                indent: 30.5,
                endIndent: 30,
              );
            },
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(SuraDetailsScreen.routeName,
                      arguments: SuraModel.getSuraModel(index));
                },
                child: SuraListWidget(
                  suraModel: SuraModel.getSuraModel(index),
                ),
              );
            },
            itemCount: SuraModel.getItemCount(),
          ))
        ],
      ),
    );
  }
}
