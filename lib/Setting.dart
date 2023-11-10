import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  TextEditingController _Updatecontroller = TextEditingController();
  TextEditingController timeinput = TextEditingController();
  TextEditingController lightoff = TextEditingController();

  Updatehandler() {
    print(timeinput.text);
    print(lightoff.text);
  }

  String dropdownvalue = 'Item 1';

  // List of items in our dropdown menu
  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
  String seconddropdown = 'Item 1';

  // List of items in our dropdown menu
  var number = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
  @override
  void initState() {
    timeinput.text = ""; //set the initial value of text field

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
                      child: Center(
                          child: TextField(
                        controller:
                            timeinput, //editing controller of this TextField
                        decoration: InputDecoration(
                            focusColor: Color(0xff20A090),
                            //icon of text field
                            labelText: "Enter Time" //label text of field
                            ),

                        readOnly:
                            true, //set it true, so that user will not able to edit text
                        onTap: () async {
                          TimeOfDay? pickedTime = await showTimePicker(
                            initialTime: TimeOfDay.now(),
                            context: context,
                          );

                          if (pickedTime != null) {
                            print(pickedTime.format(context)); //output 10:51 PM
                            DateTime parsedTime = DateFormat.jm()
                                .parse(pickedTime.format(context).toString());
                            //converting to DateTime so that we can further format on different pattern.
                            print(parsedTime); //output 1970-01-01 22:53:00.000
                            String formattedTime =
                                DateFormat('HH:mm:ss').format(parsedTime);
                            print(formattedTime); //output 14:59:00
                            //DateFormat() is from intl package, you can format the time on any pattern you need.

                            setState(() {
                              timeinput.text =
                                  formattedTime; //set the value of text field.
                            });
                          } else {
                            print("Time is not selected");
                          }
                        },
                      ))), //3 box hufiza ka ha
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
                  //3 box hufiza ka ha
                  SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                      width: 200,
                      child: Center(
                          child: TextField(
                        controller:
                            timeinput, //editing controller of this TextField
                        decoration: InputDecoration(
                            focusColor: Color(0xff20A090),
                            //icon of text field
                            labelText: "Enter Time" //label text of field
                            ),

                        readOnly:
                            true, //set it true, so that user will not able to edit text
                        onTap: () async {
                          TimeOfDay? pickedTime = await showTimePicker(
                            initialTime: TimeOfDay.now(),
                            context: context,
                          );

                          if (pickedTime != null) {
                            print(pickedTime.format(context)); //output 10:51 PM
                            DateTime parsedTime = DateFormat.jm()
                                .parse(pickedTime.format(context).toString());
                            //converting to DateTime so that we can further format on different pattern.
                            print(parsedTime); //output 1970-01-01 22:53:00.000
                            String formattedTime =
                                DateFormat('HH:mm:ss').format(parsedTime);
                            print(formattedTime); //output 14:59:00
                            //DateFormat() is from intl package, you can format the time on any pattern you need.

                            setState(() {
                              timeinput.text =
                                  formattedTime; //set the value of text field.
                            });
                          } else {
                            print("Time is not selected");
                          }
                        },
                      ))), //3 box hu
                ],
              ),
              SizedBox(
                height: 50,
              ),
              ElevatedButton(
                onPressed: Updatehandler,
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
