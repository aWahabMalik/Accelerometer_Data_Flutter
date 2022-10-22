import 'package:flutter/material.dart';
import 'package:flutter_sensors/flutter_sensors.dart';


void main() => runApp(MaterialApp(
    home: SensorData()
));

bool pressStart = false;
bool pressStop = false;
String insideText = "Click Above To Start";
// Stateless Widget Home
class SensorData extends StatefulWidget{
  @override
  State<SensorData> createState() => _SensorDataState();
}

class _SensorDataState extends State<SensorData> {
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
              onPressed: (){
                if(!pressStart) {
                  pressStart = true;
                  StartChecking();
                  pressStop = false;
                  pressStart = false;
                }
                else
                  Null;
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
    int i =0;
    setState(() {
      if(!pressStop) {
        while (!pressStop) {
          Future.delayed(const Duration(milliseconds: 2000), (){
            print("object");
            i++;
            insideText = "Data Received ${i}";
          });
        }
        i = 0;
      }
      else{
        print("Inside else StartChecking");
        Null;
      }
    });
  }

  void StopChecking()
  {
   if(pressStart)
   {
       setState(() {
         pressStart = false;
         pressStop = true;
         insideText = "Click Above To Start";
       });
   }
   else {
     print("Inside else StopChecking");
     Null;
   }
  }
}
