import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_crud/static/constants.dart';
import 'package:flutter/material.dart';

class UserProvider {
  static final _firestore = FirebaseFirestore.instance;
  static const userCollection = AppConstants.usersCollection;

  static Future<List<Map<String, dynamic>>> getData() async {
    try {
      final users = await _firestore.collection(userCollection).get();
      return users.docs.map((user) => user.data()).toList();
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>> fetchUser() {
    try {
      return _firestore
          .collection(userCollection)
          .snapshots()
          .asBroadcastStream();
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  static Future<void> createUser(String name, String likes, int age) async {
    try {
      final payload = {
        'name': name,
        'likes': likes,
        'age': age,
      };

      await _firestore
          .collection(userCollection)
          .doc(DateTime.now().microsecondsSinceEpoch.toString())
          .set(payload);
    } catch (e) {
      rethrow;
    }
  }
}
