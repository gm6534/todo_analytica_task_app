import 'package:get/get.dart';
import 'package:todo_analytica_task_app/data/utils/widgets/helper.dart';
import 'package:todo_analytica_task_app/view/task/view_model/offlineController.dart';

import '../../../data/api/api_services/firebase_service.dart';
import '../../../data/database/task_data.dart';
import '../../../view_model/connectivity_controller.dart';
import '../model/task_model.dart';

class TaskController extends GetxController {
  final RxBool isLoading = false.obs;

  var tasks = <Task>[].obs;
  // var offlineTasks = <Task>[];

  final OfflineController offlineController = Get.find();
  final connectivityService = Get.find<NetworkController>();

  @override
  void onInit() {
    super.onInit();
    loadTasks();
    // connectivityService.isConnected.listen((isOnline) {
    //   if (isOnline) {
    //     offlineController.syncOfflineTasks();
    //   } else {
    //     loadTasksFromLocal();
    //   }
    // });
  }

  Future<void> loadTasks() async {
    await connectivityService.getConnectivityType();
    if (connectivityService.isConnected.value) {
      loadTasksFromFireStore();
    } else {
      loadTasksFromLocal();
    }
  }

  Future<void> loadTasksFromFireStore() async {
    isLoading.value = true;
    try {
      tasks.value = [];
      final querySnapshot = await FirebaseFireStoreService.fireStore.collection('Tasks').get();
      tasks.value = querySnapshot.docs.map((doc) => Task.fromJson(doc.data())).toList();
    } catch (e) {
      isLoading.value = false;
      Helper.showToast(msg: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> loadTasksFromLocal() async {
    isLoading.value = true;
    try {
      offlineController.offlineTasks = [];
      tasks.value = [];
      tasks.value = await TaskData.getTasks();
      offlineController.offlineTasks = tasks;
    } catch (e) {
      isLoading.value = false;
      Helper.showToast(msg: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> addTask(Task task) async {
    try {
      if (connectivityService.isConnected.value) {
        await FirebaseFireStoreService.setDocument(
            collectionPath: 'Tasks',
            documentId: task.taskID,
            data: task.toJson());
      } else {
        await TaskData.insertTask(task);
        offlineController.offlineTasks.add(task);
      }
      tasks.add(task);
    } catch (e) {
      Helper.showToast(msg: e.toString());
    }
  }

  Future<void> updateTask(Task task) async {
    try {
      if (connectivityService.isConnected.value) {
        await FirebaseFireStoreService.updateDocument(
            collectionPath: 'Tasks',
            documentId: task.taskID,
            data: task.toJson());
      } else {
        await TaskData.updateTask(task);
        offlineController.offlineTasks.add(task);
      }
      int index = tasks.indexWhere((t) => t.taskID == task.taskID);
      tasks[index] = task;
      tasks.refresh();
    } catch (e) {
      Helper.showToast(msg: e.toString());
    }
  }

  Future<void> deleteTask(String id) async {
    try {
      if (connectivityService.isConnected.value) {
        await FirebaseFireStoreService.deleteDocument(collectionPath: 'Tasks', documentId: id);
      } else {
        await TaskData.deleteTask(id);
      }
      tasks.removeWhere((task) => task.taskID == id);
    } catch (e) {
      Helper.showToast(msg: e.toString());
    }
  }

}
