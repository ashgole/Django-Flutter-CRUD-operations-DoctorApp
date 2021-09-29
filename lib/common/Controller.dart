import 'package:get/get_state_manager/src/simple/get_controllers.dart';

var serversite = 'http://192.168.43.58:8000/';

class ControllerPage extends GetxController {
  String authtoken;
  void setToken(token) {
    print('*' * 20);
    print(token);
    authtoken = 'Bearer ' + token;
    update();
  }
}
