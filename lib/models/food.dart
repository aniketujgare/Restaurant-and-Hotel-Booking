class Food {
  String imgUrl;
  String name;
  num price;
  // List<Map<String, String>> ingredients;
  Food(
    this.imgUrl,
    this.name,
    this.price,
  );

  Map<String, dynamic> toMap() {
    return {
      'imgUrl': imgUrl,
      'name': name,
      'price': price,
      // 'ingredients': ingredients,
    };
  }
}
