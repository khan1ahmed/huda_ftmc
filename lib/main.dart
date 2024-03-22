import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

// import 'package:huda_ftmc/firebase_options.dart';
import 'package:huda_ftmc/home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    // options: DefaultFirebaseOptions.currentPlatform,
  );
void main ()
{  runApp( const MaterialApp());}
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(     
      home: home(),
    );
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff20A090),
      // ignore: avoid_unnecessary_containers
      body: Container(
        child: Column(children: <Widget>[
          const Divider(
            height: 10.0,
            color: Color(0xff20A090),
          ),
          Image.asset(
            'assets/logo 1.png',
            fit: BoxFit.cover,
            repeat: ImageRepeat.noRepeat,
            width: 170.0,
          ),
          const Divider(
            height: 10.2,
            color: Color(0xff20A090),
          ),
          const SizedBox(
            height: 200,
          ),
          const Text(
            "Hazara University",
            style: TextStyle(
                fontSize: 22, fontWeight: FontWeight.w500, color: Colors.white),
          ),
        ]),
      ),
    );
  }

