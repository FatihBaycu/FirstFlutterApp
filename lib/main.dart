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
  //_HomeScreenState createState() =>_HomeScreenState(); //bir diğer kullanım şekli.
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> { 
    List<Student> students = [
    Student.withId(1, "İsim A", "Soyisim B", 100),
    Student.withId(2, "İsim C", "Soyisim F", 50),
    Student.withId(3, "İsim D", "Soyisim G", 95),
    Student.withId(4, "İsim E", "Soyisim H", 75)
  ];

  
Student selectedStudent= Student.withId(0, "Hiç Kimse", "", 0);
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
                  //title: Text("Boş"),
                   title: Text(students[index].firstName +" " +students[index].lastName),
                  subtitle: Text("Notu: " +students[index].grade.toString() +"\n[" + students[index].getStatus +"]"),
                  leading: CircleAvatar(backgroundImage: NetworkImage("https://st2.depositphotos.com/1594308/12210/i/950/depositphotos_122104490-stock-photo-smiing-female-college-student.jpg"),),
                  trailing: buildStatusIcon(students[index].grade),
                  onTap: () {
                    setState(() {
                      this.selectedStudent = students[index];
                    });
                  },
                  onLongPress: () {setState(() {this.selectedStudent = students[index];});print("Uzun basıldı.");},
                );
              }),
        ),
        Text("Seçili Öğrenci :" + this.selectedStudent.firstName),
        Row(
          children: <Widget>[
            buildFlexible1(),
            buildFlexible2(),
            buildFlexible3()
          ],
        )
      ],
    );
  }

  Flexible buildFlexible1() {
    return Flexible(
            fit: FlexFit.tight,
            flex: 2,
            // child:ElevatedButton(child: null,)
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.greenAccent,
                  onPrimary: Colors.black // background
                  ),
              onPressed: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => StudentAdd(students)));
                        Navigator.push(context,MaterialPageRoute(builder: (context) => StudentAdd(students)),).then((value) => setState(() {}));},
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
          );
  }

  Flexible buildFlexible2() {
    return Flexible(
      fit: FlexFit.tight,
      flex: 2,
      // child:ElevatedButton(child: null,)
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.orangeAccent, // background
          onPrimary: Colors.black, // foreground
        ),
        onPressed: () {Navigator.push(context,MaterialPageRoute(builder: (context) => StudentUpdate(students)));},
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

Flexible buildFlexible3 () {
  int index2= selectedStudent.id;
  return Flexible(
    fit: FlexFit.tight,
    flex: 1,
    // child:ElevatedButton(child: null,)
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.red, // background
        onPrimary: Colors.white, // foreground
      ),
      onPressed: () {/*students.remove(index2);*/students.removeWhere((item) => item.id == index2);},
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
