import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../cubit/ch_cubit/ch_cubit.dart';
import '../../cubit/ch_cubit/states.dart';
import '../shared/styles/my_icons_icons.dart';


class ChildrenLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cubit = ChildrenAppCubit.get(context);
    return BlocConsumer<ChildrenAppCubit, ChildrenAppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: cubit.homeScreens[cubit.currentIndex],
          bottomNavigationBar:
          BottomNavigationBar(
            onTap: (index)
            {
              cubit.changeBottom(index);
            },
            currentIndex: cubit.currentIndex,
            items:   [
              BottomNavigationBarItem(icon: Icon(MyIcons.post, size: 30), label: ''),
              BottomNavigationBarItem(icon: Icon( MyIcons.care,size: 40),label: '' ),
              BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.house, size: 30),label: '' ),
              BottomNavigationBarItem(icon: Icon( MyIcons.babyheart, size: 40,),label: '' ),
              BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.solidUser, size: 30),label: ''),
            ],),

        );
      },
    );
  }
}
