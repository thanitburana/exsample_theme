import 'package:exsample_theme/model/theme_app_modedel.dart';
import 'package:exsample_theme/utils/theme_app.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ThemeAppController extends GetxController{
  ThemeAppModel themeAppModel = ThemeApp.defualt();
  setTheme(ThemeAppModel themeAppModel){
    this.themeAppModel = themeAppModel;
    update();
  }
}