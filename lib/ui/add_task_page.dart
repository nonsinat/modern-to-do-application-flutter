import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_application_flutter/ui/theme.dart';

class AddTaskPage extends StatelessWidget {
  const AddTaskPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Text(
                "AddTask",
                style: headingStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }

  _appBar() {
    return AppBar(
      elevation: 0.0,
      leading: GestureDetector(
        onTap: () {
          Get.back();
        },
        child: Icon(
          Icons.arrow_back_ios_new_outlined,
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
