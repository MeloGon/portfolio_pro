import 'package:cloud_firestore/cloud_firestore.dart';

class Profile {
  final String? name;
  final String? grade;
  final String? place;
  final String? description;

  Profile({this.name, this.grade, this.place, this.description});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'grade': grade,
      'place': place,
      'description': description,
    };
  }

  factory Profile.fromMap(DocumentSnapshot map) {
    return Profile(
      name: map['name'] ?? '',
      grade: map['grade'] ?? '',
      place: map['place'] ?? '',
      description: map['description'] ?? '',
    );
  }
}
