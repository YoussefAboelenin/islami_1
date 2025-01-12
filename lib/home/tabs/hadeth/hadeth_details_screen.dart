import 'package:flutter/material.dart';
import 'package:islami_1/model/hadeth_model.dart';

import '../../../app_colors.dart';

class HadethDetailsScreen extends StatelessWidget {
  static const String routeName = 'hadeth_details';

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute
        .of(context)
        ?.settings
        .arguments as HadethModel;
    return Scaffold(
      appBar: AppBar(),
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
                args.title,
                style: TextStyle(
                  color: AppColors.primarydark,
                  fontSize: 24,
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 22, vertical: 4),
                      child: Text(args.content[index],
                        style: TextStyle(
                          color: AppColors.primarydark,
                          fontSize: 18,
                        ),
                      ),
                    );
                  },
                  itemCount: args.content.length,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
