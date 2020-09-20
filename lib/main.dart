import 'package:alramNotification_app/Screens/enum.dart';
import 'package:alramNotification_app/Screens/menu_info.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';
import 'package:alramNotification_app/Screens/home_page.dart';
import 'package:flutter/material.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var initializationSettingAndroid =
      AndroidInitializationSettings('codex-logo');
  var initializationSettingIOS = IOSInitializationSettings(
    requestAlertPermission: true,
    requestBadgePermission: true,
    requestSoundPermission: true,
    onDidReceiveLocalNotification:
        (int id, String title, String body, String payload) async {},
  );
  var initializationSettings = InitializationSettings(
      initializationSettingAndroid, initializationSettingIOS);
  await flutterLocalNotificationsPlugin.initialize(
    initializationSettings,
    onSelectNotification: (String payload) async {
      if (payload != null) {
        debugPrint('notification playload:' + payload);
      }
    },
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: TextTheme(
          headline1: TextStyle(
              fontSize: 30.0, fontWeight: FontWeight.bold, color: Colors.white),
          headline3: TextStyle(
              fontSize: 40.0, fontWeight: FontWeight.w300, color: Colors.white),
          headline4: TextStyle(
              fontSize: 27.0, color: Colors.white, fontWeight: FontWeight.w500),
          headline5: TextStyle(fontSize: 10.0, color: Colors.white),
          headline6: TextStyle(
              fontSize: 18.0, color: Colors.white, fontWeight: FontWeight.w800),
        ),
      ),
      home: ChangeNotifierProvider<MenuInfo>(
        create: (context) => MenuInfo(Menutype.clock),
        child: HomePage(),
      ),
    );
  }
}
