import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import '../../ch_widgets/voice/record.dart';
import '../../ch_widgets/voice/timer.dart';
import '../../cubit/ch_cubit/ch_cubit.dart';


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
      body:  SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(children: [
                  IconButton(
                    icon: Icon(Icons.calendar_month),
                    onPressed: () {
                      ChildrenAppCubit.get(context).selectDate(context);},
                  ),
                  Spacer(),
                  Text(
                    ChildrenAppCubit.get(context).getSelectedDate(),)],),
                Row(children: [
                  IconButton(
                    icon: Icon(Icons.access_time),
                    onPressed: () {

                      ChildrenAppCubit.get(context).selectTime(context);
                    },
                  ),
                  Spacer(),
                  Text(
                    ChildrenAppCubit.get(context).getSelectedTime(),

                  ),
                ],),
                ElevatedButton(
                  child: Text('Save '),
                  onPressed: () {
                    ChildrenAppCubit.get(context).clearSelectedDate();
                    //ChildrenAppCubit.get(context).setCurrentTime();
                  },
                ),
                buildPlayer(),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.green,
                      width: 5
                    )
                  ),
                  width: 300,
                  height: 100,
                  child: Center(
                    child: Text(
                      'result'
                    ),
                  ),

                ),
              ],
            ),
          )



        ),
      ),
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
      endRadius:170.0,
      duration: const Duration(milliseconds: 2000),
      animate: animate,
      repeatPauseDuration: const Duration(milliseconds: 100),
      child: CircleAvatar(
        radius: 120,
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
            radius: 112,
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
