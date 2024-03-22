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
  Map Data = {};
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  getData() {
    FirebaseDatabase.instance.ref('Esp').onValue.listen((DatabaseEvent event) {
      final res = event.snapshot.value;
      setState(() {
        Data = res as Map;
        isLoading = false;
      });
      // print(Data);
      print(Data['time']);
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const CircularProgressIndicator()
        : Scaffold(
          body: Container(
              decoration: const BoxDecoration(color: Color(0xff20A090)),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 30,
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
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                    fontSize: 30),
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.12,
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const Setting(),
                                    ),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    backgroundColor: const Color(0xff20A090)),
                                child: const Icon(
                                  Icons.settings,
                                  size: 40,
                                  color: Color.fromARGB(255, 252, 250, 250),
                                ))
                          ],
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Row(
                          children: [
                            Container(
                              height: 40,
                              width: MediaQuery.of(context).size.width - 20,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 255, 255, 255),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10, right: 5),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(100),
                                        color: const Color.fromARGB(255, 40, 145, 145),
                                      ),
                                      child: const Image(
                                        image: AssetImage('assets/Vector.png'),
                                      ),
                                    ),
                                    const SizedBox(width: 15),
                                    Text(
                                      'Data Updated on',
                                      style: TextStyle(
                                          fontFamily:
                                              GoogleFonts.inter().fontFamily,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w800,
                                          color: Colors.black),
                                    ),
                                    const SizedBox(
                                      width: 70,
                                    ),
                                    Text(
                                      Data['time'],
                                      style: TextStyle(
                                          fontFamily:
                                              GoogleFonts.itim().fontFamily,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w800,
                                          color: Colors.black),
                                    ),
                                    Container(
                                      height: 15,
                                      width: 15,
                                      decoration: BoxDecoration(
                                          color: Colors.blueAccent,
                                          borderRadius:
                                              BorderRadius.circular(100)),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                         SizedBox(
                          height:MediaQuery.of(context).size.height*0.02,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            children: [
                              Container(
                                height:MediaQuery.of(context).size.height*0.2,
                                width: MediaQuery.of(context).size.width *0.86,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 30, right: 30),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Column(
                                        children: [
                                           SizedBox(
                                           height:MediaQuery.of(context).size.height*0.02
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
                                            height:MediaQuery.of(context).size.height*0.02
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                Data["ac"]['temp'].toString(),
                                                style: TextStyle(
                                                    fontFamily: GoogleFonts.chewy()
                                                        .fontFamily,
                                                    fontSize: 50,
                                                    fontWeight: FontWeight.w400,
                                                    color: Colors.black),
                                              ),
                                              Text(
                                                '°c',
                                                style: TextStyle(
                                                    fontFamily: GoogleFonts.cabin()
                                                        .fontFamily,
                                                    fontSize: 25,
                                                    fontWeight: FontWeight.w400,
                                                    color: Colors.black),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      const VerticalDivider(
                                        color: Colors.black,
                                        thickness: 1,
                                        endIndent: 20,
                                        indent: 30,
                                      ),
                                      Column(
                                        children: [
                                           SizedBox(
                                           height:MediaQuery.of(context).size.height*0.02
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
                                           height:MediaQuery.of(context).size.height*0.02
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                Data["ac"]['humid'].toString(),
                                                style: TextStyle(
                                                    fontFamily: GoogleFonts.chewy()
                                                        .fontFamily,
                                                    fontSize: 50,
                                                    fontWeight: FontWeight.w400,
                                                    color: Colors.black),
                                              ),
                                              Text(
                                                '%',
                                                style: TextStyle(
                                                    fontFamily: GoogleFonts.cabin()
                                                        .fontFamily,
                                                    fontSize: 25,
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
                        ),
                         SizedBox(
                         height:MediaQuery.of(context).size.height*0.02
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          height:MediaQuery.of(context).size.height*0.15,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
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
                                child: const Image(
                                  image: AssetImage('assets/image2.png'),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width - 115,
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Lights",
                                          style: TextStyle(
                                              fontSize: 22,
                                              fontFamily: GoogleFonts.concertOne()
                                                  .fontFamily,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.black),
                                        ),
                                        Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(top: 8),
                                              child: Container(
                                                height: 17,
                                                width: 17,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            100),
                                                    color: Data["lights"]
                                                            ['status']
                                                        ? Colors.red
                                                        : Colors.lightBlue),
                                              ),
                                            ),
                                            Text(
                                              Data['lights']['status']
                                                  ? "Off"
                                                  : "On",
                                              style: TextStyle(
                                                  fontFamily:
                                                      GoogleFonts.concertOne()
                                                          .fontFamily,
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.black),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    const Divider(),
                                    Row(
                                      children: [
                                        Column(
                                          children: [
                                            Text(
                                              'Up Time',
                                              style: TextStyle(
                                                  fontFamily: GoogleFonts.inter()
                                                      .fontFamily,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w800,
                                                  color: Colors.black),
                                            ),
                                            Text(
                                              Data['lights']["on"]['time'],
                                              style: TextStyle(
                                                  fontFamily: GoogleFonts.inter()
                                                      .fontFamily,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.black),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          width: 90,
                                        ),
                                        Column(
                                          children: [
                                            Text(
                                              'Down Time ',
                                              style: TextStyle(
                                                  fontFamily: GoogleFonts.itim()
                                                      .fontFamily,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w800,
                                                  color: Colors.black),
                                            ),
                                            Text(
                                              Data['lights']['off']['time'],
                                              style: TextStyle(
                                                  fontFamily: GoogleFonts.itim()
                                                      .fontFamily,
                                                  fontSize: 15,
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
                         height:MediaQuery.of(context).size.height*0.02
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                         height:MediaQuery.of(context).size.height*0.15,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
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
                                child: const Image(
                                  image: AssetImage('assets/image2.png'),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width - 115,
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Air Conditioner",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontFamily: GoogleFonts.concertOne()
                                                  .fontFamily,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.black),
                                        ),
                                        Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(top: 8),
                                              child: Container(
                                                height: 17,
                                                width: 17,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            100),
                                                    color: Data['ac']['status']
                                                        ? Colors.red
                                                        : Colors.lightBlue),
                                              ),
                                            ),
                                            Text(
                                              Data['lights']['status']
                                                  ? "Off"
                                                  : "On",
                                              style: TextStyle(
                                                  fontFamily:
                                                      GoogleFonts.concertOne()
                                                          .fontFamily,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.black),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    const Divider(),
                                    Row(
                                      children: [
                                        Column(
                                          children: [
                                            Text(
                                              'On Temp ',
                                              style: TextStyle(
                                                  fontFamily: GoogleFonts.inter()
                                                      .fontFamily,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w800,
                                                  color: Colors.black),
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  Data['ac']['on'].toString(),
                                                  style: TextStyle(
                                                      fontFamily:
                                                          GoogleFonts.inter()
                                                              .fontFamily,
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.w400,
                                                      color: Colors.black),
                                                ),
                                                Text(
                                                  ' °c',
                                                  style: TextStyle(
                                                      fontFamily:
                                                          GoogleFonts.inter()
                                                              .fontFamily,
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.w400,
                                                      color: Colors.black),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          width: 90,
                                        ),
                                        Column(
                                          children: [
                                            Text(
                                              'Off Temp',
                                              style: TextStyle(
                                                  fontFamily: GoogleFonts.itim()
                                                      .fontFamily,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w800,
                                                  color: Colors.black),
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  Data['ac']['off'].toString(),
                                                  style: TextStyle(
                                                      fontFamily:
                                                          GoogleFonts.itim()
                                                              .fontFamily,
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.w400,
                                                      color: Colors.black),
                                                ),
                                                Text(
                                                  '°C',
                                                  style: TextStyle(
                                                      fontFamily:
                                                          GoogleFonts.itim()
                                                              .fontFamily,
                                                      fontSize: 15,
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
            ),
        );
  }
}
