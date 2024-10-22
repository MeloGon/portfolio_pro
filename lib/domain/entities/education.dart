class Education {
  final String? id;
  final String name, date, degree, url;

  Education(this.name, this.date, this.degree, this.url, {this.id});
}

List<Education> educationData = [
  Education("Universidad Catolica de Santa María", "2015-2019",
      "Systems Engineer", "https://ucsm.edu.pe/"),
];
