class Project {
  final String title;
  final String description;
  final String? url;

  Project(this.title, this.description, this.url);
}

final List<Project> projectsData = [
  Project(
    "Personal Portfolio",
    "A personal portfolio website to showcase my projects and skills.",
    null,
  ),
  Project(
    "Picap",
    "Picap is a motorcycle mobility application that operates in Latin America, offering fast and affordable transportation in cities with heavy traffic. In addition, it includes shipping and delivery services",
    "https://play.google.com/store/apps/details?id=co.picap.passenger&hl=es_PE",
  ),
  Project(
    "Xaggo",
    "Application to allows pay invoices of Peru from USA. It allows automatic payments, recurring payments and other functionalities more",
    "https://play.google.com/store/apps/details?id=com.masuno.xaggo&hl=es_PE",
  ),
  Project(
    "SUR+ SURGO",
    "Application to allows transmit live signal from Peru to Miami and other countries in USA. It has different sections like ondemand and live signal",
    "https://play.google.com/store/apps/details?id=com.orbemnetworks.orbem_template.surgo&hl=es",
  ),
  Project(
    "San Fernando Vales",
    "Application to manage and redeem food vouchers for the San Fernando company",
    "https://play.google.com/store/apps/details?id=pe.solera.sanfernando&hl=es_PE",
  ),
  Project(
    "Pecuaria",
    "Application to manage flocks of livestock and causes of illness",
    null,
  ),
  Project(
    "Isil",
    "Application that allows students to have all their information such as notes, schedules, events, benefits and more.",
    "https://play.google.com/store/apps/details?id=com.masuno.isil&hl=es",
  ),
  Project(
    "Vainsa",
    "Application to manage points of sale, incidents, inventory for the company Vainsa dedicated to the manufacture and marketing of faucets, toilets, valves and accessories for the home and construction",
    null,
  ),
  Project(
    "Hotspot",
    "Application to register QR tickets for access to events",
    null,
  ),
  Project(
    "Optical Tu vision",
    "Application to manage clients and files on the measurements of clients' eyes",
    null,
  ),
  Project(
    "Expeditor",
    "Application for a certain department in the mining sector that allows controlling work orders and inventory",
    null,
  ),
];
