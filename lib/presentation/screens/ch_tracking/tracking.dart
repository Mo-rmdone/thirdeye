import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../ch_widgets/items.dart';
import '../../shared/components/constants.dart';
import 'doctor/doctor_layout.dart';
import 'feed_tracking/feeding_layout.dart';
import 'growth/growth_layout.dart';
import 'health/health_layout.dart';
import 'nappy/nappy_layout.dart';

class ChildrenTrackingScreen extends StatelessWidget {
  const ChildrenTrackingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width *.45;
    double height = MediaQuery.of(context).size.width *.45;
    double sizedBoxWidth = MediaQuery.of(context).size.width *.05;
    double sizedBoxHeight = MediaQuery.of(context).size.width *.05;
    List<Widget> list =
    [
      gridTile(path: img +  'feed.png', title: 'Feed', color:HexColor('95D6B4'),widget: FeedingLayout()),
      gridTile(path: icon + 'growth2.png',   title: 'Growth', color:HexColor('F7A2A5'),widget: GrowthLayout(),),
      gridTile(path: icon + 'health2.png',  title: 'Health', color:HexColor('E98BC0'),widget: HealthLayout(),),
      gridTile(path: icon + 'nap.png',  title: 'Nappy', color:HexColor('D0CE00'),widget: NappyScreen()),
      gridTile(path: icon + 'doctor.png',title: 'Doctor', color:HexColor('9AC9D6'),widget: DoctorLayout(),),
      gridTile(path: icon + 'memory.png',title: 'Memories', color:HexColor('247BA0'),widget: FeedingLayout(),),
    ];


    return  Scaffold(
      appBar: AppBar(
        title: Text("Behavior tracking"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: GridView.custom(
          gridDelegate: SliverWovenGridDelegate.count(
              pattern:
              [
                WovenGridTile(1,alignment:AlignmentDirectional.center,crossAxisRatio: 1 ),
                WovenGridTile(.7,crossAxisRatio:1 ),
              ],
              crossAxisCount: 2),
          childrenDelegate: SliverChildBuilderDelegate(
              childCount: list.length,
                  (context, index) =>
                  Padding(padding: EdgeInsets.all(8.sp),
                    child: list[index],
                  )),

        ),
      ),
    );
  }
}
