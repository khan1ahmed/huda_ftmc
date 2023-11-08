import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
 Map Data={};
  @override
void initState(){
  getData();
}

  getData () async{
  
final ref = FirebaseDatabase.instance.ref();
final snapshot = await ref.child('Esp').get();
if (snapshot.exists) {
    print(snapshot.value);
    setState(() {
      
    Data=snapshot.value as Map;

    });
} else {
    print('No data available.');
}
  }
  @override
  Widget build(BuildContext context) {
    return Container(decoration:BoxDecoration(color:Color(0xff20A090)),
    child: Column(
children: [
  Text(Data["humid"].toString()),
],
    ),
    );
  }
}