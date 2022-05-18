import 'package:cloud_firestore/cloud_firestore.dart';

import 'food.dart';

class Restaurantt {
  String name;
  String waitTime;
  String distance;
  String label;
  String logoUrl;
  String desc;
  num score;
  Map<String, List<Food>> menu;
  // dynamic menu;
  Restaurantt(this.name, this.waitTime, this.distance, this.label, this.logoUrl,
      this.desc, this.score, this.menu);

  Restaurantt.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  )   : name = snapshot.data()?["name"],
        waitTime = snapshot.data()?["waitTime"],
        distance = snapshot.data()?["distance"],
        label = snapshot.data()?["label"],
        logoUrl = snapshot.data()?["logoUrl"],
        desc = snapshot.data()?["desc"],
        score = snapshot.data()?["score"],
        menu = snapshot.data()?["menu"];

  Map<String, dynamic> toFirestore() {
    return {
      'name': name,
      'waitTime': waitTime,
      'distance': distance,
      'label': label,
      'logoUrl': logoUrl,
      'desc': desc,
      'score': score,
      'menu': menu,
    };
  }
}
