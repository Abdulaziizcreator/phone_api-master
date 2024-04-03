class Student {
  String? firstName;
  String? lastName;
  int? course;
  String? faculty;

  Student({
    required this.firstName,
    required this.lastName,
    required this.faculty,
    required this.course,
  });

  Student.fromJson(Map<String,dynamic> map):
      firstName = map['firstName'],
      lastName = map['lastName'],
      course = int.parse(map['course']),
      faculty = map['faculty'];

  Map<String, dynamic>toJson()=>{
    'firstName':firstName,
    'lastName':lastName,
    'course':course.toString(),
    'faculty':faculty,
  };
}
