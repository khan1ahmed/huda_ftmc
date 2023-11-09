import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  TextEditingController _Updatecontroller = TextEditingController();
  Updatehandler() {
    print('Update press');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff20A090),
        elevation: 0,
        title: Text('Setting'),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(color: Color(0xff20A090)),
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  Text(
                    'Air Conditioner Setting',
                    style: TextStyle(
                        fontFamily: GoogleFonts.inter().fontFamily,
                        fontWeight: FontWeight.w800,
                        color: Color.fromARGB(255, 253, 252, 252),
                        fontSize: 20),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'AC on temp',
                    style: TextStyle(
                        fontFamily: GoogleFonts.cabin().fontFamily,
                        fontWeight: FontWeight.w700,
                        color: Color.fromARGB(255, 248, 246, 246),
                        fontSize: 17),
                  ),
                  Text(
                    'AC off temp',
                    style: TextStyle(
                        fontFamily: GoogleFonts.cabin().fontFamily,
                        fontWeight: FontWeight.w700,
                        color: Color.fromARGB(255, 250, 249, 249),
                        fontSize: 17),
                  ),
                  SizedBox(
                    height: 40,
                    width: 30, //hufiza ka kam ha
                  )
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Divider(
                thickness: 2,
                color: const Color.fromARGB(255, 236, 234, 234),
              ),
              SizedBox(
                height: 40,
              ),
              Column(
                children: [
                  Text(
                    'Lights Setting',
                    style: TextStyle(
                        fontFamily: GoogleFonts.inter().fontFamily,
                        fontWeight: FontWeight.w800,
                        color: Color.fromARGB(255, 253, 251, 251),
                        fontSize: 20),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    'Lights On Time',
                    style: TextStyle(
                        fontFamily: GoogleFonts.inter().fontFamily,
                        fontWeight: FontWeight.w800,
                        color: Color.fromARGB(255, 250, 249, 249),
                        fontSize: 20),
                  ),
                  SizedBox(
                    width: 20,
                  ), //3 box hufiza ka ha
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Text(
                    'Lights Off Time',
                    style: TextStyle(
                        fontFamily: GoogleFonts.inter().fontFamily,
                        fontWeight: FontWeight.w800,
                        color: Color.fromARGB(255, 253, 253, 253),
                        fontSize: 20),
                  ),
                  SizedBox(
                    width: 20,
                  ), //3 box hufiza ka ha
                ],
              ),
              SizedBox(
                height: 50,
              ),
              ElevatedButton(
                onPressed: () {
                  Updatehandler();
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                child: Text(
                  'Update',
                  style: TextStyle(
                      fontSize: 23,
                      fontFamily: GoogleFonts.concertOne().fontFamily,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
