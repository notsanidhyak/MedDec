import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:health/provider/auth_provider.dart';
import 'package:provider/provider.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}



class _DashBoardState extends State<DashBoard> {


  @override
  Widget build(BuildContext context) {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Stack(
          children: [
            Positioned(
                bottom: height * .4,
                child: Container(
                  width: width,
                  height: height,
                  color: const Color(0xff2A2C28),
                )),
            Positioned(
              //top:0,
                bottom: height * .29,
                left: width * 0.49,
                width: width * 0.5 * 0.9,
                height: height * .8 * .9,
                child:
                const Image(image: AssetImage('assets/img.png'))),
            Positioned(
              top: height * 0.05,
              left: width * .04,
              child: GestureDetector(
                  onTap: () {
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => ProfilePage()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: CircleAvatar(
                      backgroundColor: const Color(0xff151413),
                      radius: 25,
                      backgroundImage: NetworkImage(ap.userModel.profilePic),
                    ),
                  )),
            ),
            Positioned(
              top: height * 0.05,
              right: width * .04,
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: CircleAvatar(
                  radius: 25,
                  child: Icon(
                    Icons.notifications_outlined,
                    color: Colors.white38,
                    size: 30.0,
                  ),
                ),
              ),
            ),
            Positioned(
                top: height * .41,
                child: Container(
                  width: width,
                  height: height,
                  decoration: const BoxDecoration(
                    color: Color(0xff151413),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(60.0),
                      topLeft: Radius.circular(60.0),
                    ),
                  ),
                )),
            Positioned(
                top: height * .15,
                left: width * .075,
                child: Container(
                  width: 200,
                  height: 200,
                  color: Colors.transparent,
                  child: Column(
                    children: [
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Welcome!',
                              style: GoogleFonts.poppins(
                                  color: Colors.white70,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold))),
                      const SizedBox(
                        height: 5,
                      ),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text(ap.userModel.name.substring(0,ap.userModel.name.indexOf(' ')),
                              style: GoogleFonts.poppins(
                                  color: Colors.white70,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold))),
                      const SizedBox(
                        height: 20,
                      ),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text('How can we help you?',
                              style: GoogleFonts.poppins(
                                color: Colors.white38,
                                fontSize: 16,
                              )))
                    ],
                  ),
                )),
            Positioned(
                top: height * 0.32,
                left: width * 0.075,
                child: SizedBox(
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith((states) =>
                      states.contains(MaterialState.pressed)
                          ? Colors.black87
                          : const Color(0xffE2585D)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14))),
                    ),
                    child: Text('Call Ambulance',
                        style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w500)),
                  ),
                )),
            Positioned(
                top: height * .45,
                left: width * .089,
                child: Row(
                  children: [
                    Text('My Appointments',
                        style: GoogleFonts.poppins(color: Colors.white70, fontSize: 22,))
                  ],
                )),
            // Positioned(
            //     top: height * .51,
            //     left: width * .025,
            //     width: width * .95,
            //     height: height * .4,
            //     // child: AppointmentCard(
            //     //     "Appointment at 9 pm", "\nDr. Riya \n Ajayan Hospital "),
            //     child: ListView.builder(
            //         padding: const EdgeInsets.all(8),
            //         itemCount: Appointment.appList.length, //change dynamically later
            //         itemBuilder: (BuildContext context, int index) {
            //           return AppointmentList(
            //             index: index,
            //             appList: Appointment.appList,
            //           );
            //         })),
          ],
        ));
  }
}
