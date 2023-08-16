import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:health/screens/chooseCat.screen.dart';
import 'package:health/utils/utils.dart';



class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {

    final height = h(context);
    return Scaffold(
      backgroundColor: const Color(0xff151413),
      body: SafeArea(
          child: Center(
            child: Column(
                children: [
                  SizedBox(height: height*0.2),
                  SizedBox(
                    height: height*0.22,
                    width: height*0.22,
                    child: const Image(
                        image: AssetImage('assets/images/logo.png')
                    ),
                  ),
                  Text(
                      'MedDec',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 30
                        ,
                        fontWeight: FontWeight.w500,
                      ),
                  ),
                  SizedBox(height: height*.2),
                  Text(
                      'Your Health Data, On Chain, In Control.',
                      style: GoogleFonts.lexendDeca(
                        color: Colors.white,
                        fontSize: 11,
                      )
                  ),
                  const SizedBox(height: 30),
                  MyElevatedButton2(
                    onPressed: () {
                      // ap.isSignedIn == true ? Navigator.push(context, MaterialPageRoute(builder: (context)=> const HomeScreen())) :
                      // Navigator.push(context, MaterialPageRoute(builder: (context)=>const WelcomeScreen()));
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const ChooseCategory()));
                    },
                    child: Text(
                        'Get Started',
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

class MyElevatedButton2 extends StatelessWidget {
  final BorderRadiusGeometry? borderRadius;
  final double? width;
  final double height;
  //final Gradient gradient;
  final VoidCallback? onPressed;
  final Widget child;

  const MyElevatedButton2({
    Key? key,
    required this.onPressed,
    required this.child,
    this.borderRadius,
    this.width,
    this.height = 44.0,
    //this.gradient = const LinearGradient(colors: [Colors.cyan, Colors.indigo]),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final borderRadius = this.borderRadius ?? BorderRadius.circular(10);
    return Container(
      width: 180,
      height: height,
      decoration: BoxDecoration(
        //gradient: gradient,
        borderRadius: borderRadius,
        color: const Color(0xff6FBDB4),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(borderRadius: borderRadius),
        ),
        child: child,
      ),
    );
  }
}
