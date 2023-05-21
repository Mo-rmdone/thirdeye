
import 'package:flutter/material.dart';
import 'package:thirdeye/shared/styles/colors.dart';

import '../../ch_widgets/items.dart';
import 'ch_crying.dart';
import 'ch_sleep_summary.dart';
import 'ch_sleep.dart';


class ChildrenCareScreen extends StatelessWidget {
  const ChildrenCareScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:  SafeArea(
        child: DefaultTabController(
          length: 3,
          child: Column(
            children: [
              Container(
                height: 60,
                padding: const EdgeInsets.all(10),
                child:  TabBar(
                  physics: const ClampingScrollPhysics(),
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.black,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.black, width:1)

                  ),
                  tabs:   [
                    tabWidget('Cry'),
                    tabWidget('Sleep'),
                    tabWidget('Summary'),

                  ],

                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    CryScreen(),
                    SleepScreen(),
                    SummaryScreen(),
                  ],

                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
