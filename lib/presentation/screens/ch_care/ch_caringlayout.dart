import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../ch_widgets/items.dart';
import '../../shared/styles/text_styles.dart';
import 'ch_crying.dart';
import 'ch_sleep_summary.dart';
import 'ch_sleep.dart';

class ChildrenCareScreen extends StatelessWidget {
  const ChildrenCareScreen({super.key});
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("Sleeping Behavior"),
        centerTitle: true,
      ),
      body: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            Container(
              height: h * .07,
              padding: EdgeInsets.all(5.sp),
              child: TabBar(
                isScrollable: true,
                physics: const ClampingScrollPhysics(),
                labelColor: Colors.white,
                labelStyle: infoCardStyle,
                unselectedLabelColor: Colors.black,
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.r),
                    color: Colors.black),
                tabs: [
                  tabWidget('Cry'),
                  tabWidget('Sleep'),
                  tabWidget('summary'),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  CryScreen(),
                  SleepScreen(),
                  CrySummaryScreen(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
