 final List<String> tabNames = [
    'Pizza',
    'Burger',
    'Snacks',
    'Desserts',
    'Sushi'
  ];

    final List<List<String>> gridItems = [
    ['Pizza', 'Burger', 'Sushi', 'Pasta'], // Food items
    ['Coke', 'Juice', 'Water', 'Tea'], // Drink items
    ['Chips', 'Nuggets', 'Fries','Doo'], // Snacks items
    ['Ice', 'Ice Cream', 'Pie'], // Desserts items
    ['Sushi', 'Cake', 'Ice Cream', 'Pie'], // Desserts items
  ];

class Model {
  // ignore: non_constant_identifier_names
  String? image, title, discription, price, quantity, rating;
  List <String>?list;
  Model(
      {this.image,
      this.title,
      this.discription,
      this.price,
      this.quantity,
      this.rating,
      this.list,
      });
}
List<Model> tabNames_list = [
  Model(image: "assets/image 1.png",title: 'Pizza'),
  Model(image: "assets/image 5.png",title: 'Burger'),
  Model(image: "assets/image 3.png",title: 'Snacks'),
  Model(image: "assets/image 4.png",title: 'Desserts'),
  Model(image: "assets/image 1.png",title: 'Sushi'),
 
];
List<Model> tabCatNames1_list = [
  Model(image: "assets/image 1.png",title: 'Pizza',price: '23'),
  Model(image: "assets/image 1.png",title: 'Burger',price: '3'),
  Model(image: "assets/image 1.png",title: 'Snacks',price: '2'),
  Model(image: "assets/image 1.png",title: 'Desserts',price: '27'),
  Model(image: "assets/image 1.png",title: 'Sushi',price: '23'), 
  Model(image: "assets/image 1.png",title: 'Sushi',price: '23'),
   Model(image: "assets/image 1.png",title: 'Sushi',price: '23'),
];

List<Model> tabCatNames2_list = [
  Model(image: "assets/image 5.png",title: 'Burger',price: '3'),
  Model(image: "assets/image 5.png",title: 'Burger',price: '26'),
  Model(image: "assets/image 5.png",title: 'Burger',price: '23'),
  Model(image: "assets/image 5.png",title: 'Burger',price: '23'),
  Model(image: "assets/image 5.png",title: 'Burger',price: '23'),
];List<Model> tabCatNames3_list = [
  Model(image: "assets/image 1.png",title: 'Pizza',price: '23'),
  Model(image: "assets/image 1.png",title: 'Burger',price: '3'),
  Model(image: "assets/image 1.png",title: 'Snacks',price: '2'),
  Model(image: "assets/image 1.png",title: 'Desserts',price: '27'),
  Model(image: "assets/image 1.png",title: 'Sushi',price: '23'),
];

List<Model> tabCatNames4_list = [
  Model(image: "assets/image 5.png",title: 'Burger',price: '3'),
  Model(image: "assets/image 5.png",title: 'Burger',price: '26'),
  Model(image: "assets/image 5.png",title: 'Burger',price: '23'),
  Model(image: "assets/image 5.png",title: 'Burger',price: '23'),
  Model(image: "assets/image 5.png",title: 'Burger',price: '23'),
];
List<Model> tabCatNames5_list = [
  Model(image: "assets/image 5.png",title: 'Burger',price: '3'),
  Model(image: "assets/image 5.png",title: 'Burger',price: '26'),
  Model(image: "assets/image 5.png",title: 'Burger',price: '23'),
  Model(image: "assets/image 5.png",title: 'Burger',price: '23'),
  Model(image: "assets/image 5.png",title: 'Burger',price: '23'),
];

List<List<Model>> gridItems_list = [
  tabCatNames1_list,
  tabCatNames2_list,
  tabCatNames3_list,
  tabCatNames4_list,
  tabCatNames5_list,
];