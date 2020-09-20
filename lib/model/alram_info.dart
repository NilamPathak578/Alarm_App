import 'package:flutter/cupertino.dart';

class AlarmInfo {
  DateTime alarmDateTime;
  String description;
  bool isactive;
  List<Color> gradientcolors;

  AlarmInfo(this.alarmDateTime, {this.description, this.gradientcolors});
}
