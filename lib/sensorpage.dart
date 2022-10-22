import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_sensors/flutter_sensors.dart';


void main() => runApp(MaterialApp(
    home: SensorData()
));


// Stateless Widget Home
class SensorData extends StatefulWidget{
  @override
  State<SensorData> createState() => _SensorDataState();
}

class _SensorDataState extends State<SensorData> {
  @override

  bool pressStart = false;
  bool pressStop = false;
  String insideText = "Click Above To Start";

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
              onPressed: (){
                StartChecking();
                /*if(!pressStart) {
                  StartChecking();
                }
                else
                  Null;*/
              },
              icon: Icon(
                  Icons.start
              ),
              label: Text("Start"),

            ),
          ),

          Container(
            padding: EdgeInsets.fromLTRB(150, 0, 0, 0),
            child:Text("$insideText"),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(150, 0, 0, 0),
            child: ElevatedButton.icon(
              onPressed: () {
                StopChecking();
              },
              icon: Icon(
                  Icons.pause
              ),
              label: Text("Stop"),
            ),
          ),

        ],
      ),

    );
  }
  // onPress Function
  void StartChecking(){
    if(!pressStart) {
      pressStart = true;
      late Timer _timer;
      int i = 0;
      print("press Start = ${pressStart}");
      if (!pressStop) {
        _timer = Timer.periodic(Duration(milliseconds: 300), (timer) {
          if (!pressStop) {
            setState(() {
              insideText = "i = ${i}";
              i++;
            });
          }
          else {
            print("Inside");
            pressStop = false;
            _timer.cancel();
          }
        });
      }
      else {
        print("Stop Button is pressed");
      }
    }
    else
      Null;

  }
  /*void StartChecking(){
    pressStart = true;
    late Timer _timer;
    int i =0;
    print("press Start = ${pressStart}");
    if(!pressStop){
      _timer = Timer.periodic(Duration(milliseconds: 300), (timer) {
        if(!pressStop){
          setState(() {
            insideText = "i = ${i}";
            i++;
          });
        }
        else {
          print("Inside");
          pressStop = false;
          _timer.cancel();
        }
      });

    }
    else{
      print("Stop Button is pressed");
    }

  }*/

  void StopChecking()
  {
    if(pressStart)
    {
      pressStart = false;
      pressStop = true;
      setState(() {
        insideText = "Click Above To Start";
      });

    }
    else {
      Null;
    }
  }
}
