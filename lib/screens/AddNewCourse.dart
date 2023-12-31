import 'dart:io';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../model/Course.dart';

//
// class AddNewCourse extends StatefulWidget {
//   AddNewCourse({super.key});
//
//   @override
//   State<AddNewCourse> createState() => _AddNewCourseState();
// }
//
// class _AddNewCourseState extends State<AddNewCourse> {
//   XFile? imgFile;
//   TextEditingController courseNameController = new TextEditingController();
//   TextEditingController courseCodeController = new TextEditingController();
//   List<Course> CourseList = [];
//
//   chooseImageFromCamera() async {
//     ImagePicker _picker = ImagePicker();
//     imgFile = await _picker.pickImage(source: ImageSource.camera);
//     setState(() {});
//   }
//
//   saveNewCourse() {
//     print( imgFile!.path.toString());
//     CourseList.add(Course(courseName: courseNameController.text, courseCode: int.parse( courseCodeController.text), courseImg: imgFile!.path));
//     Navigator.pop(context, CourseList);
//
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 600,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           const Expanded(
//               flex: 1,
//               child: Center(
//                   child: Text(
//                 "Add New Course",
//                 style: TextStyle(
//                     color: Colors.black,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 24),
//               ))),
//           Expanded(
//               flex: 3,
//               child: Column(
//                 children: [
//                   Padding(
//                     padding:
//                         const EdgeInsets.only(left: 16, right: 16, top: 10),
//                     child: TextField(
//                       controller: courseNameController,
//                       keyboardType: TextInputType.text,
//                       decoration: InputDecoration(
//                         isDense: true,
//                         prefixIcon: Icon(Icons.ac_unit),
//                         border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(16),
//                             borderSide: BorderSide(color: Colors.black)),
//                         hintText: "Enter Course Name",
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.only(left: 16, right: 16, top: 16),
//                     child: TextField(
//                       controller: courseCodeController,
//                       keyboardType: TextInputType.number,
//                       decoration: InputDecoration(
//                         isDense: true,
//                         prefixIcon: Icon(Icons.ac_unit),
//                         border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(16),
//                             borderSide: BorderSide(color: Colors.black)),
//                         hintText: "Enter Course Code",
//                       ),
//                     ),
//                   ),
//                 ],
//               )),
//           Expanded(
//               flex: 5,
//               child: imgFile == null
//                   ? Center(
//                       child: IconButton(
//                         icon: Icon(Icons.camera),
//                         onPressed: () {
//                           chooseImageFromCamera();
//                         },
//                       ),
//                     )
//                   : Container(
//                       margin: EdgeInsets.fromLTRB(20, 0, 20, 10),
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(36),
//                           image: DecorationImage(
//                             image: FileImage(File(imgFile!.path)),
//                             fit: BoxFit.cover,
//                           )),
//                     )),
//           Expanded(
//               flex: 1,
//               child: Container(
//                 height: double.infinity,
//                 width: double.infinity,
//                 margin: EdgeInsets.only(left: 16, right: 16, bottom: 4),
//                 child: OutlinedButton(
//                   style: ElevatedButton.styleFrom(
//                     primary: Colors.green,
//                     side: BorderSide(color: Colors.grey, width: 2),
//                   ),
//                   child: Text("Save Info",
//                       style: TextStyle(
//                           color: Colors.white, fontWeight: FontWeight.normal)),
//                   onPressed: () {
//                     setState(() {
//                       var isCourseName = courseNameController.text.isEmpty;
//                       var isCoursecode = courseCodeController.text.isEmpty;
//                       if (isCourseName) {
//                         Fluttertoast.showToast(msg: "Course Name is Empty", toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.CENTER, backgroundColor: Colors.red, textColor: Colors.white,
//                             fontSize: 16.0);
//
//                         return;
//                       }else if(isCoursecode){
//                         Fluttertoast.showToast(msg: "Course Code is Empty", toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.CENTER, backgroundColor: Colors.red, textColor: Colors.white,
//                             fontSize: 16.0);
//
//                         return;
//                       }else if(imgFile==null){
//                         Fluttertoast.showToast(msg: "File Path is Empty", toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.CENTER, backgroundColor: Colors.red, textColor: Colors.white,
//                             fontSize: 16.0);
//                       }else{
//                        saveNewCourse();
//                       }
//
//                     });
//
//                   },
//                 ),
//               )),
//         ],
//       ),
//     );
//   }
// }

class AddNewCourse extends StatefulWidget {
  const AddNewCourse({super.key});

  @override
  State<AddNewCourse> createState() => _AddNewCourseState();
}

class _AddNewCourseState extends State<AddNewCourse> {
  TextEditingController courseNameController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 16),
      height: MediaQuery.sizeOf(context).height * 0.6,
      width: MediaQuery.sizeOf(context).width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Add New Course",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24),
          ),
          TextField(
            controller: courseNameController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              isDense: true,
              prefixIcon: Icon(Icons.ac_unit),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: Colors.black)),
              hintText: "Enter Course Name",
            ),
          ),
          TextField(
            controller: courseNameController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              isDense: true,
              prefixIcon: Icon(Icons.ac_unit),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: Colors.black)),
              hintText: "Enter Course Name",
            ),
          ),
          Image(
            height: MediaQuery.sizeOf(context).height * 0.2,
              width: MediaQuery.sizeOf(context).width ,
              fit: BoxFit.fill,
              image: NetworkImage("https://picsum.photos/250?image=9")),
          OutlinedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              side: BorderSide(color: Colors.grey, width: 2),
            ),
            child: Text("Save Info",
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.normal)),
          ),
        ],
      ),
    );
  }
}
