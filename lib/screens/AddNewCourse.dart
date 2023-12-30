import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddNewCourse extends StatefulWidget {
  const AddNewCourse({super.key});

  @override
  State<AddNewCourse> createState() => _AddNewCourseState();
}

class _AddNewCourseState extends State<AddNewCourse> {
  XFile? imgFile;

  chooseImageFromCamera() async {
    ImagePicker _picker = ImagePicker();
    imgFile = await _picker.pickImage(source: ImageSource.camera);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 10,
          ),
          Center(
              child: const Text(
            "Add New Course",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24),
          )),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 10),
            child: TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.ac_unit),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: Colors.black)),
                hintText: "Enter Course Name",
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16, top: 16),
            child: TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.ac_unit),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: Colors.black)),
                hintText: "Enter Course Code",
              ),
            ),
          ),
          Expanded(
              child: imgFile == null
                  ? Center(
                    child: IconButton(
                        icon: Icon(Icons.camera),
                        onPressed: () {
                          chooseImageFromCamera();
                        },
                      ),
                  )
                  : Container(
                      margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(36), image: DecorationImage(image: FileImage(File(imgFile!.path)),
                        fit: BoxFit.cover,)),
                     ))
        ],
      ),
    );
  }
}
