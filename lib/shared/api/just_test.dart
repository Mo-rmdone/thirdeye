import 'dart:async';

import 'package:flutter/material.dart';

class CountPage extends StatefulWidget {
  const CountPage({Key? key}) : super(key: key);

  @override
  State<CountPage> createState() => _CountPageState();
}

class _CountPageState extends State<CountPage> {

  Duration duration =  Duration();
  Timer? timer;

  @override
  void initState() {
    super.initState();

        statTimer();

  }

  void addTime ()
  {
    const addSeconds = 1;
    setState ((){
      final seconds = duration.inSeconds + addSeconds;
      duration = Duration(seconds: seconds);

    });

  }
  void statTimer()
  {
    timer = Timer.periodic(const Duration(seconds: 1), (_)=> addTime());
  }

  @override
  Widget build(BuildContext context) {



    return Center(
      child: buildTime(),
    );



  }
  Widget buildTime()
  {
    String twoDigits(int n) =>n.toString().padLeft(2,'0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return Text(
      '$minutes : $seconds',
      style: const TextStyle(
          fontSize: 20

      ),
    );
  }
}
