import 'package:alramNotification_app/Screens/enum.dart';
import 'package:alramNotification_app/Screens/menu_info.dart';
import 'package:alramNotification_app/constants/custom_colors.dart';
import 'package:alramNotification_app/model/alram_info.dart';

List<MenuInfo> menuItems = [
  MenuInfo(
    Menutype.clock,
    title: "Clock",
    image: 'assets/clock1.png',
  ),
  MenuInfo(
    Menutype.alram,
    title: "Alarm",
    image: 'assets/alarm1.png',
  ),
  MenuInfo(Menutype.timer, title: "Timer", image: 'assets/timer1.png'),
  MenuInfo(Menutype.stopwatch,
      title: "StopWatch", image: 'assets/stopwatch1.png'),
];

List<AlarmInfo> alarms = [
  AlarmInfo(DateTime.now().add(Duration(hours: 1)),
      description: 'Office', gradientcolors: GradientColors.sky),
  AlarmInfo(DateTime.now().add(Duration(hours: 2)),
      description: 'Learn Flutter', gradientcolors: GradientColors.sunset),
];
