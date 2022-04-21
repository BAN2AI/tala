import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:tala/homepage.dart';
import 'package:tala/login.dart';
import 'package:tala/utilities/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Tambako, One Zambia One Tambako',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.black,
          fontFamily: 'Ubuntu',
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Container(
          decoration: BoxDecoration(
            color: Colors.black,
            image: DecorationImage(
                image: AssetImage('assets/images/bgsp.jpg'), fit: BoxFit.cover),
          ),
          child: SplashScreen(
              seconds: 3,
              navigateAfterSeconds: MyHomePage(),
              title: new Text(
                '',
                style:
                    new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
              image: new Image.asset("assets/images/bgsp.jpg"),
              backgroundColor: Colors.black,
              styleTextUnderTheLoader: new TextStyle(),
              photoSize: 100.0,
              // onClick: () => print("Flutter Egypt"),
              loaderColor: Colors.green),
        ));
  }
}
