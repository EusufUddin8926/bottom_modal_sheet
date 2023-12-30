import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker_bottom_modal/model/Course.dart';
import 'AddNewCourse.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isDismiss = false;
  List<Course> CourseList = [];

  addCourseImage() {
    return showModalBottomSheet(
        context: context,
        builder: (context) => AddNewCourse(),
        backgroundColor: Colors.white,
        isDismissible: isDismiss,
        enableDrag: false).then((value) => {
          if(value!=null){
            setState((){
              CourseList.addAll(value);
            })
          }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        backgroundColor: Colors.green,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        elevation: 20,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        child: Icon(Icons.add, color: Colors.white),
        onPressed: () {
          addCourseImage();
        },
      ),
      body: CourseList.isNotEmpty ? ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.black, width: 1),
                image: DecorationImage(image: FileImage(File(CourseList[index].courseImg)), fit: BoxFit.cover)
              ),
              margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(CourseList[index].courseName, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(CourseList[index].courseCode.toString(), style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20)),
                  ),
                ],
              ),

            );
          },
          separatorBuilder: (context, index) => SizedBox(height: 4.0),
          itemCount: CourseList.length): Center(
        child: Text("No course available now", style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w300),),
      ),
    );
  }
}
