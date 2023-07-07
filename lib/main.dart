import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:thirdeye/presentation/shared/bloc_observer.dart';
import 'package:thirdeye/presentation/shared/components/applocal.dart';
import 'package:thirdeye/presentation/shared/network/local/cashe_helper.dart';
import 'package:thirdeye/presentation/shared/network/remote/dio_helper.dart';
import 'package:thirdeye/presentation/shared/styles/themes/app_themes.dart';
import 'cubit/ch_cubit/ch_cubit.dart';
import 'cubit/ch_cubit/states.dart';
import 'cubit/lang_cubit/locale_cubit.dart';
import 'cubit/login_cubit/log_in_cubit.dart';
import 'cubit/main_feature/main_feature_cubit.dart';
import 'cubit/tracking_cubit/tracking_cubit.dart';
import 'presentation/children_layout/children_layout.dart';
import 'presentation/login/ch_login/login_screen.dart';
import 'presentation/login/ch_onBorading/onborading_screen.dart';
import 'presentation/shared/components/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  bool? isDark = CacheHelper.getData(kay: 'isDark');
  bool? onBoarding = CacheHelper.getData(kay: 'onBoarding');
  //token = CacheHelper.getData(kay: 'token');
  Widget? widget;

  if (onBoarding == true) {
    if (token == true) {
      widget = ChildrenLayout();
    }
    else {
      widget = LogInScreen();
    }
  }
  else {
    widget = onBoardingScreen();
  }


  runApp(MyApp(
      isDark: isDark,
      startingWidget: widget
  ));
}

class MyApp extends StatelessWidget {
  final bool? isDark;
  final Widget? startingWidget;

  MyApp({this.isDark, this.startingWidget});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => ChildrenAppCubit()),
        BlocProvider(create: (BuildContext context) => LocaleCubit()..getSavedLanguage()),
        BlocProvider(create: (BuildContext context) => LogInCubit()),
        BlocProvider(create: (BuildContext context) => MainFeatureCubit()),
        BlocProvider(create: (BuildContext context) => TrackingCubit()..updateTeeth()),

      ],
      child: BlocConsumer <ChildrenAppCubit, ChildrenAppStates>(
        listener: (context, state) {
          if (state is ChangeModeLoadingState) {

          }
          else if (state is ChangeModeLoadingState) {

          }
        },
        builder: (context, state) {
          return  ScreenUtilInit(
              designSize: const Size(360, 690),
              minTextAdapt: true,
              splitScreenMode: true,
              builder: (context , child){
                return MaterialApp(
                    debugShowCheckedModeBanner: false,
                    theme: lightTheme,
                    darkTheme: darkTheme,
                    themeMode: ChildrenAppCubit
                        .get(context)
                        .isDark ? ThemeMode.dark : ThemeMode.light,
                    home: ChildrenLayout(),
                    localizationsDelegates: [
                      AppLocale.delegate,
                      GlobalMaterialLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                    ],
                    supportedLocales: [
                      Locale("en", ""),
                      Locale("ar", ""),

                    ],


                    localeResolutionCallback: (currentLanguage, supportLanguage) {
                      if (currentLanguage != null) {
                        for (Locale locale in supportLanguage) {
                          if (locale.languageCode ==
                              currentLanguage.languageCode) {
                            return currentLanguage;
                          }
                        }
                      }
                      return supportLanguage.first;
                    }


                );
              }


          );
        },

      ),
    );
  }

}