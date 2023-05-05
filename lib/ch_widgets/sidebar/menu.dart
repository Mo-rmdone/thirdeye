import 'package:flutter/material.dart';
import 'package:thirdeye/cubit/ch_cubit/ch_cubit.dart';
import '../../../shared/components/components.dart';
import '../../../shared/network/local/cashe_helper.dart';
import '../../login/ch_login/login_screen.dart';

class SideMenu extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var cubit = ChildrenAppCubit.get(context);
        return Drawer(
            child: ListView(
              children: [
                const DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                  child: Text('Menu'),
                ),
                ListTile(
                  leading: const Icon(Icons.home),
                  title: const Text('Home'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      const Text("Dark Mode",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),),
                      const Spacer(),
                      IconButton(
                          onPressed: () {
                            cubit.changeAppMode();
                          },
                          icon: const Icon(Icons.light_mode_rounded)),
                    ],
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.home),
                  title: const Text('Home'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.login_outlined),
                  title: const Text('Home'),
                  onTap: () {

                    CacheHelper.removeData(key: 'token').then((value)
                    {
                    if(value!)
                    {
                      navigatePushAndRemoveUntil(context, LogInScreen());
                    }
                    });
                  },
                ),
              ],
            )
        );

  }
}
