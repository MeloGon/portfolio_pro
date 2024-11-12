import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/domain/entities/education.dart';
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

@Riverpod(keepAlive: true)
Future<List<Education>> getEducation(Ref ref) async {
  // CollectionReference users = FirebaseFirestore.instance.collection('portfolio');
  return FirebaseFirestore.instance
      .collection('portfolio')
      .doc('education')
      .collection('list_education')
      .get()
      .then((listEducation) {
    return listEducation.docs
        .map((education) => Education.fromMap(education))
        .toList();
  });
}
