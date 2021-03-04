import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/Student.dart';

// ignore: must_be_immutable
class StudentUpdate extends StatefulWidget {
  List<Student> students;

  StudentUpdate(this.students);

  @override
  State<StatefulWidget> createState() {
    return _StudentUpdate();
  }
}

class _StudentUpdate extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Öğrenci Güncelle"),
      ),
      body: buildBody(),
    );
  }
}

buildBody() {}
