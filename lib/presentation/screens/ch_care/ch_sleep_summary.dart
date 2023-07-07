import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import '../../../cubit/ch_cubit/ch_cubit.dart';
import '../../../cubit/ch_cubit/states.dart';
import '../../../models/sleep_chart.dart';

class CrySummaryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return BlocBuilder<ChildrenAppCubit, ChildrenAppStates>(
      builder: (context, state) {
        final cubit = ChildrenAppCubit.get(context);
        final selectedDate = cubit.getSelectedDate();
        return Scaffold(
            body: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Container(
                        height: 250,
                        child: SfCartesianChart(
                          primaryXAxis: CategoryAxis(),
                          title: ChartTitle(text: 'Half yearly sales analysis'),
                          series: <LineSeries<SalesData, String>>[
                            LineSeries<SalesData, String>(
                              dataSource: <SalesData>[
                                SalesData(selectedDate, 35),
                                SalesData('m', 28),
                                SalesData('z', 34),
                                SalesData('y', 32),
                                SalesData('selectedDate', 40)
                              ],
                              xValueMapper: (SalesData sales, _) => sales.year,
                              yValueMapper: (SalesData sales, _) => sales.sales,
                              dataLabelSettings:
                                  DataLabelSettings(isVisible: true),
                            ),
                          ],
                          legend: Legend(isVisible: true),
                          zoomPanBehavior: ZoomPanBehavior(
                            enableDoubleTapZooming: true,
                            enablePinching: true,
                          ),
                        )),
                    Container(
                      height: 200,
                      child: SfLinearGauge(
                        maximum: 50,
                        minimum: 0,
                      ),
                    )
                  ],
                )));
      },
    );
  }
}
