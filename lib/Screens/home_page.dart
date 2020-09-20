import 'package:alramNotification_app/Screens/alarm_page.dart';
import 'package:alramNotification_app/Screens/clock_page.dart';
import 'package:alramNotification_app/Screens/data.dart';
import 'package:alramNotification_app/Screens/enum.dart';
import 'package:alramNotification_app/Screens/menu_info.dart';

//import 'package:alramNotification_app/Screens/clock_view.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF2D2F41),
        body: Container(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.only(left: 15.0, top: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: menuItems
                      .map(
                          (currentMenuInfo) => buildFlatButton(currentMenuInfo))
                      .toList(),
                ),
                Divider(
                  height: 10.0,
                  thickness: 4.0,
                  color: Color(0xFF2D2F49),
                ),
                Expanded(
                  // ignore: missing_required_param
                  child: Consumer<MenuInfo>(
                    builder:
                        (BuildContext context, MenuInfo value, Widget child) {
                      if (value.menutype == Menutype.clock)
                        return Clockpage();
                      else if (value.menutype == Menutype.alram)
                        return AlarmPage();
                      else
                        return Container(
                          color: Colors.white,
                          child: Center(
                            child: Text("HomePage"),
                          ),
                        );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildFlatButton(MenuInfo currentMenuInfo) {
    // ignore: missing_required_param
    return Consumer<MenuInfo>(
      builder: (BuildContext context, MenuInfo value, Widget child) {
        return Expanded(
          child: FlatButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(topRight: Radius.circular(12)),
            ),
            color: currentMenuInfo.menutype == value.menutype
                ? Color(0xFF2D2F55)
                : Colors.transparent,
            onPressed: () {
              var menuInfo = Provider.of<MenuInfo>(context, listen: false);
              menuInfo.updateMenu(currentMenuInfo);
            },
            child: Column(
              children: [
                Image.asset(
                  currentMenuInfo.image,
                  scale: 0.5,
                ),
                SizedBox(
                  height: 8.0,
                ),
                Text(
                  currentMenuInfo.title ?? '',
                  style: Theme.of(context).textTheme.headline5,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
