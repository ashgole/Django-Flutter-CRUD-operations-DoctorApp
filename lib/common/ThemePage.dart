import 'package:flutter/material.dart';

//--

ThemeData lightTheme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    primaryColor: Colors.blue,
    accentColor: Colors.blue,
    fontFamily: 'Georgia',
    appBarTheme: AppBarTheme(
      foregroundColor: Colors.white,
      backgroundColor: Colors.blue,
      iconTheme: IconThemeData(color: Colors.white),
      elevation: 5,
      titleTextStyle: TextStyle(
          color: Colors.white, fontSize: 20, fontWeight: FontWeight.normal),
    ),
    textTheme: TextTheme(
      headline1: TextStyle(
          color: Colors.black, fontSize: 17, fontWeight: FontWeight.normal),

      headline5: TextStyle(
          color: Colors.black, fontSize: 9, fontWeight: FontWeight.normal),

      //appbar listtile
      subtitle1: TextStyle(
          color: Colors.black, fontSize: 17, fontWeight: FontWeight.normal),
      //  appBar: AppBar(
      //   title: Text('My Doctor',
      //    style: Theme.of(context).textTheme.subtitle1),
      // ),
      //appbar listtile white
      subtitle2: TextStyle(
          color: Colors.white, fontSize: 17, fontWeight: FontWeight.normal),
      //caption
      headline6: TextStyle(
          color: Colors.blue, fontSize: 17, fontWeight: FontWeight.normal),
    ),
    //   buttonTheme: ButtonThemeData(
    //        buttonColor: Colors.blueAccent,
    //        shape: RoundedRectangleBorder(
    //                 borderRadius: new BorderRadius.circular(20.0),
    //               ),
    //        textTheme: ButtonTextTheme.accent,

    // ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
      // textStyle: MaterialStateProperty<TextStyle>. (
      // color: Colors.white, fontSize: 17, fontWeight: FontWeight.normal),
      shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
      foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
      padding: MaterialStateProperty.all<EdgeInsets>(
          EdgeInsets.fromLTRB(25, 10, 25, 10)),
      backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
    )),
    outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
      foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
      padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(10)),
    )),
    iconTheme: IconThemeData(
      color: Colors.black,
      size: 30,
    ),
    cardTheme: CardTheme(
        // color: Colors.blue[100],
        elevation: 5,
        margin: EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
            borderRadius: const BorderRadius.all(
          Radius.circular(15.0),
        ))),
  );
}
