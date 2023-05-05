import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/ch_cubit/ch_cubit.dart';
import '../cubit/ch_cubit/states.dart';


class ChildrenLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cubit = ChildrenAppCubit.get(context);
    return BlocConsumer<ChildrenAppCubit, ChildrenAppStates>(
      listener: (context, state)
      {
      },
      builder: (context, state) {

        return Scaffold(
          body: cubit.homeScreens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index)
            {
              cubit.changeBottom(index);
            },
            currentIndex: cubit.currentIndex,
            items:  const [
              BottomNavigationBarItem(icon: Icon(Icons.medical_information, size: 30,), label: ''),
              BottomNavigationBarItem(icon: Icon(Icons.health_and_safety,size: 30),label: '' ),
              BottomNavigationBarItem(icon: Icon(Icons.home , size: 30),label: '' ),
              BottomNavigationBarItem(icon: Icon(Icons.child_care, size: 30),label: '' ),
              BottomNavigationBarItem(icon: Icon(Icons.person_outlined, size: 30),label: ''),
            ],),

        );
      },
    );
  }
}
