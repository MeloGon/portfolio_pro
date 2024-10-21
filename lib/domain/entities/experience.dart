class Experience {
  final String? id;
  final String date;
  final String occupation;
  final String place;
  final String content;
  final String company;

  Experience(this.occupation, this.date, this.place, this.content, this.company,
      {this.id});
}

final List<Experience> experiencesTemporal = [
  Experience(
      "Mobile developer",
      "Sept 2022 – Sept 2024",
      "Bogotá, Colombia",
      "Development collaborator in multiple modules within the Picap , an app of urban mobility that allows users to request personal transportation or packages transportation, working with the MVVM pattern together with Stacked and working with some native Android modules with Kotlin and on iOS with swift Participation in code review for the integration of new modules within the app Modules worked within the Picap app are Picash, maps with mapbox and marketing. Implementation of unit tests using Mockito and widgets using Patrol.",
      "Picap"),
  Experience(
      "Mobile developer",
      "March 2024 – May 2024",
      "Arequipa, Perú",
      "Development of a customer management platform for a small company dedicated to the field of health and visual well-being. Using Flutter web  and deploying it on the web with Firebase Hosting",
      "Freelance"),
  Experience(
      "Mobile developer",
      "Jan 2022 – Jan 2024",
      "Lima, Perú",
      "Development of multiple applications for different areas using Flutter, applying state managers such as flutter bloc and Getx. Development of native modules for Android with Kotlin and for iOS with Swift, integrating them with platform channels to Flutter applications Tracking the Xaggo application with firebase analytics and facebook analytics. App development collaborator for Xaggo , an application in the field of financial services and electronic payments with deployments to testflight.",
      "Masuno"),
  Experience(
      "Mobile developer",
      "Aug 2021 – May 2022",
      "Medellin, Colombia",
      "Implementation of models and notation of business processes based on the requirements expressed by the client, development and continuous support of certain modules for the banking and financial app. Module maintenance and support in log tracking for the Finandina bank application using Flutter with provider manage statements.",
      "Tres Astronautas"),
  Experience(
      "Mobile developer",
      "Jan 2020 – Apr 2021",
      "Arequipa, Perú",
      "Built differents apps to control work orders and projects with a certain department for a company in the mining industry Development of applications in Java and subsequent migration of them using Flutter Participation in decision making for the optimization of processes within the app",
      "Innovadis"),
  Experience(
      "Mobile developer",
      "March 2019 – Jun 2019",
      "Arequipa, Perú",
      "Development collaborator in multiple applications in Java for companies in different sectors Participation in UI design",
      "Adiasoft"),
];
