import 'package:doctorapp/pages/records/dailyrecords/GetRecord.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'PostDailyrecord.dart';

class DailyRecords extends StatefulWidget {
  DailyRecords({Key key}) : super(key: key);

  @override
  _DailyRecordsState createState() => _DailyRecordsState();
}

class _DailyRecordsState extends State<DailyRecords> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: MaterialApp(
            debugShowCheckedModeBanner: false,
            home: DefaultTabController(
                length: 4,
                child: Scaffold(
                  appBar: AppBar(
                      title: Text('Daily Records'),
                      actions: [
                        IconButton(
                          tooltip: 'Add Daily Records',
                          icon: Icon(Icons.add),
                          onPressed: () {
                            Get.to(
                              PostDailyrecord(),
                            );
                          },
                        ),
                      ],
                      bottom: TabBar(
                        isScrollable: true,
                        labelPadding: EdgeInsets.all(15),
                        tabs: [
                          Text('BP',
                              style: Theme.of(context).textTheme.subtitle2),
                          Text('Pulse Rate',
                              style: Theme.of(context).textTheme.subtitle2),
                          Text('Respiration Rate',
                              style: Theme.of(context).textTheme.subtitle2),
                          Text('Body Temperature',
                              style: Theme.of(context).textTheme.subtitle2),
                        ],
                      )),
                  body: TabBarView(
                    children: [
                      getRecord(1),
                      getRecord(2),
                      getRecord(3),
                      getRecord(4),
                    ],
                  ),
                ))));
  }
}
