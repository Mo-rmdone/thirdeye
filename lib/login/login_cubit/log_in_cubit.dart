import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../../shared/network/end_points.dart';

part 'log_in_state.dart';

class LogInCubit extends Cubit<LogInState> {
  LogInCubit() : super(LogInInitial());
  static LogInCubit get(context)=> BlocProvider.of(context);



//   void userLogin ({
//     required String email,
//     required String password,
// })
//   {
//
//     emit(LogInInLoading());
//     DioHelper.postData(
//         url: LOGIN,
//         data:
//         {
//           'email': email,
//           'password':password,
//         })
//         .then((value)
//           {
//             loginModel = LoginModel.fromJson(value!.data);
//             print(loginModel.message);
//             print(loginModel.status);
//             emit(LogInSuccess(loginModel));
//           })
//         .catchError((onError)
//           {
//             print(onError.toString());
//             emit(LogInInError(onError.toString()));
//           });
//   }

  IconData suffix = Icons.visibility;
  bool isPassword = true;

  void changePasswordVisibility()
  {
    isPassword =! isPassword;
    suffix  = isPassword ? Icons.visibility : Icons.visibility_off;
    emit(LogInShowPasswordState());
  }

}
