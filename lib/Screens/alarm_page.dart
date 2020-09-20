import 'package:dotted_border/dotted_border.dart';
import 'package:alramNotification_app/Screens/data.dart';
//import 'package:alramNotification_app/model/alram_info.dart';
import 'package:flutter/material.dart';

class AlarmPage extends StatefulWidget {
  @override
  _AlarmPageState createState() => _AlarmPageState();
}

class _AlarmPageState extends State<AlarmPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text("Alarm", style: Theme.of(context).textTheme.headline1),
          Expanded(
            child: ListView(
              children: alarms.map<Widget>((alarm) {
                return Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  margin: EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: alarm.gradientcolors),
                    boxShadow: [
                      BoxShadow(
                          color: alarm.gradientcolors.last.withOpacity(0.4),
                          blurRadius: 4,
                          spreadRadius: 2,
                          offset: Offset(4, 4)),
                    ],
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.label,
                                color: Colors.white,
                                size: 30.0,
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Text("Office",
                                  style: Theme.of(context).textTheme.headline5),
                            ],
                          ),
                          Switch(
                            value: true,
                            onChanged: (bool value) {},
                            activeColor: Colors.white,
                          ),
                        ],
                      ),
                      Text(
                        "Sun-Fri",
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      Row(
                        children: [
                          Text(
                            "5:00 AM",
                            style: Theme.of(context).textTheme.headline4,
                          ),
                          Icon(
                            Icons.keyboard_arrow_down,
                            size: 25,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }).followedBy([
                DottedBorder(
                  strokeWidth: 2,
                  color: Colors.white,
                  borderType: BorderType.RRect,
                  radius: Radius.circular(32),
                  dashPattern: [4, 5],
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white10,
                      borderRadius: BorderRadius.all(Radius.circular(32)),
                    ),
                    child: Column(
                      children: [
                        FlatButton(
                          onPressed: () {},
                          padding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20.0),
                          child: Icon(
                            Icons.add_alarm,
                            size: 30.0,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "Add a Alram",
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ],
                    ),
                  ),
                )
              ]).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
