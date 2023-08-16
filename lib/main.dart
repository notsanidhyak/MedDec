import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:health/provider/auth_provider.dart';
import 'package:health/screens/firstscreen.dart';

import 'firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: MaterialApp(
        theme: ThemeData(
            fontFamily: "Lexend_Deca",
            primarySwatch: Colors.blue,
            brightness: Brightness.dark,
          // scaffoldBackgroundColor: const Color(0xff151413),
        ),
        debugShowCheckedModeBanner: false,
        home: const FirstScreen(),
      ),
    );
  }
}
