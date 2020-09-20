import 'package:alramNotification_app/Screens/clock_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Clockpage extends StatefulWidget {
  @override
  _ClockpageState createState() => _ClockpageState();
}

class _ClockpageState extends State<Clockpage> {
  @override
  Widget build(BuildContext context) {
    @override
    var now = DateTime.now();
    var formattedTime = DateFormat('HH:mm').format(now);
    var formattedDate = DateFormat('EEE, d MMM').format(now);
    var timezoneString = now.timeZoneOffset.toString().split('.').first;
    var offsetSign = '';
    if (!timezoneString.startsWith('-')) offsetSign = '+';
    print(timezoneString);
    return Column(
      children: [
        Column(
          children: [
            Text(formattedTime, style: Theme.of(context).textTheme.headline3),
            Text(
              formattedDate,
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
          ],
        ),
        SizedBox(
          height: 15.0,
        ),
        ClockView(
          size: 280,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          "Timezone",
          style: TextStyle(color: Colors.white, fontSize: 20.0),
        ),
        SizedBox(
          height: 8.0,
        ),
        Row(
          children: [
            Icon(
              Icons.language,
              size: 20.0,
              color: Colors.white,
            ),
            SizedBox(
              width: 15.0,
            ),
            Text(
              "UTC" + offsetSign + timezoneString,
              style: TextStyle(color: Colors.white, fontSize: 13.0),
            ),
          ],
        ),
      ],
    );
  }
}
