import 'package:doctorapp/api/API.dart';
import 'package:doctorapp/common/CWidget.dart';
import 'package:doctorapp/common/SnapConditions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'PatchDetails.dart';

class GetBasicDetails extends StatefulWidget {
  @override
  _GetBasicDetailsState createState() => _GetBasicDetailsState();
}

class _GetBasicDetailsState extends State<GetBasicDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Basic Details')),
        body: ListView(
          children: [
            profilleData(),
          ],
        ));
  }
}

Widget profilleData() {
  return FutureBuilder<dynamic>(
      future: getData('besicdetails/1/'),
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
            return Column(children: [
              lt('Covid Test Done', data['covid_test_done'].toString()),
              d(),
              lt('Covid Test Type:', data['covid_test_type'].toString()),
              d(),
              lt('Covid Test Report:', data['covid_test_report'].toString()),
              ElevatedButton(
                child: Text('Update Basic Details',
                    style: TextStyle(fontSize: 15)),
                onPressed: () => Get.to(PatchDetails()),
                // Perform some action
              ),
            ]);
          } catch (e) {
            print(e);
            return Center(child: Text('Something went wrong...'));
          }
        }
        return snapNoConnection(context);
      });
}
