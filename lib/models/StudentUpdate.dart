import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/Student.dart';
import 'package:flutter_application_2/student_validator.dart';

class StudentUpdate extends StatefulWidget {
  Student selectedStudent;

  //StudentUpdate(Student selectedStudent);
  StudentUpdate(Student selectedStudent) {
    this.selectedStudent = selectedStudent;
  }

  @override
  State<StatefulWidget> createState() {
    return _StudentAddState(selectedStudent);
  }
}

class _StudentAddState extends State<StudentUpdate>with StudentValidationMixin {
  Student selectedStudent;
  var formKey = GlobalKey<FormState>();

  _StudentAddState(Student selectedStudent) {
    this.selectedStudent = selectedStudent;
  }

  //StudentAdd(Student selectedStudent){
  // this.selectedStudent=selectedStudent;
  //}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Öğrenci Güncelle"),
        ),
        body: Container(
          margin: EdgeInsets.all(20.0),
          padding: EdgeInsets.all(10.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                buildFirstNameField(),
                buildLastNameField(),
                buildGradeField(),
                buildSubmitButtonField(),
              ],
            ),
          ),
        ));
  }

  buildFirstNameField() {
    return TextFormField(
      initialValue: selectedStudent.firstName,
      decoration: InputDecoration(
        labelText: "Öğrenci Adı:",
        hintText: "Fatih",
      ),
      validator: validateFirstName,
      onSaved: (String value) {
        selectedStudent.firstName = value;
      },
    );
  }

  buildLastNameField() {
    return TextFormField(
      initialValue: selectedStudent.lastName,
      decoration:
          InputDecoration(labelText: "Öğrenci Soyadı:", hintText: "Baycu"),
      validator: validateLastName,
      onSaved: (String value2) {
        selectedStudent.lastName = value2;
      },
    );
  }

  buildGradeField() {
    return TextFormField(
      initialValue: selectedStudent.grade.toString(),
      keyboardType: TextInputType.number,
      decoration: InputDecoration(labelText: "Sınav Notu:", hintText: "90"),
      validator: validateGrade,
      onSaved: (String value3) {
        selectedStudent.grade = int.parse(value3);
      },
    );
  }

  buildSubmitButtonField() {
    return ElevatedButton(
      child: Text("Kaydet"),
      onPressed: () {
        if (formKey.currentState.validate()) {
          formKey.currentState.save();
          //mesajGoster();
          saveStudent();
          Navigator.pop(context);
          //Navigator.push(context,MaterialPageRoute(builder: (context)=>MyApp()));
        }
      },
    );
  }

  void mesajGoster() {
    var alert = AlertDialog(
      title: Text("Öğrenci Ekleme"),
      content: Text("Ad: " +
          selectedStudent.firstName +
          "\nSoyad: " +
          selectedStudent.lastName +
          "\nNotu: " +
          selectedStudent.grade.toString() +
          "\n\tÖğrenci Eklendi."),
    );
    showDialog(context: context, builder: (BuildContext context) => alert);
  }

  void saveStudent() {
    print(selectedStudent.firstName);
    print(selectedStudent.lastName);
    print(selectedStudent.grade);
  }
}
