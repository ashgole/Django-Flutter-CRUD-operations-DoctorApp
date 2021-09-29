import 'package:doctorapp/api/API.dart';
import 'package:doctorapp/common/SnapConditions.dart';
import 'package:doctorapp/pages/records/dailyrecords/Chart.dart';
import 'package:flutter/material.dart';

Widget getRecord(recordId) {
  return FutureBuilder<dynamic>(
      future: getData('dailyrecords/1/'),
      builder: (BuildContext context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return snapWaiting(context);
        } else if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return snapError();
          } else if (!snapshot.hasData || snapshot.data?.length == 0) {
            return snapNoData(context);
          }
        }
        if (snapshot.hasData) {
          try {
            var data = snapshot.data;
            var recordArray1 =
                data.where((e) => e['recordname_id'] == recordId).toList();
            List<int> recordArray = [];
            List<int> timeArray = [];
            for (int i = 0; i < recordArray1.length; i++) {
              recordArray.add(recordArray1[i]['value']);
              timeArray
                  .add(int.parse(recordArray1[i]['datetime'].substring(8, 10)));
            }

            return SingleChildScrollView(
                child: Column(
              children: [
                Container( padding: const EdgeInsets.all(10),
                    height: MediaQuery.of(context).size.height / 100 * 30,
                    child: chart('Blood Pressure', timeArray, recordArray)),
                Container(
                    padding: const EdgeInsets.all(10),
                    height: MediaQuery.of(context).size.height / 100 * 50,
                    child: ListView.builder(
                      itemCount: timeArray.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(timeArray[index].toString()),
                            Text(recordArray[index].toString()),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.edit),
                              color: Colors.black,
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.delete),
                              color: Colors.black,
                            ),
                          ],
                        );
                      },
                    )),
              ],
            ));
          } catch (e) {
            print(e);
            return Center(child: Text('Something went wrong...'));
          }
        }
        return snapNoConnection(context);
      });
}
