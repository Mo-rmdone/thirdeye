import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thirdeye/cubit/ch_cubit/states.dart';
import '../../screens/ch_articles/ch_articles.dart';
import '../../screens/ch_care/ch_caringlayout.dart';
import '../../screens/ch_home/myhome.dart';
import '../../screens/ch_profile/userprofile.dart';
import '../../screens/ch_tracking/tracking.dart';
import '../../shared/network/local/cashe_helper.dart';



class ChildrenAppCubit extends Cubit<ChildrenAppStates> {
  ChildrenAppCubit() : super(InitialState());

  static ChildrenAppCubit get(context) => BlocProvider.of(context);
  int currentIndex = 2;
  int barIndex = 1;
  List<Widget> homeScreens =
  [
    const ChildrenArticlesScreen(),
    const ChildrenCareScreen(),
    const HomeScreen(),
    const ChildrenTrackingScreen(),
    const ChildrenProfileScreen(),

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

}