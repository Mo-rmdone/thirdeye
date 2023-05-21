import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:thirdeye/cubit/ch_cubit/states.dart';
import '../../screens/ch_articles/ch_articles.dart';
import '../../screens/ch_care/ch_caringlayout.dart';
import '../../screens/ch_home/myhome.dart';
import '../../screens/ch_profile/userprofile.dart';
import '../../screens/ch_tracking/tracking.dart';
import '../../screens/testscreen.dart';

import '../../shared/network/local/cashe_helper.dart';

class ChildrenAppCubit extends Cubit<ChildrenAppStates> {
  ChildrenAppCubit() : super(InitialState());

  static ChildrenAppCubit get(context) => BlocProvider.of(context);
  int currentIndex = 2;
  int barIndex = 1;
  List<Widget> homeScreens =
  [
    ChildrenArticlesScreen(),
    const ChildrenCareScreen(),
    const HomeScreen(),
    const ChildrenTrackingScreen(),
    // testScreen(),
    const UserProfileScreen(),

  ];
  void changeBottom(int index) {
    currentIndex = index;
    emit(BottomNavigationBarState());
  }
  void changeTabBar(int index) {
    barIndex = index;
    emit(TabNavigationBarState());
  }
  bool isDark = false;
  void changeAppMode({bool? saved})
  {
    if (saved != null) {
      isDark = saved ;
      emit(ChangeModeState());
    }
    else{
      isDark = ! isDark;
      CacheHelper.putData(kay: 'isDark', value: isDark).then((value) {emit(ChangeModeState());});
    }


  }

  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;
  final DateFormat _dateFormat = DateFormat('dd/MM/yyyy');
  void selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2015),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null) {
      _selectedDate = pickedDate;
      emit(DateSelectedState());
    }
  }
  String getSelectedDate() {
    return _selectedDate != null
        ? _dateFormat.format(_selectedDate!)
        : _dateFormat.format(DateTime.now());
  }
  void selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: _selectedTime ?? TimeOfDay.now(),
    );

    if (pickedTime != null) {
      _selectedTime = pickedTime;
      emit(TimeSelectedState());
      _startTimer();
    }
  }
  String getSelectedTime() {
    final TimeOfDay selectedTime = _selectedTime ?? TimeOfDay.now();
    final String formattedTime = '${selectedTime.hour}:${selectedTime.minute.toString().padLeft(2, '0')}';
    return formattedTime;
  }
  void clearSelectedDate() {
    _selectedDate = null;
    _selectedTime = null;
    emit(DateClearedState());
    emit(TimeClearedState());
    //_stopTimer();
  }
  late Timer _timer;
  void _startTimer() {
    _timer = Timer.periodic(Duration(minutes: 1), (timer) {
      emit(TimeSelectedState());
    });
  }

  File? image;
  final imagePicker=ImagePicker();
  XFile? pickedImage;
  void uploadImage(ImageSource src)async {
    XFile? pickedImage = await imagePicker.pickImage(
        source: src, imageQuality: 70);
    image = File(pickedImage!.path);
    emit(updateImage());
  }



        // void _stopTimer() {
  //   _timer.cancel();
  // }
  //
  // @override
  // Future<void> close() {
  //   _stopTimer(); // add this line to stop the timer when the cubit is closed
  //   return super.close();
  // }





}
