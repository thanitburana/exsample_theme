import 'package:exsample_theme/componemt/toolbar_back.dart';
import 'package:exsample_theme/getx/theme_app.dart';
import 'package:exsample_theme/model/theme_app_modedel.dart';
import 'package:exsample_theme/utils/theme_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/instance_manager.dart';

class ThemePopup extends StatelessWidget {
  const ThemePopup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: const ThemePopupForm(),
    );
  }
}

class ThemePopupForm extends StatelessWidget {
  const ThemePopupForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeAppController>(builder: (state) {
      return Container(
        color: state.themeAppModel.toolbarColor,
        child: Column(
          children: [
            ToolbarBack(
              onTap: () {
                Get.back();
              },
              child: Container(
                child: const Text(
                  "เลือกตีม",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ),
            ),
            _buildContent(state.themeAppModel)
          ],
        ),
      );
    });
  }

  Widget _buildContent(ThemeAppModel themeApp) {
    final ThemeAppController themeAppController = Get.find();
    return Expanded(
        child: Container(
      color: themeApp.backGroupColor,
      child: Column(
        children: [
            Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () {
                themeAppController.setTheme(ThemeApp.defualt());
              },
              child: Container(
                color: themeApp.navigationBar,
                child: Text("default"),
              ),
            ),
            InkWell(
              onTap: () {
                themeAppController.setTheme(ThemeApp.theme1());
              },
              child: Container(
                color: themeApp.toolbarColor,
                child: Text("setTheme"),
              ),
            )
          ],
        ),
        ],
      ),
    ));
  }
}
