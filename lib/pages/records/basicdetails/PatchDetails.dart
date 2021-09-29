import 'package:doctorapp/api/API.dart';
import 'package:doctorapp/common/CWidget.dart';
import 'package:doctorapp/common/SnapConditions.dart';
import 'package:flutter/material.dart';

final nameR = RegExp(r'^[a-zA-Z]+$');
final String nameU = 'use  a-z | A-Z';
TextEditingController ctd = TextEditingController();
TextEditingController ctt = TextEditingController();
TextEditingController ctr = TextEditingController();

class PatchDetails extends StatefulWidget {
  @override
  _PatchDetailsState createState() => _PatchDetailsState();
}

class _PatchDetailsState extends State<PatchDetails> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Update Basic Details')),
      body: Form(
          key: _formKey,
          child:
              ListView(padding: const EdgeInsets.all(15), children: [show()])),
    );
  }

  Widget show() {
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
              return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Covid Test Done ? '),
                    tf(ctd, data['covid_test_done'].toString(), nameR, nameU),
                    Text('Covid Test Type'),
                    tf(ctt, data['covid_test_type'].toString(), nameR, nameU),
                    Text('Covid Test Report'),
                    tf(ctr, data['covid_test_report'].toString(), nameR, nameU),
                    button('Update', patch),
                  ]);
            } catch (e) {
              print(e);
              return Center(child: Text('Something went wrong...'));
            }
          }
          return snapNoConnection(context);
        });
  }
}

patch() {
  Map data = {
    'covid_test_done': ctd.text,
    'covid_test_type': ctt.text,
    'covid_test_report': ctr.text
  };
  patchData('besicdetails/1/', data);
}
