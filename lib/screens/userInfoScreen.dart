import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:health/provider/auth_provider.dart';
import 'package:health/screens/dashboard.dart';
import 'package:health/screens/homescreen.dart';
import 'package:health/screens/root_page.dart';
import 'package:health/screens/welcome_screen.dart';
import 'package:provider/provider.dart';

import '../utils/utils.dart';


class UserInfoScreen extends StatefulWidget {
  const UserInfoScreen({super.key});

  @override
  State<UserInfoScreen> createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {

  File? file;
  final nameController = TextEditingController();
  final primaryWalletController = TextEditingController();

  @override
  void dispose(){
    nameController.dispose();
    primaryWalletController.dispose();
    super.dispose();
  }

  void selectImage() async {
    file = await pickImage(context);
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    final height = h(context);
    final width = w(context);
    final isLoading = Provider.of<AuthProvider>(context, listen: true).isLoading;
    return Scaffold(
      backgroundColor: Color(0xff151413),
      body: SafeArea(
        child: isLoading == true ? const Center(child: CircularProgressIndicator(color: Color(0xff6FBDB4),),)
            : Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                InkWell(
                  onTap: () => selectImage(),
                  child: file == null ? const CircleAvatar(
                    child: Icon(Icons.person_rounded, size: 50,),
                    backgroundColor: Color(0xff6FBDB4),
                    radius: 50,
                  ):CircleAvatar(
                    backgroundImage: FileImage(file!),
                    radius: 50,
                  )
                ),
                file == null ? Container(
                  padding: EdgeInsets.all(30),
                  child: Text(
                      'Select Profile Picture',
                      style: GoogleFonts.lexendDeca(
                        color: Colors.white,
                        fontSize: 11,
                      )
                  ),
                ):
                SizedBox(height: 50),
                SizedBox(
                  height: width*0.83,
                  width: width*0.8,
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Color(0xff2A2C28),

                      borderRadius: BorderRadius.all(
                        Radius.circular(25.0),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Enter Bio',
                          textAlign: TextAlign.left,
                          style: GoogleFonts.poppins(
                            color: Color(0xffD9D9D9),
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                        SizedBox(height: 50),
                        TextFormField(
                          cursorColor: Color(0xff6FBDB4),
                          controller: nameController,
                          style: GoogleFonts.lexendDeca(
                              color: Color(0xffD9D9D9)
                          ),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color(0xff151413),
                            hintText: "Enter name",
                            hintStyle: GoogleFonts.lexendDeca(
                              color: Color(0xFF444342),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color:  Color(0xFF444342)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: Colors.white),
                            ),
                            prefixIcon: Container(
                              child: Icon(Icons.person_pin_circle)
                            ),
                            prefixIconColor: MaterialStateColor.resolveWith((states) =>
                            states.contains(MaterialState.focused)
                                ? Color(0xff6FBDB4)
                                : Colors.grey),

                          ),
                        ),
                        SizedBox(height:20),
                        TextFormField(
                          cursorColor: Colors.blue,
                          controller: primaryWalletController,
                          style: GoogleFonts.lexendDeca(
                            color: Color(0xffD9D9D9),
                          ),

                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color(0xff151413),
                            hintText: "Enter wallet address",
                            hintStyle: GoogleFonts.lexendDeca(
                              color: Color(0xFF444342),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color:  Color(0xFF444342)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: Colors.white),
                            ),
                            prefixIcon: Container(
                                child: Icon(Icons.wallet_rounded)
                            ),
                              prefixIconColor: MaterialStateColor.resolveWith((states) =>
                              states.contains(MaterialState.focused)
                                  ? Color(0xff6FBDB4)
                                  : Colors.grey),

                          ),
                        ),
                        SizedBox(height: 25),
                        MyElevatedButton(onPressed: (){
                          storeData();
                        },
                            child: Text(
                              'Submit',
                              style: GoogleFonts.lexendDeca(
                                color: Colors.white,
                              ),
                            )
                        ),

                      ],
                    ),
                  ),
                )
              ],

            ),
          ),
        ),
      ),
    );
  }

  void storeData() async {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    UserModel usm = UserModel(name: nameController.text.toString(), walletAddress: primaryWalletController.text.toString(), phoneNo: "", profilePic: "", uid: "");
    if(file!=null){
      ap.saveUserDatatoFirebase(
        context: context,
        userModel: usm,
        profilePic: file!,
        onSuccess: (){
          ap.saveUserDatatoSP().then((value) => ap.setSignIn().then((value) => Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => RootPage()), (route) => false)));
        },
      );
    }
    else{
      showSnackBar(context, 'Please Upload Profile Photo');
    }
  }
}

class UserModel {
  String name, walletAddress, phoneNo, profilePic, uid;

  UserModel({
    required this.name,
    required this.walletAddress,
    required this.phoneNo,
    required this.profilePic,
    required this.uid,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'] as String ?? " ",
      walletAddress: json['walletAddress'] as String ?? " ",
      phoneNo: json['phoneNo'] as String ?? " ",
      profilePic: json['profilePic'] as String ?? " ",
      uid: json['uid'] as String ?? " ",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'walletAddress': walletAddress,
      'phoneNo': phoneNo,
      'profilePic': profilePic,
      'uid': uid,
    };
  }
}

