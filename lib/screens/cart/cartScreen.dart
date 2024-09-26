// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:foodiapp_ui/component/color.dart';
import 'package:foodiapp_ui/model/data.dart';
import 'package:foodiapp_ui/widget/customAppBar.dart';
import 'package:foodiapp_ui/widget/textWidget.dart';
// class Cartscreen extends StatefulWidget {
//   Cartscreen({super.key,required this.cartItems});
// List<Model> cartItems = [];
//   @override
//   State<Cartscreen> createState() => _CartscreenState();
// }

// class _CartscreenState extends State<Cartscreen> {
//   int _counter = 1;
//   double basePrice = 37;
//   int _selectedOption = 0; // Radio button value
//   List<Model> cartItems = [];

//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }

//   void _decrementCounter() {
//     if (_counter > 1) {
//       setState(() {
//         _counter--;
//       });
//     }
//   }
// Map<Model, int> selectedItems = {};
//   bool selectAll = false; // Track if all items are selected
//   double totalPrice = 0.0; // Total price for selected items

//   @override
//   void initState() {
//     super.initState();
//     widget.cartItems.forEach((item) {
//       selectedItems[item] = 1; // Initialize with quantity 1 for all cart items
//     });
//     updateTotalPrice(); // Initialize total price
//   }

//   // Method to update total price based on selected items
//   void updateTotalPrice() {
//     setState(() {
//       totalPrice = 0.0;
//       selectedItems.forEach((item, quantity) {
//         if (quantity > 0) {
//           totalPrice += (double.parse(item.price ?? '0') * quantity);
//         }
//       });
//     });
//   }

//   // Method to toggle select all items
//   void toggleSelectAll(bool isSelected) {
//     setState(() {
//       selectAll = isSelected;
//       selectedItems.forEach((item, quantity) {
//         selectedItems[item] = isSelected ? quantity : 0; // Unselect all if false
//       });
//       updateTotalPrice();
//     });
//   }

//   // Method to update quantity
//   void updateQuantity(Model item, int quantity) {
//     setState(() {
//       selectedItems[item] = quantity;
//       updateTotalPrice();
//     });
//   }

//   // Method to delete an item
//   void deleteItem(Model item) {
//     setState(() {
//       widget.cartItems.remove(item); // Remove the item from cart
//       selectedItems.remove(item); // Remove it from selected items map
//       updateTotalPrice();
//     });
//   }

