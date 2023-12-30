import 'package:flutter/material.dart';

import 'AddNewCourse.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  addCourseImage(){
    return showModalBottomSheet(context: context, builder: (context)=> AddNewCourse());
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Page"),backgroundColor: Colors.blue,),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        elevation: 20,
        shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        child: Icon(Icons.add, color: Colors.white),
        onPressed: (){
          addCourseImage();
        },
      ),
    );
  }
}
