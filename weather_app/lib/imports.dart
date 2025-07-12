export 'package:flutter/src/widgets/framework.dart';
export 'package:flutter/src/widgets/placeholder.dart';
export 'package:flutter/material.dart';
export 'package:geolocator/geolocator.dart';
import 'package:geolocator/geolocator.dart';
export 'dart:convert';
export 'dart:async';



export 'package:weather_app/page_scaffold.dart';

export '../widgets/datetotext.dart';
export '../widgets/buildtext.dart';
export '../widgets/buildday.dart';
export '../elements/weathertile.dart';
export '../elements/listtile.dart';


late final Future<Map<String, dynamic>>? futureWeather;
bool farenheit = false;
late Position pos;
