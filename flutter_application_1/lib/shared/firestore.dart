// Class for Firestore
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/models/mobs.dart';
import 'dart:async';

class FirestoreData {
  final FirebaseFirestore db = FirebaseFirestore.instance;

  // Create functions to fetch data
  Future<List<Mobs>?> getPlants() async {
    try {
      CollectionReference plantCollection = db.collection("Minecraft Mobs");
      List<Mobs> myPlants = List.empty(growable: true);

      // fetch data
      QuerySnapshot snapshot = await plantCollection.get();
      List<QueryDocumentSnapshot> plantList = snapshot.docs;

      for (DocumentSnapshot snap in plantList) {
        // transform the data
        Mobs temp = Mobs(snap.id, snap.get("name"), snap.get("health"),
            snap.get("biome"), snap.get("description"), snap.get("image"));
        myPlants.add(temp);
      }
      // print(plantList);

      return myPlants;
    } catch (error) {
      // print(error);
      return null;
    }
  }
}
