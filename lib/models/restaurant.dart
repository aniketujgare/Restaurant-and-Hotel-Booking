import 'food.dart';

// class Menu {
//    Food f=
//   List<Map<String,String>> dishes;
//   Menu(this.dishes, this.menuName);

//     Map<String, List<Map<String,String>>> toMap() {
//     return {
//       'name': name,
//       'waitTime': waitTime,
//       'distance': distance,
//       'label': label,
//       'logoUrl': logoUrl,
//       'desc': desc,
//       'score': score,
//       'menu': menu,
//     };
//   }

// }

class Restaurant {
  String name;
  String waitTime;
  String distance;
  String label;
  String logoUrl;
  String desc;
  num score;
  // Map<String, List<Food>> menu;
  Map<String, List<Food>> menu;
  Restaurant(this.name, this.waitTime, this.distance, this.label, this.logoUrl,
      this.desc, this.score, this.menu);

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'waitTime': waitTime,
      'distance': distance,
      'label': label,
      'logoUrl': logoUrl,
      'desc': desc,
      'score': score,
      'menu': menu as dynamic,
    };
  }

  // static Restaurant generateRestaurant() {
  //   return Restaurant(
  //     'Restaurant',
  //     '20-30 min',
  //     '2.4 km',
  //     'Restaurnat',
  //     'assets/images/res_logo.png',
  //     'Orange sanwiches is delicious',
  //     4.7,
  //     {
  //       'Recommend': Food.generateRecommendFoods(),
  //       'Popular': Food.generatePopularFoods(),
  //       'Noodles': [],
  //       'Pizza': [],
  //     },
  //   );
  // }
}
