import 'dart:async';

import 'package:flutter/material.dart';

class TimeController extends ValueNotifier<bool>
{
  TimeController({bool isPlaying = false}): super(isPlaying);
  void startTimer() => value = true;
  void stopTimer() => value = false;


}


class TimerWidget extends StatefulWidget {

  final TimeController controller;
  const TimerWidget({Key? key, required this.controller}) : super(key: key);

  @override
  State<TimerWidget> createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
 

    Duration duration =  Duration();
    Timer? timer;
    // static const maxSeconds = 60;
    // int seconds = maxSeconds;


    @override
  void initState() {
    super.initState();
    widget.controller.addListener(()
    {
      if(widget.controller.value)
        {
          statTimer();
        }
      else{
        stopTimer();
      }

    });
  }

    void reest() => setState(() => duration = const Duration());

    void addTime ()
    {
      const addSeconds = 1;
      setState ((){
        final seconds = duration.inSeconds + addSeconds;
        if(seconds < 0)
          {
            timer?.cancel();
          }
        else
          {
            duration = Duration(seconds: seconds);
          }

      });

    }
    void statTimer({bool resets = true})
    {
      if(!mounted) return;
      if(resets)
        {
          reest();
        }

      timer = Timer.periodic(const Duration(seconds: 1), (_)=> addTime());
    }

    void stopTimer({bool resets = true})
    {
      if(!mounted) return;
      if(resets)
      {
        reest();
      }

      setState(() =>timer?.cancel());

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




 

  

