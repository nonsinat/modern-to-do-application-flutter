import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:note_application_flutter/services/notification_services.dart';
import 'package:note_application_flutter/services/theme_services.dart';
import 'package:note_application_flutter/ui/add_task_page.dart';
import 'package:note_application_flutter/ui/theme.dart';
import 'package:note_application_flutter/ui/widgets/button.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime? _selectedDate = DateTime.now();
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
      body: Column(
        children: [
          _addTaskBar(),
          SizedBox(
            height: 5,
          ),
          _addDateBar(),
        ],
      ),
    );
  }

  _addDateBar() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: DatePicker(
        DateTime.now(),
        height: 100,
        width: 80,
        initialSelectedDate: DateTime.now(),
        selectionColor: primaryClr,
        selectedTextColor: Colors.white,
        dateTextStyle: GoogleFonts.lato(
          textStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.grey,
          ),
        ),
        dayTextStyle: GoogleFonts.lato(
          textStyle: TextStyle(
            // fontSize: 10,
            fontWeight: FontWeight.w600,
            color: Colors.grey,
          ),
        ),
        monthTextStyle: GoogleFonts.lato(
          textStyle: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.grey,
          ),
        ),
        onDateChange: (date) {
          _selectedDate = date;
          print(_selectedDate);
        },
      ),
    );
  }

  _addTaskBar() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                DateFormat.yMMMMd().format(
                  DateTime.now(),
                ),
                style: subHeadingStyle,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Today",
                style: headingStyle,
              ),
            ],
          ),
          MyButton(
            onTap: () => Get.to(AddTaskPage()),
            label: "+ Add Task",
          ),
        ],
      ),
    );
  }

  _appBar() {
    return AppBar(
      elevation: 0.0,
      leading: GestureDetector(
        onTap: () {
          debugPrint("tabed");
          ThemeServices().swithcTheme();
          notifyHelper.displayNotification(
            title: "Theme changed",
            body: Get.isDarkMode
                ? "Activated Light Theme"
                : "Activated Dark Theme",
          );
          notifyHelper.scheduledNotification();
        },
        child: Icon(
          Get.isDarkMode ? Icons.wb_sunny_outlined : Icons.nightlight_outlined,
          // color: Get.isDarkMode ? Colors.white : Colors.black,
        ),
      ),
      actions: [
        Icon(
          Icons.person_outline,
        ),
        SizedBox(
          width: 20,
        ),
      ],
    );
  }
}
