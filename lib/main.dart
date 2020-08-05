import 'package:flutter/material.dart';
import 'package:world_time/pages/ChooseLocation.dart';
import 'package:world_time/pages/Loading.dart';
import "package:world_time/pages/home.dart";

void main() => runApp(MaterialApp(
    initialRoute: "/",
    routes: {
      "/": (context) => Loading(),
      "/home": (context) => Home(),
      "/location": (context) => ChooseLocation()
    }
  ));

