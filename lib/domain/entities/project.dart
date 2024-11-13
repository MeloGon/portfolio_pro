import 'package:cloud_firestore/cloud_firestore.dart';

class Project {
  final String? title;
  final String? description;
  final String? url;

  Project({this.title, this.description, this.url});

  Map<String, dynamic> toMap() {
    return {'title': title, 'description': description, 'url': url};
  }

  factory Project.fromMap(DocumentSnapshot map) {
    return Project(
        title: map['title'], description: map['description'], url: map['url']);
  }
}

final List<Project> projectsData = [
  Project(
    title: "Personal Portfolio",
    description:
        "A personal portfolio website to showcase my projects and skills.",
    url: null,
  ),
  Project(
    title: "Picap",
    description:
        "Picap is a motorcycle mobility application that operates in Latin America, offering fast and affordable transportation in cities with heavy traffic. In addition, it includes shipping and delivery services",
    url:
        "https://play.google.com/store/apps/details?id=co.picap.passenger&hl=es_PE",
  ),
  Project(
    title: "Xaggo",
    description:
        "Application to allows pay invoices of Peru from USA. It allows automatic payments, recurring payments and other functionalities more",
    url:
        "https://play.google.com/store/apps/details?id=com.masuno.xaggo&hl=es_PE",
  ),
  Project(
    title: "SUR+ SURGO",
    description:
        "Application to allows transmit live signal from Peru to Miami and other countries in USA. It has different sections like ondemand and live signal",
    url:
        "https://play.google.com/store/apps/details?id=com.orbemnetworks.orbem_template.surgo&hl=es",
  ),
  Project(
    title: "San Fernando Vales",
    description:
        "Application to manage and redeem food vouchers for the San Fernando company",
    url:
        "https://play.google.com/store/apps/details?id=pe.solera.sanfernando&hl=es_PE",
  ),
  Project(
    title: "Pecuaria",
    description:
        "Application to manage flocks of livestock and causes of illness",
    url: null,
  ),
  Project(
    title: "Isil",
    description:
        "Application that allows students to have all their information such as notes, schedules, events, benefits and more.",
    url: "https://play.google.com/store/apps/details?id=com.masuno.isil&hl=es",
  ),
  Project(
    title: "Vainsa",
    description:
        "Application to manage points of sale, incidents, inventory for the company Vainsa dedicated to the manufacture and marketing of faucets, toilets, valves and accessories for the home and construction",
    url: null,
  ),
  Project(
    title: "Hotspot",
    description: "Application to register QR tickets for access to events",
    url: null,
  ),
  Project(
    title: "Optical Tu vision",
    description:
        "Application to manage clients and files on the measurements of clients' eyes",
    url: null,
  ),
  Project(
    title: "Expeditor",
    description:
        "Application for a certain department in the mining sector that allows controlling work orders and inventory",
    url: null,
  ),
];
