
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thirdeye/shared/bloc_observer.dart';
import 'package:thirdeye/shared/components/constants.dart';
import 'package:thirdeye/shared/network/local/cashe_helper.dart';
import 'package:thirdeye/shared/network/remote/dio_helper.dart';
import 'package:thirdeye/shared/styles/themes/app_themes.dart';
import 'children_layout/children_layout.dart';
import 'cubit/ch_cubit/ch_cubit.dart';
import 'cubit/ch_cubit/states.dart';
import 'login/ch_login/login_screen.dart';
import 'login/ch_onBorading/onborading_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  bool? isDark = CacheHelper.getData(kay: 'isDark');
  bool? onBoarding = CacheHelper.getData(kay: 'onBoarding');
  //token = CacheHelper.getData(kay: 'token');
  Widget? widget;

  if(onBoarding==true)
  {
    if(true)
    {
      widget =  ChildrenLayout();
    }
    else
    {
      widget = LogInScreen();
    }
  }
  else
  {
    widget = onBoardingScreen();
  }


  runApp(MyApp(
      isDark:isDark,
      startingWidget:widget
  ));
}

class MyApp extends StatelessWidget {
  final bool? isDark;
  final Widget? startingWidget;
  MyApp({this.isDark, this.startingWidget});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers:  [

        BlocProvider(
            create: (BuildContext context) =>
            ChildrenAppCubit ()
          ..changeAppMode(
              saved: isDark,
            ),
        ),

      ],
      child: BlocConsumer <ChildrenAppCubit , ChildrenAppStates>(
        listener: (context, state) {
          if (state is ChangeModeLoadingState) {}
          else if (state is ChangeModeLoadingState) {

          }
        },
        builder: (context, state) {
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: lightTheme,
              darkTheme: darkTheme,
              themeMode: ChildrenAppCubit.get(context).isDark? ThemeMode.dark : ThemeMode.light,
              home:  startingWidget
          );
        },

      ),
    );
  }

}