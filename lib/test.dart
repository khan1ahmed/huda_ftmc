import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late DatabaseReference _acOnRef, _acOffRef;
  double _acOnTemp = 16.0;
  double _acOffTemp = 16.0;

  @override
  void initState() {
    super.initState();
    // Replace "your_database_url" with your Firebase Realtime Database URL
    _acOnRef = FirebaseDatabase.instance.ref('/Esp/ac/on');
    _acOffRef = FirebaseDatabase.instance.ref('/Esp/ac/off');

    _acOnRef.onValue.listen((DatabaseEvent event) {
      setState(() {
        _acOnTemp = event.snapshot.value as double;
      });
    });

    _acOffRef.onValue.listen((DatabaseEvent event) {
      setState(() {
        _acOffTemp = event.snapshot.value as double;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AC Temperature Control'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'AC On Temperature: $_acOnTemp °C',
              style: TextStyle(fontSize: 18.0),
            ),
            DropdownButton<double>(
              value: _acOnTemp,
              items: _buildDropdownItems(),
              onChanged: (value) {
                _acOnRef.set(value);
              },
            ),
            SizedBox(height: 20.0),
            Text(
              'AC Off Temperature: $_acOffTemp °C',
              style: TextStyle(fontSize: 18.0),
            ),
            DropdownButton<double>(
              value: _acOffTemp,
              items: _buildDropdownItems(),
              onChanged: (value) {
                _acOffRef.set(value);
              },
            ),
          ],
        ),
      ),
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
