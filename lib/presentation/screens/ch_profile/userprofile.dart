import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import '../../../cubit/ch_cubit/ch_cubit.dart';
import '../../../cubit/ch_cubit/states.dart';
import '../../ch_widgets/items.dart';

import '../../shared/components/constants.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});


  @override
  Widget build(BuildContext context) {
    final coverHeight = 200.0;
    final profileImage = 60.0;
    return BlocConsumer<ChildrenAppCubit, ChildrenAppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = ChildrenAppCubit.get(context);
        File? _img = ChildrenAppCubit.get(context).image;
        return SafeArea(
          child: Scaffold(
            body: ListView(
              shrinkWrap: true,
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.center,
                  children: [
                    Container(
                      color: Colors.grey,
                      height: coverHeight,
                      width: double.infinity,
                      child:cubit.image == null ? Image.asset(img + 'cover.jpg', fit: BoxFit.fill,)
                          : Image.file(cubit.image!)  ,
                    ),
                    Container(
                      width: double.infinity,
                      height: coverHeight,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.transparent, Color(0xFF111122)],
                        ),
                      ),
                    ),
                    Positioned(
                      top: coverHeight - profileImage,
                      left: 30,
                      child: pressedProfileImage(
                        assetsImage: _img  == null ?
                            AssetImage(img + 'elon.jpg'):
                            FileImage(_img) as ImageProvider

                        ,radius: profileImage,
                        onDoubleTap: ()
                        {
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
                        outSideColor: Colors.white,
                      ),

                    ),
                    Positioned(
                      bottom: 10,
                      right: 10,
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
                        icon: Icon(FontAwesomeIcons.cameraRetro, color: Colors.white,),

                      ),
                    )
                  ],
                ),
                SizedBox(height: profileImage,),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10,),
                      Text("Mohamed Ramadan",
                          style: GoogleFonts.mavenPro(
                            textStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 28,
                                 fontWeight: FontWeight.w600)
                          )

                      ),
                      SizedBox(height: 5,),
                      Text("My Kids is all my Life",
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: 20,
                              fontWeight: FontWeight.w600
                          )
                      ),
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          profileWindow(
                            backgroundColor: HexColor('FFEBEB'),
                            icon: FontAwesomeIcons.baby,
                            iconColor: Colors.black87,
                            iconSize: 40,
                            title: 'Number of Kids',
                            number: '00',),
                          profileWindow(
                            backgroundColor: HexColor('ADE4DB'),
                            icon: FontAwesomeIcons.userPlus,
                            iconColor: Colors.black,
                            iconSize: 40,
                            title: 'Following',
                            number: '00',),
                          profileWindow(
                            backgroundColor: HexColor('6DA9E4'),
                            icon: FontAwesomeIcons.wallet,
                            iconColor: HexColor('393053'),
                            iconSize: 40,
                            title: 'balance',
                            number: '00',),
                        ],
                      ),


                    ],
                  ),
                ),

                Row(
                  children: [
                    profileUserinfo(
                      icon: Icons.mail,
                      title: 'Email',
                      subTitle: "mohggfhfdghfgh@gmail.com"
                    ),
                    profileUserinfo(
                        icon: Icons.phone,
                        title: 'Phone',
                        subTitle: "01234567891"
                    )


                  ],
                ),
                Row(
                  children: [
                    profileUserinfo(
                        icon: Icons.location_on,
                        title: 'Address',
                        subTitle: "Cairo"
                    ),
                    profileUserinfo(
                        icon: Icons.phone,
                        title: 'Phone',
                        subTitle: "01234567891"
                    )


                  ],
                ),



              ],
            ),
          ),
        );
      },
    );
  }
}
