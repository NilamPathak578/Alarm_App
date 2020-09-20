import 'package:alramNotification_app/Screens/enum.dart';
import 'package:flutter/cupertino.dart';

class MenuInfo extends ChangeNotifier {
  Menutype menutype;

  String title;
  String image;

  MenuInfo(this.menutype, {this.title, this.image});
  updateMenu(MenuInfo menuInfo) {
    this.menutype = menuInfo.menutype;
    this.title = menuInfo.title;
    this.image = menuInfo.image;

    notifyListeners();
  }
}
