import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:thirdeye/cubit/ch_cubit/ch_cubit.dart';
import 'package:thirdeye/cubit/ch_cubit/states.dart';
import '../../ch_widgets/homescreenbar.dart';
import '../../ch_widgets/items.dart';
import '../../ch_widgets/sidebar/menu.dart';
import '../../shared/components/components.dart';
import '../../shared/components/constants.dart';
import '../action.dart';
import '../children/child.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: HomeScreenBar(),),
      drawer: SideMenu(),
      body: BlocConsumer<ChildrenAppCubit, ChildrenAppStates>(
           listener: (context, state) {},
            builder: (context, state) {
             var cubit = ChildrenAppCubit.get(context);
             File? _img = ChildrenAppCubit.get(context).image;
              return SingleChildScrollView(
                  child: Padding(
                    padding:  const EdgeInsets.all(20.0),
                      child: Column(
                        children:
                         [
                           const SizedBox(
                             height: 25,
                           ),
                           InkWell(
                               onDoubleTap: () {
                                 showAlertDialog(
                                   context: context,
                                   titleOption1: 'camera',
                                   titleOption2: 'gallery',
                                   option1: ()
                                     {
                                       Navigator.of(context).pop();
                                       cubit.uploadImage(ImageSource.camera);
                                     },
                                   option2: ()
                                   {
                                     Navigator.of(context).pop();
                                     cubit.uploadImage(ImageSource.gallery);
                                   },

                                 );
                             },
                               child: Container(
                                 height: 200,
                                 width: double.infinity,
                                 decoration: BoxDecoration(
                                     borderRadius: BorderRadius.circular(20),
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
                                         top: 10,
                                         left: 10,
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
                                             const Text(
                                               'Mohamed',
                                               style: TextStyle(
                                                   color: Colors.white,
                                                   fontSize: 20,
                                                   fontWeight: FontWeight.w600
                                               ),
                                             ),
                                           ],
                                         )
                                     ),
                                     Positioned(
                                       bottom: 10,
                                       left: 30,
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
                                       right: 50,
                                       left: 50,
                                       top: -50,
                                       child: pressedProfileImage(
                                         assetsImage: AssetImage(img + 'b5.jpg'),
                                         radius: 50,
                                         outSideColor: Colors.white,
                                         onTap: () {
                                           navigateTo(context, ChildScreen());
                                         },


                                       ),
                                     ),
                                   ],
                                 ),
                               )),
                           const SizedBox(
                             height: 30,
                           ),
                           activityBloc(context, 'B5F1CC', icon+'food.jpg','food' ),
                           SizedBox(height: 10,),
                           activityBloc(context, '192b70', icon+'sleep.png','sleep' ),
                           SizedBox(height: 10,),
                           activityBloc(context, 'FEA1A1',icon+'nappy.png', 'nappy' ),
                           const SizedBox(
                             height: 30,
                           ),
                           Container(
                             height: 180,
                             width:double.infinity ,
                             decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(15),
                               boxShadow: const [BoxShadow(
                                 blurRadius: 6,
                                 color: Colors.black26
                               )],
                               color: Colors.white//.withOpacity(.95),
                             ),
                             child: Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children:  [
                                  Padding(
                                   padding: const EdgeInsets.all(16.0),
                                   child: Row(
                                     children:  const [
                                       Text(
                                         'Alerts',
                                         style: TextStyle(
                                           fontSize: 24,
                                           fontWeight: FontWeight.bold,
                                         ),

                                       ),
                                       Spacer(),
                                       Text(
                                         'Number of Meeting 5',
                                         style: TextStyle(
                                         ),

                                       ),
                                     ],
                                   ),),
                                 Expanded(
                                   child: ListView.separated(
                                     itemCount: 5,
                                     physics: const BouncingScrollPhysics(),
                                     itemBuilder: (BuildContext context, int index) {
                                       return ListTile(
                                         hoverColor: Colors.green,
                                         leading: const CircleAvatar(
                                           backgroundImage: AssetImage('assets/images/d1.jpg'),

                                         ),
                                         title: const Text('Doctor Meeting'),
                                         subtitle: const Text('This meeting at 9 p.m.'),
                                         trailing: const Icon(Icons.watch_later),
                                         onTap: ()
                                         {
                                         },
                                       );
                                     },
                                     separatorBuilder: (BuildContext context, int index) => myDivider(),
                                   ),
                                 ),

                               ],

                             )
                           ),
                           const SizedBox(
                           height: 30,
                         ),
                           Container(
                               height: 200,
                               width: double.infinity,
                               decoration: BoxDecoration(
                                 borderRadius: BorderRadius.circular(15),
                                 color: Colors.white,
                                 boxShadow: const [
                                   BoxShadow(
                                     blurRadius: 8,
                                     color: Colors.black26
                                   )
                                 ]
                               ),
                               child: Stack(
                                 children: [
                                   Column(
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children:  [
                                       Padding(
                                         padding: const EdgeInsets.all(16.0),
                                         child: Row(
                                           children:   const [
                                             Text(
                                               'Routine',
                                               style: TextStyle(
                                                 fontSize: 24,
                                                 fontWeight: FontWeight.bold,
                                               ),

                                             ),
                                           ],
                                         ),),
                                       Expanded(
                                         child: ListView.builder(
                                           itemCount: 3,
                                           physics: const BouncingScrollPhysics(),
                                           itemBuilder: (BuildContext context, int index) {
                                             return Card(
                                               elevation: 4,
                                               margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                                               child: ListTile(
                                                 hoverColor: Colors.green,
                                                 leading: const CircleAvatar(
                                                   backgroundImage: AssetImage('assets/images/feed.jpg'),

                                                 ),
                                                 title: const Text('Feed'),
                                                 subtitle: const Text('Last action was at 9 p.m.'),
                                                 trailing: const Icon(Icons.fastfood),
                                                 onTap: ()
                                                 {
                                                 },
                                               ),
                                             );
                                           },
                                         ),
                                       ),

                                     ],

                                   ),

                                 ],
                               )
                           ),
                        ],
                      ),
                  ),
                );
            },
),
    );
  }
}
