
import 'package:flutter/material.dart';

import '../models/Doctor.dart';

class ViewProfile extends StatefulWidget {
  const ViewProfile({Key? key,required this.doctorId}) : super(key: key);
  final int doctorId;
  @override
  State<ViewProfile> createState() => _ViewProfileState();
}

class _ViewProfileState extends State<ViewProfile> {
  @override
  Widget build(BuildContext context) {
    final height=MediaQuery.of(context).size.height;
    final width=MediaQuery.of(context).size.width;
    List<Doctor> docList = Doctor.docList;
    return Scaffold(
      backgroundColor: Color(0xff151413),
      body: Stack(
        children: [
          Positioned(
            top: 50,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: const Color(0xff2A2C28),
                    ),
                    child: const Icon(
                      Icons.close,
                      color: Colors.white70,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    debugPrint('favorite');
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: const Color(0xff2A2C28).withOpacity(.15),
                    ),
                    //   child: IconButton(
                    //       onPressed: () {
                    //         setState(() {
                    //
                    //         });
                    //       },
                    //
                    // ),
                  ),
                )
              ],
            ),
          ),
          Positioned(
            top: 80,
            left: 0,
            // right: 0,
            child: Container(
              width: width ,
              height: height,
              padding: const EdgeInsets.all(10),
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    // right:10,
                    child: SizedBox(
                      height: height*.35,
                      width: width,
                      child: Image.asset(docList[widget.doctorId-1].imageURL,fit:BoxFit.contain,),

                    ),
                  ),

                ],
              ),
            ),
          ),


          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.only(top: 80, left: 30, right: 30),
              height: height * .5,
              width: width,
              decoration: BoxDecoration(
                color: const Color(0xff2A2C28),
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            docList[widget.doctorId-1].name,
                            //"name",
                            style: const TextStyle(
                              color: Colors.white70,
                              fontWeight: FontWeight.bold,
                              fontSize: 30.0,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                      // Row(
                      //   children: [

                      //   ],
                      // ),
                    ],
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

