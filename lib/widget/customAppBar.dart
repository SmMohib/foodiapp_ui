 import 'package:flutter/material.dart';
import 'package:foodiapp_ui/component/color.dart';
import 'package:foodiapp_ui/widget/textWidget.dart';
import 'package:get/get.dart';
class Customappbar extends StatelessWidget {
   Customappbar({super.key,required this.title});
  String title;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [InkWell(onTap: (){Get.back();}, child: Image.asset('assets/icon/left-arrow 1.png',height: 25,width: 25,)),
                  text1heebo(text: title, color: blackColor, isTile: true, fontSize: 24)],
                ),
        ],
      ),
    );
  }
}