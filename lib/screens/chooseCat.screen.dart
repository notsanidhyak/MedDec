import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:health/screens/root_page.dart';
import 'package:health/screens/welcome_screen.dart';
import 'package:provider/provider.dart';

import '../provider/auth_provider.dart';
import '../utils/utils.dart';
import 'firstscreen.dart';

class ChooseCategory extends StatefulWidget {
  const ChooseCategory({super.key});

  @override
  State<ChooseCategory> createState() => _ChooseCategoryState();
}

class _ChooseCategoryState extends State<ChooseCategory> {
  @override
  Widget build(BuildContext context) {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    final height = h(context);
    return Scaffold(

      backgroundColor: const Color(0xff151413),
      body: SafeArea(
          child: Center(
            child: Column(
                children: [
                  SizedBox(height: height*0.2),
                  Text(
                    'Choose Your Category',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 25
                      ,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: height*.2),
                  const SizedBox(height: 30),
                  MyElevatedButton2(
                    onPressed: () {


                    },
                    child: Text(
                        'I am a Doctor',
                        style: GoogleFonts.lexendDeca(
                          color: Colors.white,
                        )
                    ),
                  ),
                  const SizedBox(height: 30),
                  MyElevatedButton2(
                    onPressed: () async {
                      if(ap.isSignedIn == true){
                        await ap.getDatafromSP().whenComplete(() => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const RootPage())));
                      }
                      else{
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const WelcomeScreen()));
                      }
                      // ap.isSignedIn == true ? Navigator.push(context, MaterialPageRoute(builder: (context)=> const HomeScreen())) :
                      // Navigator.push(context, MaterialPageRoute(builder: (context)=>const WelcomeScreen()));

                    },
                    child: Text(
                        'I am a Patient',
                        style: GoogleFonts.lexendDeca(
                          color: Colors.white,
                        )
                    ),
                  ),
                  const SizedBox(height: 30),
                  MyElevatedButton2(
                    onPressed: () {
                      // ap.isSignedIn == true ? Navigator.push(context, MaterialPageRoute(builder: (context)=> const HomeScreen())) :
                      // Navigator.push(context, MaterialPageRoute(builder: (context)=>const WelcomeScreen()));
                    },
                    child: Text(
                        'I am an Admin',
                        style: GoogleFonts.lexendDeca(
                          color: Colors.white,
                        )
                    ),
                  ),

                  // ElevatedButton(
                  //     onPressed: (){
                  //       ap.isSignedIn == true ? Navigator.push(context, MaterialPageRoute(builder: (context)=> const HomeScreen())) :
                  //       Navigator.push(context, MaterialPageRoute(builder: (context)=>const WelcomeScreen()));
                  //       //Navigator.push(context, MaterialPageRoute(builder: (context)=> const WelcomeScreen()));
                  //     },
                  //       child: Text(
                  //       'Get Started',
                  //       style: GoogleFonts.lexendDeca(
                  //       color: Colors.white,
                  //       )
                  //   ),
                  // )
                ]
            ),
          )
      ),
    );
  }
}
