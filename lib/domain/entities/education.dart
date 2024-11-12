import 'package:cloud_firestore/cloud_firestore.dart';

class Education {
  final String? id;
  final String? name, date, degree, url;

  Education({this.name, this.date, this.degree, this.url, this.id});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'date': date,
      'degree': degree,
      'url': url,
    };
  }

  factory Education.fromMap(DocumentSnapshot map) {
    return Education(
      name: map['name'] ?? '',
      date: map['date'] ?? '',
      degree: map['degree'] ?? '',
      url: map['url'] ?? '',
    );
  }
}

List<Education> educationData = [
  Education(
      name: "Universidad Catolica de Santa María",
      date: "2015-2019",
      degree: "Systems Engineer",
      url: "https://ucsm.edu.pe/"),
];
