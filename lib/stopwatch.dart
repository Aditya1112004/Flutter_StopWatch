import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StopWatchApp extends StatefulWidget {
  const StopWatchApp({Key? key}) : super(key: key);

  @override
  State<StopWatchApp> createState() => _StopWatchAppState();
}

class _StopWatchAppState extends State<StopWatchApp> {
  late Stopwatch stopwatch;
  late Timer t;

  void handleStartStop() {
    if (stopwatch.isRunning) {
      stopwatch.stop();
    } else {
      stopwatch.start();
    }
  }

  String returnFormatedText() {
    var milli =stopwatch.elapsed.inMilliseconds;

    String milliseconds=(milli % 100).toString().padLeft(2,"0");
    String seconds=((milli ~/ 1000) % 60).toString().padLeft(2,"0");
    String minutes=((milli ~/ 1000)~/60).toString().padLeft(2,"0");

    return "$minutes:$seconds:$milliseconds";
  }

  @override
  void initState() {
    super.initState();
    stopwatch = Stopwatch();
    t=Timer.periodic(Duration(milliseconds: 30),(timer){
      setState(() {});
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // centerTitle:true,
        title: Text("Stopwatch"),
        backgroundColor: Colors.purple[800],
      ),
      body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CupertinoButton(
                  onPressed: () {
                    handleStartStop();
                  },
                  padding: EdgeInsets.all(0),
                  child: Container(
                    height: 200,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Color(0xff0395eb),
                          width: 4,
                        )),
                    child: Text(
                      returnFormatedText(),
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                CupertinoButton(
                  onPressed: () {
                    stopwatch.reset();
                    stopwatch.stop();
                  },
                  padding: EdgeInsets.all(0),
                  child: Text("Reset",
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          )),
    );;
  }
}
