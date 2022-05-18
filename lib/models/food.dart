class Food {
  String imgUrl;
  String desc;
  String name;
  String waitTime;
  num score;
  String cal;
  num price;
  num quantity;
  // List<Map<String, String>> ingredients;
  String about;
  bool hightLight;
  Food(this.imgUrl, this.desc, this.name, this.waitTime, this.score, this.cal,
      this.price, this.quantity, this.about,
      {this.hightLight = false});

  Map<String, dynamic> toMap() {
    return {
      'imgUrl': imgUrl,
      'desc': desc,
      'name': name,
      'waitTime': waitTime,
      'score': score,
      'cal': cal,
      'price': price,
      'quantity': quantity,
      'about': about,
      'hightLight': hightLight,
      // 'ingredients': ingredients,
    };
  }

  static List<Food> generateRecommendFoods() {
    return [
      Food(
        'assets/images/dish1.png',
        'No1. in Sales',
        'Soba Soup',
        '50 min',
        4.8,
        '325 kcal',
        70,
        1,
        // [
        //   {
        //     'Noodle': 'assets/images/ingre1.png',
        //   },
        //   {
        //     'Shrip': 'assets/images/ingre2.png',
        //   },
        //   {
        //     'Egg': 'assets/images/ingre3.png',
        //   },
        // ],
        'Soba noodle soup is a traditional Japanese dish served either cold or hot and featuring thin noodles made from buckwheat flour (“soba” is the Japanese word for buckwheat). For cold or chilled soba, the noodles are served separately from the dipping broth',
        hightLight: true,
      ),
      Food(
        'assets/images/dish2.png',
        'No1. in Sales',
        'Sai Us Samun Piral',
        '50 min',
        4.8,
        '325 kcal',
        150,
        1,
        // [
        //   {
        //     'Noodle': 'assets/images/ingre1.png',
        //   },
        //   {
        //     'Shrip': 'assets/images/ingre2.png',
        //   },
        //   {
        //     'Egg': 'assets/images/ingre3.png',
        //   },
        // ],
        'Soba noodle soup is a traditional Japanese dish served either cold or hot and featuring thin noodles made from buckwheat flour (“soba” is the Japanese word for buckwheat). For cold or chilled soba, the noodles are served separately from the dipping broth',
        hightLight: true,
      ),
      Food(
        'assets/images/dish3.png',
        'No1. in Sales',
        'Ratatouie Pasta',
        '50 min',
        4.8,
        '325 kcal',
        345,
        1,
        // [
        //   {
        //     'Noodle': 'assets/images/ingre1.png',
        //   },
        //   {
        //     'Shrip': 'assets/images/ingre2.png',
        //   },
        //   {
        //     'Egg': 'assets/images/ingre3.png',
        //   },
        // ],
        'Soba noodle soup is a traditional Japanese dish served either cold or hot and featuring thin noodles made from buckwheat flour (“soba” is the Japanese word for buckwheat). For cold or chilled soba, the noodles are served separately from the dipping broth',
        hightLight: true,
      )
    ];
  }

  static List<Food> generatePopularFoods() {
    return [
      Food(
        'assets/images/dish4.png',
        'Most Popular',
        'Tomato Chicken',
        '50 min',
        4.8,
        '325 kcal',
        199,
        1,
        // [
        //   {
        //     'Noodle': 'assets/images/ingre1.png',
        //   },
        //   {
        //     'Shrip': 'assets/images/ingre2.png',
        //   },
        //   {
        //     'Egg': 'assets/images/ingre3.png',
        //   },
        // ],
        'Soba noodle soup is a traditional Japanese dish served either cold or hot and featuring thin noodles made from buckwheat flour (“soba” is the Japanese word for buckwheat). For cold or chilled soba, the noodles are served separately from the dipping broth',
        hightLight: true,
      )
    ];
  }
}
