import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:huda_ftmc/Setting.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  Map Data = {
    "light": false,
    "color": false,
    "temp": 21.3,
    "ac": true,
    "time": "12:12 Am",
    "humid": 44
  };

  // @override
  // void initState() {
  //   getData();
  // }

  // getData() async {
  //   final ref = FirebaseDatabase.instance.ref();
  //   final snapshot = await ref.child('Esp').get();
  //   if (snapshot.exists) {
  //     print(snapshot.value);
  //     setState(() {
  //       Data = snapshot.value as Map;
  //     });
  //   } else {
  //     print('No data available.');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Color(0xff20A090)),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 130),
                      child: Text(
                        'Home',
                        style: TextStyle(
                            fontFamily: GoogleFonts.inter().fontFamily,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                            fontSize: 30),
                      ),
                    ),
                    SizedBox(
                      width: 60,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Setting(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                            elevation: 0, backgroundColor: Color(0xff20A090)),
                        child: Icon(
                          Icons.settings,
                          size: 40,
                          color: Color.fromARGB(255, 252, 250, 250),
                        ))
                    // IconButton(
                    //   onPressed: () {
                    //     print('icon pressed');
                    //   },
                    //   icon: Icon(
                    //     Icons.settings_sharp,
                    //     size: 40,
                    //     color: Colors.white,
                    //   ),
                    // ),
                    // Row(
                    //   children: [
                    //     Padding(
                    //       padding: const EdgeInsets.only(left: 100),
                    //       child: InkWell(
                    //         child: Icon(
                    //           Icons.settings_sharp,
                    //           size: 40,
                    //           color: Colors.white,
                    //         ),
                    //         onTap: () {
                    //           print('object');
                    //         },
                    //       ),
                    //     ),
                    //   ],
                    // ),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width - 20,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 10, right: 5),
                        child: Row(
                          children: [
                            Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Color.fromARGB(255, 40, 145, 145),
                              ),
                              child: Image(
                                image: AssetImage('assets/Vector.png'),
                              ),
                            ),
                            SizedBox(width: 15),
                            Text(
                              'Data Updated on',
                              style: TextStyle(
                                  fontFamily: GoogleFonts.inter().fontFamily,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.black),
                            ),
                            SizedBox(
                              width: 70,
                            ),
                            Text(
                              Data['time'],
                              style: TextStyle(
                                  fontFamily: GoogleFonts.itim().fontFamily,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.black),
                            ),
                            Container(
                              height: 15,
                              width: 15,
                              decoration: BoxDecoration(
                                  color: Colors.blueAccent,
                                  borderRadius: BorderRadius.circular(100)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    Container(
                      height: 170,
                      width: MediaQuery.of(context).size.width - 20,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: Colors.white),
                      child: Padding(
                        padding: EdgeInsets.only(left: 30, right: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  'Temperature',
                                  style: TextStyle(
                                      fontFamily:
                                          GoogleFonts.cabin().fontFamily,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      Data['temp'].toString(),
                                      style: TextStyle(
                                          fontFamily:
                                              GoogleFonts.chewy().fontFamily,
                                          fontSize: 76,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black),
                                    ),
                                    Text(
                                      '°c',
                                      style: TextStyle(
                                          fontFamily:
                                              GoogleFonts.cabin().fontFamily,
                                          fontSize: 33,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            VerticalDivider(
                              color: Colors.black,
                              thickness: 1,
                              endIndent: 20,
                              indent: 30,
                            ),
                            Column(
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  'Humidity',
                                  style: TextStyle(
                                      fontFamily:
                                          GoogleFonts.cabin().fontFamily,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      Data['humid'].toString(),
                                      style: TextStyle(
                                          fontFamily:
                                              GoogleFonts.chewy().fontFamily,
                                          fontSize: 76,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black),
                                    ),
                                    Text(
                                      '%',
                                      style: TextStyle(
                                          fontFamily:
                                              GoogleFonts.cabin().fontFamily,
                                          fontSize: 33,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  height: 103,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60),
                      color: Colors.white),
                  child: Row(
                    children: [
                      Container(
                        height: 65,
                        width: 65,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.lightBlue,
                        ),
                        child: Image(
                          image: AssetImage('assets/image2.png'),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width - 115,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Lights",
                                  style: TextStyle(
                                      fontSize: 26,
                                      fontFamily:
                                          GoogleFonts.concertOne().fontFamily,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black),
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(top: 8),
                                      child: Container(
                                        height: 17,
                                        width: 17,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(100),
                                            color: Data['color']
                                                ? Colors.red
                                                : Colors.lightBlue),
                                      ),
                                    ),
                                    Text(
                                      Data['light'] ? "Off" : "On",
                                      style: TextStyle(
                                          fontFamily: GoogleFonts.concertOne()
                                              .fontFamily,
                                          fontSize: 27,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Divider(),
                            Row(
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      'Up Time',
                                      style: TextStyle(
                                          fontFamily:
                                              GoogleFonts.inter().fontFamily,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w800,
                                          color: Colors.black),
                                    ),
                                    Text(
                                      '10:00 AM',
                                      style: TextStyle(
                                          fontFamily:
                                              GoogleFonts.inter().fontFamily,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 90,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      'Down Time ',
                                      style: TextStyle(
                                          fontFamily:
                                              GoogleFonts.itim().fontFamily,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w800,
                                          color: Colors.black),
                                    ),
                                    Text(
                                      '05:00 PM ',
                                      style: TextStyle(
                                          fontFamily:
                                              GoogleFonts.itim().fontFamily,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  height: 103,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Colors.white),
                  child: Row(
                    children: [
                      Container(
                        height: 65,
                        width: 65,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.lightBlue,
                        ),
                        child: Image(
                          image: AssetImage('assets/image2.png'),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width - 115,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Air Conditioner",
                                  style: TextStyle(
                                      fontSize: 26,
                                      fontFamily:
                                          GoogleFonts.concertOne().fontFamily,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black),
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(top: 8),
                                      child: Container(
                                        height: 17,
                                        width: 17,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(100),
                                            color: Data['color']
                                                ? Colors.red
                                                : Colors.lightBlue),
                                      ),
                                    ),
                                    Text(
                                      Data['light'] ? "Off" : "On",
                                      style: TextStyle(
                                          fontFamily: GoogleFonts.concertOne()
                                              .fontFamily,
                                          fontSize: 27,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Divider(),
                            Row(
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      'On Temp ',
                                      style: TextStyle(
                                          fontFamily:
                                              GoogleFonts.inter().fontFamily,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w800,
                                          color: Colors.black),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          Data['temp'].toString(),
                                          style: TextStyle(
                                              fontFamily: GoogleFonts.inter()
                                                  .fontFamily,
                                              fontSize: 17,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.black),
                                        ),
                                        Text(
                                          ' °c',
                                          style: TextStyle(
                                              fontFamily: GoogleFonts.inter()
                                                  .fontFamily,
                                              fontSize: 17,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.black),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 90,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      'Off Temp',
                                      style: TextStyle(
                                          fontFamily:
                                              GoogleFonts.itim().fontFamily,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w800,
                                          color: Colors.black),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          Data['temp'].toString(),
                                          style: TextStyle(
                                              fontFamily:
                                                  GoogleFonts.itim().fontFamily,
                                              fontSize: 17,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.black),
                                        ),
                                        Text(
                                          '°C',
                                          style: TextStyle(
                                              fontFamily:
                                                  GoogleFonts.itim().fontFamily,
                                              fontSize: 17,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.black),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
