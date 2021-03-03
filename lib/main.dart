import 'package:flutter/material.dart';

void main ()=>runApp(MyApp());

 class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return  MaterialApp(
      home:HomeScreen()
    );
         } 
     }
class MyWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

 return Text('Hello World',style: Theme.of(context).textTheme.headline6,);
   }

}

class HomeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Öğrenci Takip Sistemi"),),
      body:Center(
        child:Text("Hello World!")
    ));
        }
     }