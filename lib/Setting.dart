import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:huda_ftmc/AcTemp.dart';
import 'package:intl/intl.dart';
import 'package:firebase_database/firebase_database.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  final DatabaseReference databaseReference =
      FirebaseDatabase.instance.ref("Esp/lights");

  TimeOfDay? selectedTime;
  String onTime = 'Not set';
  String offTime = 'Not set';

  void _selectTime(BuildContext context, String status) async {
    selectedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (selectedTime != null) {
      String formattedHour = selectedTime!.hour.toString().padLeft(2, '0');
      String formattedMinute = selectedTime!.minute.toString().padLeft(2, '0');
      String formattedTime = '$formattedHour:$formattedMinute';

      databaseReference.child(status).set({'time': formattedTime});
      _updateTimes();
    }
  }

  void _updateTimes() async {
    DatabaseEvent dataSnapshot = await databaseReference.once();
    Map times = dataSnapshot.snapshot.value as Map;

    setState(() {
      onTime = times['on'] != null ? times['on']['time'] : 'Not set';
      offTime = times['off'] != null ? times['off']['time'] : 'Not set';
    });
  }

  TextEditingController timeOff = TextEditingController();
  TextEditingController timeOn = TextEditingController();
  TextEditingController lightoff = TextEditingController();

  String dropdownvalue = 'Item 1';

  // List of items in our dropdown menu
  var items = [
    '1',
    '2',
    '3',
    '4',
    '5',
  ];
  String seconddropdown = 'Item 2';

  @override
  void initState() {
    // timeinput.text = "";
    //set the initial value of text field

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff20A090),
        elevation: 0,
        title: const Text('Setting'),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(color: Color(0xff20A090)),
        child:  Column(
          children: [            
            const Text(
              'Air Conditioner Setting',
              style: TextStyle(
                //  fontFamily: GoogleFonts.inter().fontFamily,
                  fontWeight: FontWeight.w800,
                  color: Color.fromARGB(255, 253, 252, 252),
                  fontSize: 20),
            ),
            const SizedBox(
              height: 30,
            ),
            const TemperatureAdjuster(),
            const Divider(
              thickness: 2,
              color: Color.fromARGB(255, 236, 234, 234),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'Lights Setting',
              style: TextStyle(
                 // fontFamily: GoogleFonts.inter().fontFamily,
                  fontWeight: FontWeight.w800,
                  color: Color.fromARGB(255, 253, 251, 251),
                  fontSize: 20),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Lights On Time',
                  style: TextStyle(
                    //  fontFamily: GoogleFonts.inter().fontFamily,
                      fontWeight: FontWeight.w800,
                      color: Color.fromARGB(255, 250, 249, 249),
                      fontSize: 20),
                ),
               
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: ElevatedButton(
                    onPressed: () => _selectTime(context, "on"),
                    child: Text(onTime),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Lights Off Time',
                  style: TextStyle(
                      fontFamily: GoogleFonts.inter().fontFamily,
                      fontWeight: FontWeight.w800,
                      color: const Color.fromARGB(255, 253, 253, 253),
                      fontSize: 20),
                ),
                SizedBox(
                 width: MediaQuery.of(context).size.width * 0.3,
                  child: ElevatedButton(
                    onPressed: () => _selectTime(context, "off"),
                    child: Text(offTime),
                  ),
                ), //3 box hu
              ],
            ),
           ],
        ),
      ),
    );
  }
}
