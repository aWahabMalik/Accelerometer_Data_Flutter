import 'package:flutter/material.dart';
import 'package:first/sensorpage.dart';

void main() => runApp(MaterialApp(
  home: Home()
));

// Stateless Widget Home

class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Accelerometer Sensor"),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton.icon(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>SensorData()));
            },
          icon: Icon(
            Icons.data_array
          ),
          label: Text("Accelerometer Test"),
          


        ),
      ),
    );
  }
  
}