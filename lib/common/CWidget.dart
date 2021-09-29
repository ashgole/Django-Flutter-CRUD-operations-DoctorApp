import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

Widget lt(title, subtitle) {
  return ListTile(
      title: Text(title.toString()), subtitle: Text(subtitle.toString()));
}

Widget tf(c2, name, reg, use) {
  return Container(
    margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
    child: FormBuilderTextField(
        controller: c2,
        // initialValue: iv2,
        maxLength: 15,
        name: name,
        keyboardType:
            name == 'Phone no' ? TextInputType.number : TextInputType.text,
        textInputAction: TextInputAction.next,
        decoration: new InputDecoration(
            labelText: name,
            contentPadding: EdgeInsets.all(10),
            border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(5.0),
                borderSide: new BorderSide(color: Colors.blue))),
        validator: (value) {
          if (value.isEmpty) {
            return "Please enter $name";
          }
          if (reg.hasMatch(value)) {
          } else {
            return use;
          }
          return null;
        }),
  );
}

//--okbutton
button(name, function) {
  return ElevatedButton(
    child: Text(name, style: TextStyle(fontSize: 15)),
    onPressed: () => function(),
    // Perform some action
  );
}

Widget d() {
  return Divider(thickness: 1.0);
}

Widget tf2(c2, name, reg, use, type) {
  return Container(
    margin: const EdgeInsets.all(5.0),
    child: FormBuilderTextField(
        controller: c2,
        // initialValue: iv2,
        maxLength: 20,
        name: name,
        keyboardType: type,
        textInputAction: TextInputAction.next,
        decoration: new InputDecoration(
            labelText: name,
            contentPadding: EdgeInsets.all(10),
            border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(5.0),
                borderSide: new BorderSide(color: Colors.blue))),
        validator: (value) {
          if (value.isEmpty) {
            return "Please enter $name";
          }
          if (reg.hasMatch(value)) {
          } else {
            return use;
          }
          return null;
        }),
  );
}

//--oksnack
succesSnack(title, subtitle) {
  Get.snackbar(
    title,
    subtitle,
    colorText: Colors.white,
    backgroundColor: Colors.black,
    snackPosition: SnackPosition.TOP,
    borderRadius: 5.0,
    margin: const EdgeInsets.all(10),
    duration: const Duration(milliseconds: 2000),
  );
}

failedSnack(title, subtitle) {
  Get.snackbar(
    title,
    subtitle,
    colorText: Colors.white,
    backgroundColor: Colors.red,
    borderRadius: 5.0,
    snackPosition: SnackPosition.TOP,
    margin: const EdgeInsets.all(10),
    duration: const Duration(milliseconds: 1000),
  );
}

// errorsnack(title, subtitle) {
//   Get.snackbar(
//     title,
//     subtitle,
//     colorText: Colors.white,
//     backgroundColor: Colors.redAccent,
//     snackPosition: SnackPosition.TOP,
//     borderRadius: 5.0,
//     margin: const EdgeInsets.all(10),
//     duration: const Duration(milliseconds: 2000),
//   );
// }

// Widget datetimeW(setdate, type) {
//   return Container(
//       margin: const EdgeInsets.all(5.0),
//       child: FormBuilderDateTimePicker(
//         name: 'date',
//         inputType: type,
//         decoration: InputDecoration(
//             labelText: 'Select The Date',
//             border: new OutlineInputBorder(
//               borderRadius: new BorderRadius.circular(15.0),
//             )),
//         onChanged: (value) {
//           setdate(value.toString());
//         },
//         validator: (value) {
//           if (value == null) {
//             return "Please select date";
//           }
//           return null;
//         },
//       ));
// }

// Widget chip(title, page) {
//   return InkWell(
//     onTap: () => Get.to(page),
//     child: Container(
//       margin: const EdgeInsets.fromLTRB(5, 0, 0, 0),
//       child: Chip(
//           elevation: 3,
//           padding: const EdgeInsets.all(5),
//           backgroundColor: Colors.blue,
//           avatar: CircleAvatar(
//             backgroundColor: Colors.white,
//             child: Icon(
//               Icons.edit,
//               size: 15,
//               color: Colors.blue,
//             ),
//           ),
//           label: Text(
//             title,
//             style: TextStyle(
//               fontSize: 15,
//               color: Colors.white,
//             ),
//           )),
//     ),
//   );
// }
