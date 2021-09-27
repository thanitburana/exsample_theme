import 'package:exsample_theme/getx/theme_app.dart';
import 'package:exsample_theme/model/theme_app_modedel.dart';
import 'package:exsample_theme/screen/popup_theme.dart';
import 'package:exsample_theme/utils/theme_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:get/get.dart';
class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: MainForm(),
    );
  }
}

class MainForm extends StatelessWidget {
  const MainForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeAppController themeAppController = Get.put(ThemeAppController());
    return GetBuilder<ThemeAppController>(builder: (state) {
      return Container(
        child: Column(
          children: [
            _buildToolbar(context, state.themeAppModel),
            _content(context,state.themeAppModel)
          ],
        ),
      );
    });
  }

  Widget _content(BuildContext context,ThemeAppModel themeApp) {
    final ThemeAppController themeAppController = Get.find();
    return Expanded(
      child: Container(
        alignment: Alignment.center,
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
                   padding: const EdgeInsets.all(10),
                color: themeApp.navigationBar,
                child: Text("default"),
              ),
            ),
            InkWell(
              onTap: () {
                themeAppController.setTheme(ThemeApp.theme1());
              },
              child: Container(
                   padding: const EdgeInsets.all(10),
                color: themeApp.toolbarColor,
                child: Text("setTheme"),
              ),
            )
          ],
        ),
        InkWell(
          onTap: (){
             showDialog(context: context,
                  builder: (BuildContext context){
                  return ThemePopup();
                  }
             );
          },
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Text("Popup"),
            decoration: const BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.all(Radius.circular(10))
            ),
          ),
        )
          ],
        )
      ),
    );
  }

  Widget _buildToolbar(BuildContext context, ThemeAppModel themeApp) =>
      Container(
          decoration: BoxDecoration(color: themeApp.toolbarColor),
          width: double.infinity,
          child: Container(
            alignment: Alignment.center,
            height: MediaQuery.of(context).padding.top + 48,
            padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            child: Text(
              "Test Flutter",
              style: TextStyle(color: themeApp.backGroupColor),
            ),
          ));
}
