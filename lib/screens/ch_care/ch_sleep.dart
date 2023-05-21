import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubit/ch_cubit/ch_cubit.dart';
import '../../cubit/ch_cubit/states.dart';
class SleepScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChildrenAppCubit, ChildrenAppStates>(
      builder: (context, state) {
        final cubit = ChildrenAppCubit.get(context);
        final selectedTime = cubit.getSelectedTime();
        return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
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
                    //Text('${selectedTime}')
                  ],),
                  ElevatedButton(
                    child: Text('Save '),
                    onPressed: () {
                      ChildrenAppCubit.get(context).clearSelectedDate();
                      //ChildrenAppCubit.get(context).setCurrentTime();
                    },
                  ),
                ],


              ),
            )
        );
      },
    );
  }
}
