//https://pub.dev/packages/syncfusion_flutter_charts/example

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

Widget chart(title, timeArray, recordArray) {
  List<Record> dataL = [];
  for (int i = 0; i < timeArray.length; i++) {
    dataL.add(Record(timeArray[i], recordArray[i]));
  }
  return SfCartesianChart(
      primaryXAxis: CategoryAxis(),
      // title: ChartTitle(text: '$title'),
      // legend: Legend(isVisible: true, title: LegendTitle(text: "$title")),
      tooltipBehavior: TooltipBehavior(enable: true),
      series: <ChartSeries>[
        LineSeries<Record, String>(
            name: '$title',
            color: Colors.red,
            xAxisName: 'Dates',
            yAxisName: 'Values',
            dataSource: dataL,
            xValueMapper: (Record value, _) => value.time.toString(),
            yValueMapper: (Record value, _) => value.r2),
      ]);
}

class Record {
  Record(this.time, this.r2);
  final int time;
  final int r2;
}
