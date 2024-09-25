// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:foodiapp_ui/component/color.dart';
import 'package:foodiapp_ui/screens/cart/cartScreen.dart';
import 'package:foodiapp_ui/widget/textWidget.dart';


import '../model/data.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  // Keep track of the selected tab index
  int selectedIndex = 0;

  // List to store cart items
  List<Model> cartItems = [];

  // Define some example tab names and associated content
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 30),
          // Header with Greeting and Profile Picture
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    textPoppins(
                      text: 'Hello, Abir',
                      color: blackColor,
                      isTile: true,
                      fontSize: 22,
                    ),
                    textPoppins(
                      text: 'What do you want to eat today?',
                      color: const Color.fromARGB(125, 0, 0, 0),
                      isTile: false,
                      fontSize: 15,
                    ),
                  ],
                ),
                const CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage('assets/icon/image 3.png'),
                )
              ],
            ),
          ),
          const SizedBox(height: 10),

          // Search Bar and Filter
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  flex: 8,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(192, 197, 197, 197),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/icon/search-interface-symbol 1.png',
                            height: 25,
                            width: 25,
                          ),
                          textPoppins(
                            text: 'Search For Food',
                            color: const Color.fromARGB(125, 0, 0, 0),
                            isTile: false,
                            fontSize: 15,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 5),
                Expanded(
                  flex: 2,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(16),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(11.0),
                      child: Image.asset(
                        'assets/icon/settings-sliders.png',
                        height: 25,
                        width: 25,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          // horizontal Tab List
          Expanded(
            flex: 2,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: tabNames_list.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index; // Update the selected tab
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: selectedIndex == index
                            ? primaryColor // Selected tab color
                            : const Color.fromARGB(
                                255, 230, 221, 216), // Non-selected tab color
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundColor: secondaryColor,
                            backgroundImage: AssetImage(tabNames_list[index].image.toString()),
                          ),
                          const SizedBox(width: 2),
                          textPoppins(
                            text: tabNames_list[index].title.toString(),
                            color: selectedIndex == index
                                ? whiteColor // Text color for selected tab
                                : blackColor, // Text color for non-selected tab
                            isTile: true,
                            fontSize: 16,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          // GridView for Selected Tab
          Expanded(
            flex: 15,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Number of columns
                childAspectRatio: 5 / 6,
                // crossAxisSpacing: 10,
                //mainAxisSpacing: 10,
              ),
              itemCount: gridItems_list[selectedIndex].length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 50, left: 8, right: 8),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: whiteColor),
                
                    //  height: 350,width: 200,
                    child: InkWell(
                      onTap: () {
    setState(() {
      cartItems.add(gridItems_list[selectedIndex][index]);
    });
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("${gridItems_list[selectedIndex][index].title} added to cart!"),
    ));
  },
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Positioned(
                              top: -50,
                              left: 30,
                             
                              child: Image.asset(gridItems_list[selectedIndex][index].image.toString(),
                              height: MediaQuery.of(context).size.height*0.17,
                              width: MediaQuery.of(context).size.height*0.14, 
                              )),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 70,
                              ),
                              textPoppins(
                                text: gridItems_list[selectedIndex][index].title.toString(),
                                color: blackColor,
                                isTile: true,
                                fontSize: 20,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    textPoppins(
                                      //  text: gridItems[selectedIndex][index],
                                      text:  'TK ${gridItems_list[selectedIndex][index].price.toString()}',
                                      color: blackColor,
                                      isTile: true,
                                      fontSize: 17,
                                    ),
                                    Material(
                                        child: InkWell(
                                            onTap: () {},
                                            child: CircleAvatar(
                                              radius: 15,
                                              child: Icon(
                                                Icons.add,
                                                size: 20,
                                              ),
                                            )))
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}


