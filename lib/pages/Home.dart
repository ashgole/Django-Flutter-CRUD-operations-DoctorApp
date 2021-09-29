import 'package:doctorapp/pages/profile/Profile.dart';
import 'package:doctorapp/pages/records/basicdetails/GetBasicDetails.dart';
import 'package:doctorapp/pages/records/dailyrecords/DailyRecords.dart';
import 'package:doctorapp/pages/registration/Signin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Health Care')),
        body: GridView.count(
            physics:
                BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            padding: const EdgeInsets.all(20),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
            children: <Widget>[
              grid(context, 'fill2', GetBasicDetails(), 'Basic Details'),
              grid(context, 'sheet', DailyRecords(), 'Enter Daily Records'),
              grid(context, 'profile', Profile(), 'My Profile'),
            ]));
  }
}

Widget grid(context, pic, page, label) {
  return InkWell(
    onTap: () => Get.to(
      page,
    ),
    child: Card(
      elevation: 5,
      child: Container(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  decoration: new BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fitWidth,
                      image: Image.asset('assets/images/$pic.png').image,
                    ),
                  ),
                ),
              ),
              Text("$label"),
            ],
          )),
    ),
  );
}