//   // Method to select/unselect a single item
//   void toggleSelectItem(Model item, bool isSelected) {
//     setState(() {
//       selectedItems[item] = isSelected ? selectedItems[item]! : 0;
//       updateTotalPrice();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: Container(
//           height: 60,
//          // color: primaryColor, // Replace with primaryColor if you have it defined
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                  textPoppins(
//                         text: 'Total: ${_counter*basePrice}TK',
//                         color: blackColor,
//                         isTile: true,
//                         fontSize: 18,
//                       ),

//                 MaterialButton(
//                   color: primaryColor,
//                   clipBehavior: Clip.none,
//                   onPressed: () {
//                     if (_counter > 0) {
//                       showDialog(
//                         context: context,
//                         builder: (context) => AlertDialog(
//                           title: const Text("Order Success"),
//                           content: const Text("Your order has been placed!"),
//                           actions: [
//                             TextButton(
//                               onPressed: () => Navigator.pop(context),
//                               child: const Text("OK"),
//                             ),
//                           ],
//                         ),
//                       );
//                     }
//                   },
//                   child:  textPoppins(
//                         text: 'CHECKOUT',
//                         color: whiteColor,
//                         isTile: true,
//                         fontSize: 18,
//                       ),

//                 ),
//               ],
//             ),
//           )),
//       body: Column(
//         children: [

//          Customappbar(title: 'Order Detail'),
//           Expanded(
//               child: ListView.builder(
//                 itemCount: cartItems.length,
//             itemBuilder: (context, index) {
//                   Model item = widget.cartItems[index];
//                  bool isSelected = selectedItems[item]! > 0;
//               return Row(
//                 children: [
//                   Expanded(flex: 2, child: Text('')),
//                   Expanded(
//                     flex: 9,
//                     child: Padding(
//                       padding: EdgeInsets.all(10.0),
//                       child: Container(
//                         decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(12)),
//                         height: MediaQuery.of(context).size.height * 0.20,
//                         child: Stack(
//                           clipBehavior: Clip.none,
//                           children: [
//                             Positioned(

//                                 left: -75,
//                                 child: Image.asset(
//                                   // 'assets/image 5.png',
//                                   item.title.toString(),
//                                   height:
//                                       MediaQuery.of(context).size.height * 0.2,
//                                   width:
//                                       MediaQuery.of(context).size.height * .2,
//                                 )),
//                             Row(
//                               children: [
//                                 Expanded(flex: 3, child: Text('')),
//                                 Expanded(
//                                   flex: 7,
//                                   child: Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       Expanded(
//                                           flex: 5,
//                                           child: Row(
//                                             children: [
//                                               Column(
//                                                 crossAxisAlignment:
//                                                     CrossAxisAlignment.start,
//                                                 children: [
//                                                   Text(
//                                                     item.title.toString(),
//                                                     style: TextStyle(
//                                                         fontSize: 18,
//                                                         fontWeight:
//                                                             FontWeight.bold),
//                                                   ),
//                                                   Text(
//                                                     'Most Popular',
//                                                     style: TextStyle(
//                                                         fontSize: 14,
//                                                         color: Colors.grey),
//                                                   )
//                                                 ],
//                                               ),
//                                               const SizedBox(height: 10),
//                                             Row(
//                                               children: [
//                                                 Radio<int>(
//                                                   value: 0,
//                                                   groupValue: _selectedOption,
//                                                   onChanged: (index) {
//                                                     setState(() {
//                                                       _selectedOption = index!;
//                                                     });
//                                                   },
//                                                 ),

//                                               ],
//                                             ),
//                                             ],
//                                           )),
//                                       Expanded(
//                                         flex: 4,
//                                         child: Column(
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.start,
//                                           children: [
//                                             Row(
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment
//                                                       .spaceBetween,
//                                               children: [
//                                                 Text(
//                                                   '\TK ${(_counter*basePrice)}',
//                                                   style: const TextStyle(
//                                                       fontSize: 18,
//                                                       fontWeight:
//                                                           FontWeight.bold),
//                                                 ),
//                                                 Row(
//                                                   children: [
//                                                     Padding(
//                                                       padding:
//                                                           const EdgeInsets.all(
//                                                               4.0),
//                                                       child: Material(
//                                                         borderRadius:
//                                                             BorderRadius
//                                                                 .circular(16),
//                                                         child: InkWell(
//                                                             onTap: () {
//                                                               _incrementCounter();
//                                                             },
//                                                             child:
//                                                                 const CircleAvatar(
//                                                               radius: 15,
//                                                               child: Icon(
//                                                                 Icons.add,
//                                                                 size: 18,
//                                                               ),
//                                                             )),
//                                                       ),
//                                                     ),
//                                                     Padding(
//                                                       padding:
//                                                           const EdgeInsets.all(
//                                                               4.0),
//                                                       child: Text(
//                                                         '$_counter',
//                                                         style: const TextStyle(
//                                                             fontSize: 18),
//                                                       ),
//                                                     ),
//                                                     Padding(
//                                                       padding:
//                                                           const EdgeInsets.all(
//                                                               4.0),
//                                                       child: Material(
//                                                         borderRadius:
//                                                             BorderRadius
//                                                                 .circular(16),
//                                                         child: InkWell(
//                                                             onTap: () {
//                                                               _decrementCounter();
//                                                             },
//                                                             child:
//                                                                 const CircleAvatar(
//                                                               radius: 15,
//                                                               child: Icon(
//                                                                 Icons.remove,
//                                                                 size: 18,
//                                                               ),
//                                                             )),
//                                                       ),
//                                                     ),
//                                                   ],
//                                                 ),
//                                               ],
//                                             ),

//                                           ],
//                                         ),
//                                       )
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             )
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               );
//             },
//           )),
//         ],
//       ),
//     );
//   }
// }

class Cartscreen extends StatefulWidget {
  final List<Model> cartItems; // Receive the list of cart items from HomeScreen

  const Cartscreen({Key? key, required this.cartItems}) : super(key: key);

  @override
  _CartscreenState createState() => _CartscreenState();
}

class _CartscreenState extends State<Cartscreen> {
  // Map to track selected products and their quantities
  Map<Model, int> selectedItems = {};
  bool selectAll = false; // Track if all items are selected
  double totalPrice = 0.0; // Total price for selected items

  @override
  void initState() {
    super.initState();
    widget.cartItems.forEach((item) {
      selectedItems[item] = 1; // Initialize with quantity 1 for all cart items
    });
    updateTotalPrice(); // Initialize total price
  }

  // Method to update total price based on selected items
  void updateTotalPrice() {
    setState(() {
      totalPrice = 0.0;
      selectedItems.forEach((item, quantity) {
        if (quantity > 0) {
          totalPrice += (double.parse(item.price ?? '0') * quantity);
        }
      });
    });
  }

  // Method to toggle select all items
  void toggleSelectAll(bool isSelected) {
    setState(() {
      selectAll = isSelected;
      selectedItems.forEach((item, quantity) {
        selectedItems[item] =
            isSelected ? quantity : 0; // Unselect all if false
      });
      updateTotalPrice();
    });
  }

  // Method to update quantity
  void updateQuantity(Model item, int quantity) {
    setState(() {
      selectedItems[item] = quantity;
      updateTotalPrice();
    });
  }

  // Method to delete an item
  void deleteItem(Model item) {
    setState(() {
      widget.cartItems.remove(item); // Remove the item from cart
      selectedItems.remove(item); // Remove it from selected items map
      updateTotalPrice();
    });
  }

