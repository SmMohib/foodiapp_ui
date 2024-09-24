import 'package:flutter/material.dart';
import 'package:foodiapp_ui/component/color.dart';
import 'package:foodiapp_ui/screens/homeScreen.dart';
class BtmNevBar extends StatefulWidget {
  BtmNevBar({Key? key}) : super(key: key);

  @override
  State<BtmNevBar> createState() => _BtmNevBarState();
}

class _BtmNevBarState extends State<BtmNevBar> {
//page Name BtmNebBar
  int _currentIndex = 0;

  final List<Widget> _children = [
    Homescreen(),Homescreen(),Homescreen(),Homescreen(),
   
  ];

  void onTapBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

// end page Name BtmNebBar
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      // floatingActionButton
      floatingActionButton:ClipRRect(borderRadius: BorderRadius.circular(25),
        child: Material(
          elevation: 0,
        child: CircleAvatar(backgroundColor: primaryColor,radius: 30,child:  Image.asset('assets/icon/shopping-cart.png',height: 30,width: 30,))),
      ) ,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      // bottomNavigationBar
      bottomNavigationBar: Container(
        height: 50,
        
        decoration: const BoxDecoration(
          color: whiteColor,
          // borderRadius: BorderRadius.only(
          //   topLeft: Radius.circular(20),
          //   topRight: Radius.circular(20),
          // ),
        ),
        //Buttion_1
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  _currentIndex = 0;
                });
              },
              icon: _currentIndex == 0
                  ? Image.asset('assets/icon/home (1).png',height: 27,width: 27,)
                  : Image.asset('assets/icon/home (1).png',height: 25,width: 25,)
            ),
            //Buttion_2
            Padding(
              padding: const EdgeInsets.only(right: 60),
              child: IconButton(
                enableFeedback: false,
                onPressed: () {
                  setState(() {
                    _currentIndex = 1;
                  });
                },
                icon: _currentIndex == 1
                    ? Image.asset('assets/icon/heart.png',height: 27,width: 27,)
                  : Image.asset('assets/icon/heart.png',height: 25,width: 25,)
              ),
            ),
            //Buttion_3
            IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  _currentIndex = 2;
                });
              },
              icon: _currentIndex == 2
                   ? Image.asset('assets/icon/comments.png',height: 27,width: 27,)
                  : Image.asset('assets/icon/comments.png',height: 25,width: 25,)
            ),
            //Buttion_4
            IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  _currentIndex = 3;
                });
              },
              icon: _currentIndex == 3
                ? Image.asset('assets/icon/user (1).png',height: 27,width: 27,)
                  : Image.asset('assets/icon/user (1).png',height: 25,width: 25,)
            ),
          ],
        ),
      ),
    );
  }
}

