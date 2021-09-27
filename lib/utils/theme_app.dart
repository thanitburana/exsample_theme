import 'package:exsample_theme/model/theme_app_modedel.dart';
import 'package:flutter/material.dart';

class ThemeApp {
static ThemeAppModel defualt() =>ThemeAppModel(
    tabBarColor: Colors.white,
    backGroupColor: Colors.grey,
    navigationBar: Colors.red,
    toolbarColor: Colors.teal
  );

  static ThemeAppModel theme1() =>ThemeAppModel(
    tabBarColor: Colors.purpleAccent,
    backGroupColor: Colors.blue,
    navigationBar: Colors.brown,
    toolbarColor: Colors.indigo
  );
}