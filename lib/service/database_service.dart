import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:phone_api/model/student_model.dart';

class RTDBservice {
  static void createData({required Student student}) {
    DatabaseReference databaseReference = FirebaseDatabase.instance.ref();
    databaseReference.child('students').push().set(student.toJson());
    print('successfully');
  }

  static Future<List<Student>> readData() async {
    List<Student> students = [];
    DatabaseReference databaseReference = FirebaseDatabase.instance.ref();
    Query _query = databaseReference.ref.child('students');
    DatabaseEvent event = await _query.once();
    DataSnapshot data = event.snapshot;

    for (var child in data.children) {
      child.key;
      var myJson = jsonEncode(child.value);
      Map<String, dynamic> map = jsonDecode(myJson);
      Student student = Student.fromJson(map);
      students.add(student);
    }
    return students;
  }

  Future<void> updateData(Student student, var studentKey) async {
    DatabaseReference databaseReference = FirebaseDatabase.instance.ref();
    await databaseReference
        .child('students')
        .child(studentKey)
        .update(student.toJson());
    print('update');
  }

  Future<void> deleteData(String studenId) async {
    DatabaseReference databaseReference = FirebaseDatabase.instance.ref();
    await databaseReference.child('students').child(studenId).remove();
    print('remov');
  }
}
