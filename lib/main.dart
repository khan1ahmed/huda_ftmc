import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:huda_ftmc/Setting.dart';
import 'package:huda_ftmc/firebase_options.dart';
import 'package:huda_ftmc/home.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:huda_ftmc/test.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(new MaterialApp(
    theme: ThemeData(),
    // home: new MyApp(),
    home: MyHomePage(),
    // home:Setting(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    new Future.delayed(
        const Duration(seconds: 3),
        () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Scaffold(
                        body: home(),
                      )),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Color(0xff20A090),
      body: Container(
        child: new Column(children: <Widget>[
          Divider(
            height: 240.0,
            color: Color(0xff20A090),
          ),
          new Image.asset(
            'assets/logo 1.png',
            fit: BoxFit.cover,
            repeat: ImageRepeat.noRepeat,
            width: 170.0,
          ),
          Divider(
            height: 105.2,
            color: Color(0xff20A090),
          ),
          SizedBox(
            height: 230,
          ),
          Text(
            "Hazara University",
            style: TextStyle(
                fontSize: 22, fontWeight: FontWeight.w500, color: Colors.white),
          ),
        ]),
      ),
    );
  }
}
