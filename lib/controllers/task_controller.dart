import 'package:get/state_manager.dart';
import 'package:note_application_flutter/db/db_hepler.dart';
import 'package:note_application_flutter/models/task.dart';

class TaskController extends GetxController {
  @override
  void onReady() {
    super.onReady();
  }

  Future<int?> addTask({Task? task})async {
    return await DBHelper.insert(task);
  }
}
