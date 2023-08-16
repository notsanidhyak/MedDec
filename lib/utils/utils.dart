import 'package:flutter/material.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';



void showSnackBar(BuildContext context, String content) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(content)));
}

double w(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double h(BuildContext context) {
  return MediaQuery.of(context).size.height;
}


Future<File?> pickImage(BuildContext context) async {
  File? image;
  try{
    final pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    if(pickedImage!=null){
      image = File(pickedImage.path);
    }
  } catch (e){
    showSnackBar(context, e.toString());
  }

  return image;
}


