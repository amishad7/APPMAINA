class Global {
  static List allProducts = [
    {
      'CategoryName': 'Pizza',
      'data': [
        {
          "id": 1,
          "title": "Simple pizza",
          "price": 100,
          "cal": 150.96,
          'qty': 1,
          "rating": 4.00,
          'fav': false,
          'inCart': false,
          'CategoryName': 'Pizza',
          "description":
              "A hugely popular margherita, with a deliciously tangy single cheese topping",
          "thumbnail": "https://www.dominos.co.in/files/items/Margherit.jpg",
        },
        {
          "id": 2,
          "title": "veg&cheese pizza",
          'fav': false,
          'inCart': false,
          'qty': 1,
          "price": 160,
          "cal": 120.96,
          "rating": 5.00,
          'CategoryName': 'Pizza',
          "description":
              "A hugely popular margherita, with a deliciously tangy single cheese topping",
          "thumbnail": "https://www.dominos.co.in/files/items/Farmhouse.jpg",
        },
        {
          "id": 3,
          "title": "plain cheese pizza",
          "price": 140,
          'fav': false,
          'qty': 1,
          "cal": 120.96,
          "rating": 3.00,
          'inCart': false,
          'CategoryName': 'Pizza',
          "description":
              "A hugely popular margherita, with a deliciously tangy single cheese topping",
          "thumbnail": "https://www.dominos.co.in/files/items/Margherit.jpg",
        },
      ],
    },
    {
      'CategoryName': 'Drinks',
      'data': [
        {
          "id": 1,
          "title": "Orange juice",
          'qty': 1,
          'fav': false,
          "price": 300,
          "cal": 120.96,
          "rating": 4.03,
          'inCart': false,
          'CategoryName': 'Juice',
          "description":
              "Choose your favourite non-veg pizzas from the Domino's Pizza menu. Get fresh non-veg pizza with your choice of crusts & toppings",
          "thumbnail":
              "https://i.pinimg.com/originals/5c/f4/01/5cf401082d2216150b01a521c64cf0a5.jpg",
        },
        {
          "id": 2,
          "title": "Strawberry juice",
          "price": 250,
          'qty': 1,
          "cal": 130.96,
          'fav': false,
          "rating": 5.0,
          'CategoryName': 'Juice',
          "description":
              "Choose your favourite non-veg pizzas from the Domino's Pizza menu. Get fresh non-veg pizza with your choice of crusts & toppings",
          'inCart': false,
          "thumbnail":
              "https://i.pinimg.com/1200x/31/22/8f/31228f9e80515199d4c38acac8e22d8b.jpg",
        },
        {
          "id": 3,
          'qty': 1,
          "title": "cherry",
          "price": 150,
          "cal": 120.96,
          'fav': false,
          'inCart': false,
          "rating": 4.3,
          'CategoryName': 'Juice',
          "description":
              "Choose your favourite non-veg pizzas from the Domino's Pizza menu. Get fresh non-veg pizza with your choice of crusts & toppings",
          "thumbnail":
              "https://i.pinimg.com/1200x/ff/f7/5a/fff75a2a4b31f4f9d68ed84904f5c328.jpg",
        },
      ],
    },
    {
      'CategoryName': 'salads',
      'data': [
        {
          "id": 1,
          "title": "veg salad",
          'inCart': false,
          'qty': 1,
          "price": 50,
          'fav': false,
          "cal": 120.96,
          "rating": 4.2,
          'CategoryName': 'Juice',
          "description":
              "Choose your favourite non-veg pizzas from the Domino's Pizza menu. Get fresh non-veg pizza with your choice of crusts & toppings",
          "thumbnail":
              "https://i.pinimg.com/550x/95/40/78/95407893c089eceb5cd83d42f578c3df.jpg",
        },
        {
          "id": 2,
          "title": "simple fruits",
          "price": 80,
          "cal": 120.96,
          'fav': false,
          'qty': 1,
          'inCart': false,
          "rating": 4.7,
          'CategoryName': 'Juice',
          "description":
              "Choose your favourite non-veg pizzas from the Domino's Pizza menu. Get fresh non-veg pizza with your choice of crusts & toppings",
          "thumbnail":
              "https://i.pinimg.com/736x/9e/be/da/9ebeda5ed27383a3e33bd5eb632bd141.jpg",
        },
        {
          "id": 3,
          "title": "salad",
          "price": 40,
          "cal": 120.96,
          'qty': 1,
          'fav': false,
          'inCart': false,
          "rating": 4.2,
          'CategoryName': 'Juice',
          "description":
              "Choose your favourite non-veg pizzas from the Domino's Pizza menu. Get fresh non-veg pizza with your choice of crusts & toppings",
          "thumbnail":
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRHLbq5o0PxxUBMAf0SvjVq3jJO-7SKk9hKzw&usqp=CAU",
        },
      ],
    },
  ];
  static num totalPrice = 0;
  static num subTotal = 0;
  static TotalPrice() {
    num sum = 0;
    cartProducts.forEach((e) {
      sum = sum + (e['price'] * e['qty']);
    });
    return sum;
  }

  static SubTotal() {
    num sum = 0;
    cartProducts.forEach((e) {
      sum = sum + e['price'];
    });
    return sum;
  }

  static List likeProducts = [];
  static List cartProducts = [];
}
