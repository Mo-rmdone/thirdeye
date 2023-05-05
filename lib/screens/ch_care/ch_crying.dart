import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import '../../ch_widgets/voice/record.dart';
import '../../ch_widgets/voice/timer.dart';


class CryScreen extends StatefulWidget {

  @override
  State<CryScreen> createState() => _CryScreenState();
}

class _CryScreenState extends State<CryScreen> {

  final recorder = SoundRecorder();
  final timerController = TimeController();
  @override
  void initState() {

    super.initState();
    recorder.init();
  }
  @override
  void dispose() {
    super.dispose();
    recorder.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body:  Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            buildPlayer(),
            const SizedBox(
              height: 16,
            ) ,
          ],
        )



      ),
    );
  }

  Widget buildStart ()
  {
    final isRecording = recorder.isRecording;
    final icon = isRecording ? Icons.stop : Icons.mic;
    final text = isRecording ? 'STOP' : 'START';
    final pr = isRecording ? Colors.red : Colors.tealAccent;
    final onPr = isRecording ? Colors.white : Colors.black;
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        maximumSize: const Size(175, 50),
        backgroundColor: pr,
        foregroundColor: onPr,

      ),
      icon:  Icon(icon),
      label:  Text(text,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      onPressed: ()async
      {
        await recorder.toggle();
        final isRecording =  recorder.isRecording;
        
        setState(() {
               if(isRecording)
                 {
                   timerController.startTimer();
                 }
               else
                 {
                   timerController.stopTimer();
                 }
        });
      },
    );
  }

  Widget buildPlayer ()
  {
    final isRecording = recorder.isRecording;
    final icon = isRecording ? Icons.stop : Icons.mic;
    final text = recorder.isRecording ? "Now Recording" : "Press to start";
    final animate = recorder.isRecording;
    return AvatarGlow(
      glowColor: Colors.red,
      endRadius:200.0,
      duration: const Duration(milliseconds: 2000),
      animate: animate,
      repeatPauseDuration: const Duration(milliseconds: 100),
      child: CircleAvatar(
        radius: 140,
        backgroundColor: Colors.red[100],
        child:  InkWell(
          onTap: () async
          {
            await recorder.toggle();
            final isRecording =  recorder.isRecording;

            setState(() {
              if(isRecording)
              {
                timerController.startTimer();
              }
              else
              {
                timerController.stopTimer();
              }
            });
          },
          child: CircleAvatar(
            radius: 132,
            backgroundColor: Colors.indigo.shade900.withBlue(70),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children:  [
                const SizedBox(height: 20,),
                Icon(icon, size: 40,),
                const SizedBox(height: 30,),
                TimerWidget(controller: timerController,),
                const SizedBox(height: 30,),
                Text(text),
              ],
            ),
          ),
        )

      ),
    );

  }

}
