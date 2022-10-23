import 'dart:async';
//import 'dart:html';



import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:csv/csv.dart';
import 'package:external_path/external_path.dart';
import 'package:permission_handler/permission_handler.dart';
//import 'package:path_provider/path_provider.dart';

import 'dart:io';

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

  @override
  void initState(){
    getPermission();
  }

  Future<void> getPermission() async {
    PermissionStatus storage = await Permission.storage.request();
  }
  List<List<dynamic>> dataList= [["Time","X","Y","Z"]];
  //SensorPlus
  void StartChecking(){

    var e;
    DateTime _now;
    if(!pressStart) {
      pressStart = true;
      late Timer _timer;
      print("press Start = ${pressStart}");
      if (!pressStop) {
        _timer = Timer.periodic(Duration(milliseconds: 200), (timer) {
          if (!pressStop) {

            setState(() {
              //Now
              accelerometerEvents.listen((AccelerometerEvent event) {
                List<dynamic> tmp = [];
                _now = DateTime.now();
                tmp.add('${_now.hour}:${_now.minute}:${_now.second}.${_now.millisecond}');
                tmp.add(event.x);
                tmp.add(event.y);
                tmp.add(event.z);
                dataList.add(tmp);
                e = event;
              });//Now
              //before
              insideText = "${e}";

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


  /*
  Future<void> getPath() async {
      String path = await ExternalPath.getExternalStoragePublicDirectory(ExternalPath.DIRECTORY_DOWNLOADS);
      setState(() {
        print(path); // /storage/emulated/0/Download
        dir = path;
      });

   */


  Future<void> StopChecking()
  async {
    if(pressStart)
    {
      pressStart = false;
      pressStop = true;
      dataList.removeLast();
      String csv = const ListToCsvConverter().convert(dataList);

      String dir = await ExternalPath.getExternalStoragePublicDirectory(ExternalPath.DIRECTORY_DOWNLOADS);
      //String dir = "/storage/emulated/0/Downloads";
      String file = "$dir";
      File f = File('$file/filename.csv');
      f.writeAsString(csv);
      print(dir);


      // dataList.removeLast();
      print(dataList);
      setState((){
        //String csv = const ListToCsvConverter().convert(dataList);
        insideText = "Click Above To Start";
      });

    }
    else {
      Null;
    }
  }
  /*void StopChecking()
  {
    if(pressStart)
    {
      pressStart = false;
      pressStop = true;
      setState(() {
        dataList.removeLast();
        print(dataList);
        String csv = const ListToCsvConverter().convert(dataList);
        insideText = "Click Above To Start";
      });

    }
    else {
      Null;
    }
  }*/
}
