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

class _StudentUpdate extends State<StudentUpdate> {
    var formKey = GlobalKey<FormState>();
    Student student = Student("", "", 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Öğrenci Güncelle"),
      ),
      body: buildBody(),
    );
  }

  buildBody() {
  return Container(
    margin:EdgeInsets.all(20.0),
    child:Form(
      key: formKey,
      child:Column(
        children: [
          buildFirstNameField(),
          buildLastNameField(),
          buildGradeField(),
          buildSubmitButton()
          ],)
             )
        );
      }
      
  buildFirstNameField() {
    return TextFormField(
    
      decoration: InputDecoration(labelText: "Öğrenci Adı", hintText: "a"),
      onSaved: (String value) {
        student.firstName = value;
      },
    );
  }

  buildLastNameField() {
    return TextFormField(  
      decoration:
          InputDecoration(labelText: "Öğrenci Soyadı", hintText: "b"),
          
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

