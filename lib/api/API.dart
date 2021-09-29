// https://flutter.dev/docs/cookbook#networking
import 'dart:convert';
import 'package:doctorapp/common/CWidget.dart';
import 'package:doctorapp/common/Controller.dart';
import 'package:doctorapp/pages/Home.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

final controller = Get.put(ControllerPage());
final ControllerPage ctrl = Get.find();

loginData(url, data) async {
  print('--login--' * 5);
  final response = await http.post(
    Uri.parse(serversite + url),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(data),
  );
  final responseJson = jsonDecode(response.body);
  if (response.statusCode == 200) {
    succesSnack('success', 'Signin successfully');
    controller.setToken(responseJson['access']);
    Get.off(Home());
  } else {
    failedSnack('success', 'Failed to Post');
  }
}

getData(url) async {
  print('+--get--' * 5);
  final response = await http.get(
    Uri.parse(serversite + url),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      "Authorization": ctrl.authtoken,
    },
  );
  final responseJson = jsonDecode(response.body);
  if (response.statusCode == 200) {
    return responseJson;
  } else {
    failedSnack('success', 'Failed to load');
  }
}

postData(url, data) async {
  print('--post--' * 5);
  final response = await http.post(
    Uri.parse(serversite + url),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      "Authorization": ctrl.authtoken,
    },
    body: jsonEncode(data),
  );
  if (response.statusCode == 200) {
    succesSnack('success', 'Posted successfully');
    return null;
  } else {
    failedSnack('success', 'Failed to Post');
  }
}

patchData(url, data) async {
  print('--patch--' * 5);
  final response = await http.patch(
    Uri.parse(serversite + url),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      "Authorization": ctrl.authtoken,
    },
    body: jsonEncode(data),
  );
  if (response.statusCode == 200) {
    succesSnack('success', 'Updated successfully');
    return null;
  } else {
    failedSnack('success', 'Failed to Update');
  }
}
