// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:foodiapp_ui/component/color.dart';
import 'package:foodiapp_ui/widget/customAppBar.dart';
import 'package:foodiapp_ui/widget/textWidget.dart';



class Cartscreen extends StatefulWidget {
  Cartscreen({super.key});

  @override
  State<Cartscreen> createState() => _CartscreenState();
}

class _CartscreenState extends State<Cartscreen> {
  int _counter = 1;
  double basePrice = 37.0;
  int _selectedOption = 0; // Radio button value

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    if (_counter > 1) {
      setState(() {
        _counter--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
          height: 60,
          color: primaryColor, // Replace with primaryColor if you have it defined
          child: MaterialButton(
            clipBehavior: Clip.none,
            onPressed: () {
              if (_counter > 0) {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text("Order Success"),
                    content: const Text("Your order has been placed!"),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text("OK"),
                      ),
                    ],
                  ),
                );
              }
            },
            child: const Text(
              'CHECKOUT',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          )),
      body: Column(
        children: [
          const SizedBox(height: 30),
         Customappbar(title: 'Order Detail'),
          Expanded(
              child: ListView.builder(
            itemBuilder: (context, index) {
              return Row(
                children: [
                  Expanded(flex: 2, child: Text('')),
                  Expanded(
                    flex: 9,
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12)),
                        height: MediaQuery.of(context).size.height * 0.20,
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Positioned(
                               
                                left: -75,
                                child: Image.asset(
                                  'assets/image 5.png',
                                  height:
                                      MediaQuery.of(context).size.height * 0.2,
                                  width:
                                      MediaQuery.of(context).size.height * .2,
                                )),
                            Row(
                              children: [
                                Expanded(flex: 3, child: Text('')),
                                Expanded(
                                  flex: 6,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                          flex: 5,
                                          child: Row(
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: const [
                                                  Text(
                                                    'Meat Pizza',
                                                    style: TextStyle(
                                                        fontSize: 24,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Text(
                                                    'Most Popular',
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        color: Colors.grey),
                                                  )
                                                ],
                                              ),
                                              const SizedBox(height: 10),
                                            Row(
                                              children: [
                                                Radio<int>(
                                                  value: 0,
                                                  groupValue: _selectedOption,
                                                  onChanged: (index) {
                                                    setState(() {
                                                      _selectedOption = index!;
                                                    });
                                                  },
                                                ),
                                                
                                              ],
                                            ),
                                            ],
                                          )),
                                      Expanded(
                                        flex: 4,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  '\$${(_counter * basePrice).toStringAsFixed(2)}',
                                                  style: const TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Row(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              4.0),
                                                      child: Material(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16),
                                                        child: InkWell(
                                                            onTap: () {
                                                              _incrementCounter();
                                                            },
                                                            child:
                                                                const CircleAvatar(
                                                              radius: 20,
                                                              child: Icon(
                                                                Icons.add,
                                                                size: 20,
                                                              ),
                                                            )),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              4.0),
                                                      child: Text(
                                                        '$_counter',
                                                        style: const TextStyle(
                                                            fontSize: 20),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              4.0),
                                                      child: Material(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16),
                                                        child: InkWell(
                                                            onTap: () {
                                                              _decrementCounter();
                                                            },
                                                            child:
                                                                const CircleAvatar(
                                                              radius: 20,
                                                              child: Icon(
                                                                Icons.remove,
                                                                size: 20,
                                                              ),
                                                            )),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          )),
        ],
      ),
    );
  }
}
