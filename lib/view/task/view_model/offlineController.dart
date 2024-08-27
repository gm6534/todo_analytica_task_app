import 'package:get/get.dart';
import 'package:todo_analytica_task_app/view/task/view_model/task_controller.dart';

import '../../../data/api/api_services/firebase_service.dart';
import '../../../data/database/task_data.dart';
import '../../../data/utils/widgets/helper.dart';
import '../model/task_model.dart';

class OfflineController extends GetxController {
  final RxBool isSyncing = false.obs;
  var offlineTasks = <Task>[];


  Future<void> syncOfflineTasks() async {
    if (isSyncing.value) return;
    isSyncing.value = true;
    try {
      if (offlineTasks.isNotEmpty) {
        for (Task task in offlineTasks) {
          await FirebaseFireStoreService.setDocument(collectionPath: 'Tasks', documentId: task.taskID, data: task.toJson());
          await TaskData.deleteTask(task.taskID);
        }
        offlineTasks.clear();
        final TaskController taskController = Get.find();
        taskController.loadTasks();
      }
    } catch (e) {
      Helper.showToast(msg: e.toString());
      isSyncing.value = false;
    } finally {
      isSyncing.value = false;
    }
  }
}