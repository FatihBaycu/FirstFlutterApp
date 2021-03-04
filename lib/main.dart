//import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/Student.dart';
import 'package:flutter_application_2/models/StudentAdd.dart';
import 'package:flutter_application_2/models/StudentUpdate.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeScreen());
  }
}

class HomeScreen extends StatefulWidget {
  @override
  //_HomeScreenState createState() =>_HomeScreenState();

  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  List<Student> students = [
    Student.withId(1, "Tufan", "Karaçam", 100),
    Student.withId(2, "Gökay", "Deligöz", 55),
    Student.withId(3, "Osman Efe", "Tüfekçi", 45)
  ];

  Student selectedStudent = Student.withId(0, "Hiç Kimse", "", 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Öğrenci Takip Sistemi"),
      ),
      //setState(() {});
    
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return Column(
      children: <Widget>[
        Expanded(
          child: ListView.builder(
              itemCount: students.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(students[index].firstName +
                      " " +
                      students[index].lastName),
                  subtitle: Text("Notu: " +
                      students[index].grade.toString() +
                      "\n[" +
                      students[index].getStatus +
                      "]"),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://st2.depositphotos.com/1594308/12210/i/950/depositphotos_122104490-stock-photo-smiing-female-college-student.jpg"),
                  ),
                  trailing: buildStatusIcon(students[index].grade),
                  onTap: () {
                    setState(() {
                      this.selectedStudent = students[index];
                    });
                    //print(students[index].firstName);
                  },
                  onLongPress: () {
                    setState(() {
                      this.selectedStudent = students[index];
                    });
                    print("Uzun basıldı.");
                  },
                );
              }),
        ),
        Text("Seçili Öğrenci :" + this.selectedStudent.firstName),
        Row(
          children: <Widget>[
            Flexible(
              fit: FlexFit.tight,
              flex: 2,
              // child:ElevatedButton(child: null,)
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.greenAccent,
                    onPrimary: Colors.black // background
                    ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => StudentAdd(students)));
                },
                child: Row(
                  children: <Widget>[
                    Icon(Icons.add),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text("Yeni Öğrenci"),
                  ],
                ),
              ),
            ),
            buildFlexible(),
            buildFlexible2()
          ],
        )
      ],
    );
  }

  Flexible buildFlexible() {
    return Flexible(
      fit: FlexFit.tight,
      flex: 2,
      // child:ElevatedButton(child: null,)
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.orangeAccent, // background
          onPrimary: Colors.black, // foreground
        ),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => StudentUpdate(students)));
        },
        child: Row(
          children: <Widget>[
            Icon(Icons.update),
            SizedBox(
              width: 5.0,
            ),
            Text("Güncelle"),
          ],
        ),
      ),
    );
  }

  Widget buildStatusIcon(int grade) {
    if (grade >= 50) {
      return Icon(Icons.done);
    } else if (grade >= 40) {
      return Icon(Icons.album);
    } else
      return Icon(Icons.clear);
  }
}

Flexible buildFlexible2() {
  return Flexible(
    fit: FlexFit.tight,
    flex: 1,
    // child:ElevatedButton(child: null,)
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.red, // background
        onPrimary: Colors.white, // foreground
      ),
      onPressed: () {
        //int selectedIndex;
        //selectedIndex=students[index];
      },
      child: Row(
        children: <Widget>[
          Icon(Icons.delete),
          SizedBox(
            width: 5.0,
          ),
          Text("Sil"),
        ],
      ),
    ),
  );
}

//SCAFFOLUN ALTINA
// body: Center(
//   child:ElevatedButton(
//     child: Text("Sayfa 2'ye git."),
//     onPressed: ()=>Navigator.push(context,
//      MaterialPageRoute(builder: (context)=>Sayfa2()),
//   ),),
// )

// class Sayfa2 extends StatelessWidget {
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Sayfa 2")),
//       body: Center(
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: <Widget>[
//             ElevatedButton(
//               child: Text("Geri dön!", style: TextStyle(fontSize: 20)),
//               onPressed: () => Navigator.pop(context),
//             ),
//             ElevatedButton(
//               child: Text("Sayfa 3'e Git!", style: TextStyle(fontSize: 20)),
//               onPressed: () => Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => Sayfa3()),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class Sayfa3 extends StatelessWidget {
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Sayfa 3")),
//       body: Center(
//         child: ElevatedButton(
//           child: Text("Geri dön!", style: TextStyle(fontSize: 20)),
//           onPressed: () => Navigator.pop(context),
//         ),
//       ),
//     );
//   }
// }
