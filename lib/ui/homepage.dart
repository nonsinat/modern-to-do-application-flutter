import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      leading: IconButton(
        onPressed: () {
          debugPrint("tabed");
        },
        icon: Icon(
          Icons.nightlight_round,
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
