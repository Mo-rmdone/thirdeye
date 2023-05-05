import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper
{
  static SharedPreferences? sharedPreferences;
  static init () async
  {
    WidgetsFlutterBinding.ensureInitialized();
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool?> putData ({
    required String kay,
    required bool value,
}) async
  {
    return await sharedPreferences?.setBool(kay, value);

  }

  static dynamic getData({required kay})
  {
    return sharedPreferences?.get(kay);
  }

  static Future<bool?> saveData ({
    required String kay,
    required dynamic value,
  }) async
  {
    if(value is String)
    {
      return await sharedPreferences?.setString(kay, value);
    }
    if(value is int)
    {
      return await sharedPreferences?.setInt(kay, value);
    }
    if(value is bool)
    {
      return await sharedPreferences?.setBool(kay, value);
    }

    return await sharedPreferences?.setDouble(kay, value);

  }

  static Future<bool?> removeData({required String key})async
  {
    return await sharedPreferences?.remove(key);

    //  sign out function
    // CacheHelper.removeData(key: 'token').then((value)
    // {
    // if(value!)
    // {
    // navigatePushAndRemoveUntil(context, LogInScreen());
    // }
    // });
  }


}