import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:thirdeye/ch_widgets/items.dart';

import '../../shared/components/constants.dart';

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
      gridTile(path: icon + 'feed.png', title: 'Feed', color:HexColor('95D6B4'),),
      gridTile(path: icon + 'b1.png',   title: 'data', color:HexColor('F7A2A5'),),
      gridTile(path: img + 'feed.png',  title: 'data', color:HexColor('B9CAD6'),),
      gridTile(path: icon + 'rec.png',  title: 'data', color:HexColor('6F93DB'),),
      gridTile(path: icon + 'sleep.png',title: 'data', color:HexColor('9AC9D6'),),
      gridTile(path: icon + 'sleep.png',title: 'data', color:HexColor('72CEE1'),),
    ];


    return  Scaffold(
      appBar: AppBar(),
      body: GridView.custom(
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
                Padding(padding: EdgeInsets.all(8),
                  child: list[index],
                )),

      ),
    );
  }
}
