import 'dart:io';
import 'dart:math';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:thirdeye/cubit/ch_cubit/ch_cubit.dart';
import 'package:thirdeye/cubit/ch_cubit/states.dart';
import '../../../models/timeLine_event.dart';
import '../../ch_widgets/homescreenbar.dart';
import '../../ch_widgets/items.dart';
import '../../ch_widgets/sidebar/menu.dart';
import '../../shared/components/components.dart';
import '../../shared/components/constants.dart';
import '../../used_items/button.dart';
import '../ch_tracking/memory/memory_screen.dart';
import '../children/child.dart';



class HomeScreen extends StatelessWidget {

  final List<Events> listOfEvents = [
    Events(time: "5:64", eventName: "feeding", description: "feed vai bottle"),
    Events(time: "5:64", eventName: "growth", description: "baby teeth"),

    Events(time: "5:64", eventName: "sleep", description: "deep sleeping no efforts"),

    Events(time: "5:64", eventName: "feeding", description: "feed vai bottle"),


  ];

  final List<Color> listOfColors = [Constants.kPurpleColor,Constants.kGreenColor,Constants.kRedColor];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return BlocConsumer<ChildrenAppCubit, ChildrenAppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = ChildrenAppCubit.get(context);
        File? _img = ChildrenAppCubit.get(context).image;

        Random random = new Random();
        return Scaffold(
          appBar: PreferredSize(
            preferredSize:  Size.fromHeight(size.height*.11),
            child: HomeScreenBar(),),
          drawer: Menu(),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(16.0.sp),
              child: Column(
                children:
                [
                   SizedBox(
                    height: h*.06,
                  ),
                  Container(
                    height: 200.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                        image: DecorationImage(
                          image: _img == null ?
                          AssetImage('assets/images/img2.jpg',)
                              : FileImage(_img) as ImageProvider,
                          fit: BoxFit.cover,
                          opacity: .90,
                        ),
                        boxShadow: const [
                          BoxShadow(
                              blurRadius: 6,
                              color: Colors.black
                          )
                        ]
                    ),
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Positioned(
                          top: 10.h,
                          right: 10.w,
                          child: IconButton(
                              onPressed: () {
                                showAlertDialog(
                                  context: context,
                                  titleOption1: 'camera',
                                  titleOption2: 'gallery',
                                  option1: () {
                                    Navigator.of(context).pop();
                                    cubit.uploadImage(ImageSource.camera);
                                  },
                                  option2: () {
                                    Navigator.of(context).pop();
                                    cubit.uploadImage(ImageSource.gallery);
                                  },

                                );
                              },
                              icon: Icon(FontAwesomeIcons.cameraRetro, color: Colors.white54,)

                          ),
                        ),
                        Positioned(
                            top: 20.h,
                            left: 20.w,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment
                                  .start,
                              crossAxisAlignment: CrossAxisAlignment
                                  .start,
                              children:
                              [
                                Text(
                                  'Good Morning,',
                                  style: Theme
                                      .of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700
                                  ),

                                ),
                                 Text(
                                  'Mohamed',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w600
                                  ),
                                ),
                              ],
                            )
                        ),
                        Positioned(
                          bottom: 20.h,
                          left: 20.w,
                          child: Text(
                            'Mom & baby ',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w600
                            ),
                          ),
                        ),
                        Positioned(
                          right: 50.w,
                          left: 50.w,
                          top: -50.h,
                          child: pressedProfileImage(
                            assetsImage: AssetImage(img + 'b5.jpg'),
                            radius: 50.r,
                            outSideColor: Colors.white,
                            onTap: () {
                              navigateTo(context, ChildScreen());
                            },


                          ),
                        ),
                      ],
                    ),
                  ),
                   SizedBox(
                    height: h*.04,
                  ),
                  Container(
                    height: size.height*.4,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.r),
                        color: Colors.white,
                        boxShadow:  [
                          BoxShadow(
                              blurRadius: 8.r,
                              color: Colors.black26
                          )
                        ]
                    ),
                    child: Stack(
                        children:
                        [
                          Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(16.0.r),
                                child: Row(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          'Routine',
                                          style: TextStyle(
                                            fontSize: 24.sp,
                                            fontWeight: FontWeight.bold,
                                          ),

                                        ),
                                        SizedBox(width: w*.11,),
                                        ElevatedButton(
                                          onPressed: (){
                                            cubit.changeBottom(3);
                                          },
                                          style: ElevatedButton.styleFrom(
                                            foregroundColor: Colors.white,
                                            backgroundColor: Colors.teal,
                                            elevation: 0,
                                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
                                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                            padding: const EdgeInsets.all(10.0),
                                            textStyle: const TextStyle(fontSize: 18),

                                          ),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                  'add some Actions'),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Icon(
                                                  FontAwesomeIcons.heartCirclePlus
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),),
                              ConditionalBuilder(
                                condition: listOfEvents.isNotEmpty,
                                builder: (BuildContext context)=> Expanded(
                                  child: ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: listOfEvents.length,
                                      itemBuilder: (context, i) {
                                        return Stack(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.all(30.sp),
                                              child: Row(
                                                children: [
                                                  SizedBox(width: size.width * 0.1),
                                                  SizedBox(
                                                    child: Text(listOfEvents[i].time),
                                                    width: size.width * 0.2,
                                                  ),
                                                  SizedBox(
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Text(listOfEvents[i].eventName),
                                                        Text(
                                                          listOfEvents[i].description,
                                                          style: TextStyle(
                                                              color: Colors.grey, fontSize: 12.sp),
                                                        )
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Positioned(
                                              left: 37.w,
                                              child:  Container(
                                                height: size.height * 0.7,
                                                width: 1.0,
                                                color: Colors.grey.shade400,
                                              ),
                                            ),
                                            Positioned(
                                              bottom: 5.h,
                                              child: Padding(
                                                padding:  EdgeInsets.all(30.0.sp),
                                                child: Container(
                                                  height: 14.0.h,
                                                  width: 14.w,
                                                  decoration: new BoxDecoration(
                                                    color: listOfColors[random.nextInt(3)],
                                                    borderRadius: BorderRadius.circular(14.r),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        );
                                      }),
                                ),
                                fallback: (BuildContext context) => Center(child: CircularProgressIndicator(color: Colors.red,)),),
                            ],
                          ),
                        ]
                    ),
                  ),

                ],
              ),
            ),
          ),

        );
      },);
  }
}
class Constants {
  static const kPurpleColor = Color(0xFFB97DFE);
  static const kRedColor = Color(0xFFFE4067);
  static const kGreenColor = Color(0xFFADE9E3);
}