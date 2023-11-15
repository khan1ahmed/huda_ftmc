import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

class TemperatueAdjuster extends StatefulWidget {
  @override
  _TemperatueAdjusterState createState() => _TemperatueAdjusterState();
}

class _TemperatueAdjusterState extends State<TemperatueAdjuster> {
  late DatabaseReference _acOnRef, _acOffRef;
  int _acOnTemp = 16;
  int _acOffTemp = 30;

  @override
  void initState() {
    super.initState();
    // Replace "your_database_url" with your Firebase Realtime Database URL
    _acOnRef = FirebaseDatabase.instance.ref('/Esp/ac/on');
    _acOffRef = FirebaseDatabase.instance.ref('/Esp/ac/off');
    _acOnRef.onValue.listen((DatabaseEvent event) {
      setState(() {
        _acOnTemp = event.snapshot.value as int;
      });
    });
    _acOffRef.onValue.listen((DatabaseEvent event) {
      setState(() {
        _acOffTemp = event.snapshot.value as int;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
        Column(
          children: [
            Text('data'),
              DropdownButton<double>(
            value: _acOnTemp.toDouble(),
            items: _buildDropdownItems(),
            onChanged: (value) {
              _acOnRef.set(value?.toInt());
            },
          ),
          ],
        ),
       
        
        Column(children: [
          Text('data'),
            DropdownButton<double>(
            
            value: _acOffTemp.toDouble(),
            items: _buildDropdownItems(),
            onChanged: (value) {
              _acOffRef.set(value?.toInt());
            },
          ),
        ],)
        ],
      
    );
  }

  List<DropdownMenuItem<double>> _buildDropdownItems() {
    List<DropdownMenuItem<double>> items = [];
    for (double i = 16.0; i <= 30.0; i++) {
      items.add(DropdownMenuItem(
        value: i,
        child: Text('$i °C'),
      ));
      
    }
    return items;
  }
}