  // Method to select/unselect a single item
  void toggleSelectItem(Model item, bool isSelected) {
    setState(() {
      selectedItems[item] = isSelected ? selectedItems[item]! : 0;
      updateTotalPrice();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
        backgroundColor: primaryColor,
      ),
      body: Column(
        children: [
          // Select All Checkbox
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Select All"),
                Checkbox(
                  value: selectAll,
                  onChanged: (value) {
                    toggleSelectAll(value ?? false);
                  },
                ),
              ],
            ),
          ),

          // Cart Items List
          Expanded(
            child: ListView.builder(
              itemCount: widget.cartItems.length,
              itemBuilder: (context, index) {
                Model item = widget.cartItems[index];
                bool isSelected = selectedItems[item]! > 0;
                return Row(children: [
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
                                  // 'assets/image 5.png',
                                  item.image.toString(),
                                  height:
                                      MediaQuery.of(context).size.height * 0.2,
                                  width:
                                      MediaQuery.of(context).size.height * .2,
                                )),
                            Row(
                              children: [
                                Expanded(flex: 3, child: Text('')),
                                Expanded(
                                  flex: 7,
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
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      // Checkbox for selecting item
                                                      Checkbox(
                                                        value: isSelected,
                                                        onChanged: (value) {
                                                          toggleSelectItem(item,
                                                              value ?? false);
                                                        },
                                                      ),
                                                      Text(
                                                        item.title.toString(),
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ), 
                                                      
                                                      // // Delete Button
                                                      IconButton(
                                                        icon: const Icon(
                                                            Icons.delete,
                                                            color: Colors.red),
                                                        onPressed: () {
                                                          deleteItem(item);
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                            SnackBar(
                                                              content: Text(
                                                                  "${item.title} removed from cart!"),
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                  Text(
                                                    'Most Popular',
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        color: Colors.grey),
                                                  )
                                                ],
                                              ),
                                              const SizedBox(height: 10),
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
                                                  '\TK ${(item.price.toString())}',
                                                  style: const TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                //       // Quantity Control
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    IconButton(
                                                      icon: const Icon(
                                                          Icons.remove),
                                                      onPressed: () {
                                                        int currentQuantity =
                                                            selectedItems[
                                                                    item] ??
                                                                1;
                                                        if (currentQuantity >
                                                            1) {
                                                          updateQuantity(
                                                              item,
                                                              currentQuantity -
                                                                  1);
                                                        }
                                                      },
                                                    ),
                                                    Text(selectedItems[item]
                                                        .toString()),
                                                    IconButton(
                                                      icon:
                                                          const Icon(Icons.add),
                                                      onPressed: () {
                                                        int currentQuantity =
                                                            selectedItems[
                                                                    item] ??
                                                                1;
                                                        updateQuantity(
                                                            item,
                                                            currentQuantity +
                                                                1);
                                                      },
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
                  )
                ]);

                // return ListTile(
                //   leading: Image.asset(
                //     item.image.toString(),
                //     width: 50,
                //     height: 50,
                //   ),
                //   title: Text(item.title.toString()),
                //   subtitle: Text("TK ${item.price}"),
                //   trailing: Row(
                //     mainAxisSize: MainAxisSize.min,
                //     children: [
                //       // Checkbox for selecting item
                //       Checkbox(
                //         value: isSelected,
                //         onChanged: (value) {
                //           toggleSelectItem(item, value ?? false);
                //         },
                //       ),

                // // Delete Button
                // IconButton(
                //   icon: const Icon(Icons.delete, color: Colors.red),
                //   onPressed: () {
                //     deleteItem(item);
                //     ScaffoldMessenger.of(context).showSnackBar(
                //       SnackBar(
                //         content: Text("${item.title} removed from cart!"),
                //       ),
                //     );
                //   },
                // ),

                //       // Quantity Control
                //       Row(
                //         mainAxisSize: MainAxisSize.min,
                //         children: [
                //           IconButton(
                //             icon: const Icon(Icons.remove),
                //             onPressed: () {
                //               int currentQuantity = selectedItems[item] ?? 1;
                //               if (currentQuantity > 1) {
                //                 updateQuantity(item, currentQuantity - 1);
                //               }
                //             },
                //           ),
                //           Text(selectedItems[item].toString()),
                //           IconButton(
                //             icon: const Icon(Icons.add),
                //             onPressed: () {
                //               int currentQuantity = selectedItems[item] ?? 1;
                //               updateQuantity(item, currentQuantity + 1);
                //             },
                //           ),
                //         ],
                //       ),
                //     ],
                //   ),
                // );
              },
            ),
          ),

          // Total Price Section
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Total Price:",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "TK ${totalPrice.toStringAsFixed(2)}",
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                // Order Button
                ElevatedButton(
                  onPressed:
                      selectedItems.values.any((quantity) => quantity > 0)
                          ? () {
                              // Handle Order
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Order Placed Successfully!"),
                                ),
                              );
                            }
                          : null, // Disable if no items selected
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 15),
                  ),
                  child: const Text("Order Now"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
