import 'package:doctorapp/api/API.dart';
import 'package:doctorapp/common/CWidget.dart';
import 'package:doctorapp/common/SnapConditions.dart';
import 'package:flutter/material.dart';

final nameR = RegExp(r'^[a-zA-Z]+$');
final String nameU = 'use  a-z | A-Z';
TextEditingController username = TextEditingController();
TextEditingController firstName = TextEditingController();
TextEditingController lastName = TextEditingController();
TextEditingController email = TextEditingController();

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Update Profile')),
      body: Form(
          key: _formKey,
          child:
              ListView(padding: const EdgeInsets.all(15), children: [show()])),
    );
  }
}

Widget show() {
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
              tf(username, data['username'].toString(), nameR, nameU),
              tf(firstName, data['first_name'].toString(), nameR, nameU),
              tf(lastName, data['last_name'].toString(), nameR, nameU),
              tf2(email, data['email'].toString(), nameR, nameU,
                  TextInputType.emailAddress),
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

patch() {
  Map data = {
    "username": username.text,
    "first_name": firstName.text,
    "last_name": lastName.text,
    "email": email.text,
  };
  patchData('u/profile/1/', data);
}
