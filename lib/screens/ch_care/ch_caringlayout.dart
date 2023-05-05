
import 'package:flutter/material.dart';

import 'ch_crying.dart';
import 'ch_sleep.dart';
import 'ch_sleepingdata.dart';


class ChildrenCareScreen extends StatelessWidget {
  const ChildrenCareScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Caring"),
          bottom:  const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.local_fire_department, color: Colors.blueGrey,) ,
                child: Text(
                    'cry',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Tab(
                icon: Icon(Icons.bedtime_rounded,color: Colors.blueGrey) ,
                child: Text('Sleep',

                  style: TextStyle(color: Colors.black),
                ),

              ),
              Tab(
                icon: Icon(Icons.table_chart, color: Colors.blueGrey) ,
                child: Text('Summary',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],

          ),
        ),
        body:  TabBarView(
          children: [
            CryScreen(),
            SleepScreen(),
            SummaryScreen(),
          ],

        ),
      ),
    );
  }
}
