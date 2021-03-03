import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/Student.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeScreen());
  }
}

class HomeScreen extends StatelessWidget {
  List<Student> students = [
    Student.withId(1, "Engin", "Demiroğ", 100),
    Student.withId(2, "Nurettin", "Selim", 55),
    Student.withId(3, "Mustafa", "Uygur", 65)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Öğrenci Takip Sistemi"),
        ),
       body: buildBody(),
        );
  }
  Widget buildBody(){
     return Column(
           children:<Widget>[
             Expanded(
                            child: ListView.builder(
                 itemCount: students.length,
                 itemBuilder: (BuildContext context,int index){
                   return ListTile(
                     title:Text(students[index].firstName+" "+students[index].lastName),
                     subtitle: Text("Notu: "+students[index].grade.toString()),
                     leading: CircleAvatar(
                          backgroundImage: NetworkImage("https://st2.depositphotos.com/1594308/12210/i/950/depositphotos_122104490-stock-photo-smiing-female-college-student.jpg"),
                     ),
                     trailing: Icon(Icons.done),
                   );
                 }),
             )
           ],
          );
  }
}