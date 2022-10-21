import 'package:flutter/material.dart';
import 'package:flutter_sensors/flutter_sensors.dart';


void main() => runApp(MaterialApp(
    home: SensorData()
));

// Stateless Widget Home

class SensorData extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Accelerometer Sensor"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(150, 0, 0, 0),
            child: ElevatedButton.icon(
              onPressed: () {  },
              icon: Icon(
                  Icons.start
              ),
              label: Text("Start"),

            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(150, 0, 0, 0),
            child: Text("Data Receiving"),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(150, 0, 0, 0),
            child: ElevatedButton.icon(
              onPressed: () {  },
              icon: Icon(
                  Icons.pause
              ),
              label: Text("Stop"),
            ),
          )
        ],
      ),

    );
  }

}
