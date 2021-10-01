import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:note_application_flutter/services/notification_services.dart';
import 'package:note_application_flutter/services/theme_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var notifyHelper;
  @override
  void initState() {
    super.initState();
    notifyHelper = NotifyHelper();
    notifyHelper.requestIOSPermissions();
    notifyHelper.initializeNotification();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Container(
        child: Text("Theme data"),
      ),
    );
  }

  _appBar() {
    return AppBar(
      elevation: 0.0,
      leading: GestureDetector(
        onTap: () {
          setState(() {
            debugPrint("tabed");
            ThemeServices().swithcTheme();
            notifyHelper.displayNotification(
              title: "Theme changed",
              body: Get.isDarkMode
                  ? "Activated Light Theme"
                  : "Activated Dark Theme",
            );
            //  notifyHelper.scheduledNotification();
          });
        },
        child: Icon(
          Get.isDarkMode ? Icons.wb_sunny_outlined : Icons.nightlight_round,
          color: Get.isDarkMode ? Colors.white : Colors.black,
        ),
      ),
      actions: [
        Icon(
          Icons.person,
        ),
        SizedBox(
          width: 20,
        ),
      ],
    );
  }
}
