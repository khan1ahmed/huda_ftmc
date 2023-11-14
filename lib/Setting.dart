import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
  String seconddropdown = 'Item 1';


 
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
        backgroundColor: Color(0xff20A090),
        elevation: 0,
        title: Text('Setting'),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(color: Color(0xff20A090)),
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
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
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'AC on temp',
                        style: TextStyle(
                            fontFamily: GoogleFonts.cabin().fontFamily,
                            fontWeight: FontWeight.w700,
                            color: Color.fromARGB(255, 248, 246, 246),
                            fontSize: 17),
                      ),
                      SizedBox(
                        width: 130,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 50),
                        child: Text(
                          'AC off temp',
                          style: TextStyle(
                              fontFamily: GoogleFonts.cabin().fontFamily,
                              fontWeight: FontWeight.w700,
                              color: Color.fromARGB(255, 250, 249, 249),
                              fontSize: 17),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        color: Color(0xff20A090),
                        child: DropdownButton(
                          dropdownColor: Color(0xff20A090),
                          // Initial Value
                          value: dropdownvalue,

                          // Down Arrow Icon
                          icon: const Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.white,
                          ),

                          // Array list of items
                          items: items.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(
                                items,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            );
                          }).toList(),
                          // After selecting the desired option,it will
                          // change button value to selected value
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownvalue = newValue!;
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        width: 140,
                      ),
                      Container(
                        color: Color(0xff20A090),
                        child: DropdownButton(
                          dropdownColor: Color(0xff20A090),
                          // Initial Value
                          value: seconddropdown,

                          // Down Arrow Icon
                          icon: const Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.white,
                          ),

                          // Array list of items
                          items: items.map((String number) {
                            return DropdownMenuItem(
                              value: number,
                              child: Text(
                                number,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            );
                          }).toList(),
                          // After selecting the desired option,it will
                          // change button value to selected value
                          onChanged: (String? number) {
                            setState(() {
                              seconddropdown = number!;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
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
                    width: 10,
                  ),
                  SizedBox(
                      width: 200,
                      child:   ElevatedButton(
              onPressed: () => _selectTime(context, "on"),
              child: Text('$onTime'),
            ),),
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
                    width: 10,
                  ),
                  SizedBox(
                      width: 200,
                      child: 
                      
                       ElevatedButton(
              onPressed: () => _selectTime(context, "off"),
              child: Text('$offTime'),
            ),), //3 box hu
                ],
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
