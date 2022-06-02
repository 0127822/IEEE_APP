class Course {
  final int? id;
  final String? title;
  final String? imageUrl;
  final String? date;
  final String? courseContent;
  final String? courseDescription;
  final String? perquisites;
  final String? instructors;
  final String? courseLength;
  final String? fees;

  Course(
      {this.id,
      this.date,
      this.title,
      this.imageUrl,
      this.courseContent,
      this.courseDescription,
      this.perquisites,
      this.instructors,
      this.courseLength,
      this.fees});

  static fromJson(Map<String, dynamic> json) {
    Course course = Course(
        id: json['id'],
        title: json['attributes']['title'],
        date: json['attributes']['createdAt'],
        imageUrl: json['attributes']['image'],
        courseContent: json['attributes']['content'],
        courseDescription: json['attributes']['description'],
        // courseDescription: "Not Avaliable Yet from the API",
        perquisites: json['attributes']['prerequisites'],
        instructors: json['attributes']['instructor'],
        courseLength: json['attributes']['length'],
        fees: json['attributes']['fees']);
    return course;
  }
}
