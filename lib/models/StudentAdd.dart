import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'Student.dart';

// ignore: must_be_immutable
class StudentAdd extends StatefulWidget{
  List<Student> students;

  // StudentAdd(List<Student> students){
  //   this.students=students;
  // }

  StudentAdd(this.students); // bu kod üsteki koda eşit.

  @override
  State<StatefulWidget> createState() {
    return _StudentAddState();
  }
}

class _StudentAddState extends State<StudentAdd> {
  var formKey = GlobalKey<FormState>();
  Student student = Student("", "", 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Öğrenci Ekle"),
      ),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Form(
        key: formKey,
        child: Column(
          children: <Widget>[
            buildFirstNameField(),
            buildLastNameField(),
            buildGradeField(),
            buildSubmitButton()
          ],
        ),
      ),
    );
  }

  buildFirstNameField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Öğrenci Adı", hintText: "Tufan"),
      onSaved: (String value) {
        student.firstName = value;
      },
    );
  }

  buildLastNameField() {
    return TextFormField(
      decoration:
          InputDecoration(labelText: "Öğrenci Soyadı", hintText: "Karçam"),
      onSaved: (String value2) {
        student.lastName = value2;
      },
    );
  }

  buildGradeField() {
    return TextFormField(
      decoration:
          InputDecoration(labelText: "Öğrenci Sınav Notu", hintText: "75"),
      onSaved: (String value3) {
        this.student.grade = int.parse(value3);
      },
    );
  }

  Widget buildSubmitButton() {
    return ElevatedButton(
      child: Text("Kaydet"),
      onPressed: () {
        formKey.currentState.save();
        widget.students.add(student);
        Navigator.pop(context);
      },
    );
  }
}
