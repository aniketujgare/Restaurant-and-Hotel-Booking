import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/restaurantt.dart';

class Database {
  static final db = FirebaseFirestore.instance;

  // void addFoodDish(Restaurantt rest) {
  //   final docRef = db.collection("restaurant").doc("jkLvqyLif4GqtG0WFhmA");
  //   docRef.set(rest., SetOptions(merge: true));
  // }

  Future<Restaurantt?> getRestarurant() async {
    final ref =
        db.collection("restaurant").doc("jkLvqyLif4GqtG0WFhmA").withConverter(
              fromFirestore: Restaurantt.fromFirestore,
              toFirestore: (Restaurantt city, _) => city.toFirestore(),
            );
    final docSnap = await ref.get();
    final city = docSnap.data(); // Convert to City object
    if (city != null) {
      // print(city.menu['Recommended'][0]['imgUrl']);
    } else {
      // print("No such document.");
    }
    return city;
  }

  getRestaurantStream() {
    return db.collection("restaurant").snapshots();
  }
}
