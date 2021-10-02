import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_application_flutter/ui/theme.dart';
import 'package:note_application_flutter/ui/widgets/input_field.dart';

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "AddTask",
                style: headingStyle,
              ),
              MyInputField(title: "Title", hint: "Enter title here"),
              MyInputField(title: "Note", hint: "Enter note here"),
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
