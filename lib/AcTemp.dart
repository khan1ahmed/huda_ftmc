import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

class TemperatureAdjuster extends StatefulWidget {
  const TemperatureAdjuster({super.key});

  @override
  _TemperatureAdjusterState createState() => _TemperatureAdjusterState();
}

class _TemperatureAdjusterState extends State<TemperatureAdjuster> {
  late DatabaseReference _acOnRef, _acOffRef;
  int _acOnTemp = 16;
  int _acOffTemp = 30;

  @override
  void initState() {
    super.initState();
    // Replace "your_database_url" with your Firebase Realtime Database URL
    _acOnRef = FirebaseDatabase.instance.ref('/Esp/ac/on');
    _acOffRef = FirebaseDatabase.instance.ref('/Esp/ac/off');

    // Listen for changes in the database and update the state accordingly
    _acOnRef.onValue.listen((DatabaseEvent event) {
      setState(() {
        _acOnTemp = (event.snapshot.value ?? 16) as int;
      });
    });

    _acOffRef.onValue.listen((DatabaseEvent event) {
      setState(() {
        _acOffTemp = (event.snapshot.value ?? 30) as int;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          buildColumn('AC On Temperature', _acOnTemp, _acOnRef),
          buildColumn('AC Off Temperature', _acOffTemp, _acOffRef),
        ],
      ),
    );
  }

  Column buildColumn(String label, int value, DatabaseReference reference) {
    return Column(
      children: [
        Text(label),
        DropdownButton<int>(
          value: value,
          items: _buildDropdownItems(),
          onChanged: (selectedValue) {
            reference.set(selectedValue);
          },
        ),
      ],
    );
  }

  List<DropdownMenuItem<int>> _buildDropdownItems() {
    List<DropdownMenuItem<int>> items = [];
    for (int i = 16; i <= 30; i++) {
      items.add(DropdownMenuItem(
        value: i,
        child: Text('$i °C'),
      ));
    }
    return items;
  }
}
