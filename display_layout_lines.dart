import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart';
import 'package:training_bloc/flutter_bloc/bloc/cubit.dart';
import 'package:training_bloc/src/app.dart';
import 'package:training_bloc/testing_classes/rx_dart_subjects.dart';

void main() async {
  runApp(MyApp());

  debugPaintSizeEnabled = true;
}
