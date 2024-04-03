import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phone_api/model/student_model.dart';
import 'package:phone_api/service/database_service.dart';

import 'details_page.dart';

class GetDetails extends StatefulWidget {
  static const String id = 'get_details';

  const GetDetails({super.key});

  @override
  State<GetDetails> createState() => _GetDetailsState();
}

class _GetDetailsState extends State<GetDetails> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController courseController = TextEditingController();
  TextEditingController facultyController = TextEditingController();

  void _post() {
    String firstName = firstNameController.text.trim();
    String lastName = lastNameController.text.trim();
    int course = int.parse(courseController.text.trim());
    String faculty = facultyController.text.trim();
    Student student = Student(
        firstName: firstName,
        lastName: lastName,
        faculty: faculty,
        course: course);
    RTDBservice.createData(student: student);
    print('successfully');

    makeEmpty();
  }

  void makeEmpty() {
    firstNameController.clear();
    lastNameController.clear();
    courseController.clear();
    facultyController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, DetailsPage.id);
              },
              icon: const Icon(CupertinoIcons.arrow_right))
        ],
        title: const Text('Personal Details'),
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.shade300,
                  ),
                  child: TextField(
                    controller: firstNameController,
                    decoration: InputDecoration(
                      hintText: 'firstName',
                      hintStyle: TextStyle(color: Colors.grey),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.shade300,
                  ),
                  child: TextField(
                    controller: lastNameController,
                    decoration: InputDecoration(
                      hintText: 'lastName',
                      hintStyle: TextStyle(color: Colors.grey),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.shade300,
                  ),
                  child: TextField(
                    controller: courseController,
                    decoration: InputDecoration(
                      hintText: 'course',
                      hintStyle: TextStyle(color: Colors.grey),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.shade300,
                  ),
                  child: TextField(
                    controller: facultyController,
                    decoration: InputDecoration(
                      hintText: 'faculity',
                      hintStyle: TextStyle(color: Colors.grey),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    _post();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Colors.teal, // Change the background color here
                  ),
                  child: const Text(
                    "Update",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
