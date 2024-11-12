import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/domain/entities/profile.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'firebase_connection.g.dart';

@Riverpod(keepAlive: true)
Future<Profile> getProfile(Ref ref) async {
  // CollectionReference users = FirebaseFirestore.instance.collection('portfolio');
  return FirebaseFirestore.instance
      .collection('portfolio')
      .doc('profile')
      .get()
      .then((profile) {
    return Profile.fromMap(profile);
  });
}
