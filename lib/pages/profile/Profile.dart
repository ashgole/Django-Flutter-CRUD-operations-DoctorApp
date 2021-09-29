import 'package:doctorapp/api/API.dart';
import 'package:doctorapp/common/CWidget.dart';
import 'package:doctorapp/common/SnapConditions.dart';
import 'package:doctorapp/pages/profile/EditProfile.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Profile')),
        body: ListView(
          children: [
            profileBox(context, 'ashabb', 'ashgole@gmail.com'),
            profilleData(),
          ],
        ));
  }
}

//--*
Widget profileBox(
  context,
  name,
  email,
) {
  return Container(
      color: Colors.green,
      padding: const EdgeInsets.all(5),
      height: 180,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: CircleAvatar(
              radius: 50.0,
              backgroundImage: Image.asset('assets/images/profile.png').image,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(0),
            child: Column(
              children: [
                Text('$name',
                    style: TextStyle(color: Colors.white, fontSize: 18)),
                Text('$email',
                    style: TextStyle(
                      color: Colors.white,
                    )),
              ],
            ),
          ),
        ],
      ));
}

Widget profilleData() {
  return FutureBuilder<dynamic>(
      future: getData('u/profile/1/'),
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
              lt('Username', data['username'].toString()),
              d(),
              lt('Firstname:', data['first_name'].toString()),
              d(),
              lt('Lastname:', data['last_name'].toString()),
              d(),
              lt('Email:', data['email'].toString()),
              d(),
              ElevatedButton(
                child: Text('Update Profile', style: TextStyle(fontSize: 15)),
                onPressed: () => gottoEditProfile(context),
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

gottoEditProfile(context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => EditProfile(),
    ),
  );
}
