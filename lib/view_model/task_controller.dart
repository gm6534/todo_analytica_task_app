import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../data/database/task_data.dart';
import '../model/task_model.dart';
import 'connectivity_controller.dart';

class TaskController extends GetxController {
  var tasks = <Task>[].obs;
  var offlineTasks = <Task>[];

  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final connectivityService = Get.find<NetworkController>();

  @override
  void onInit() {
    super.onInit();
    loadTasks();
    connectivityService.isConnected.listen((isOnline) {
      if (isOnline) {
        syncOfflineTasks();
      } else {
        loadTasksFromLocal();
      }
    });
  }

  Future<void> loadTasks() async {
    if (connectivityService.isConnected.value) {
      loadTasksFromFirestore();
    } else {
      loadTasksFromLocal();
    }
  }

  Future<void> loadTasksFromFirestore() async {
    final querySnapshot = await firestore.collection('tasks').get();
    tasks.value = querySnapshot.docs
        .map((doc) => Task.fromJson(doc.data() as Map<String, dynamic>))
        .toList();
  }

  Future<void> loadTasksFromLocal() async {
    tasks.value = await TaskData.getTasks();
  }

  Future<void> addTask(Task task) async {
    if (connectivityService.isConnected.value) {
      await firestore.collection('tasks').doc(task.id).set(task.toJson());
    } else {
      await TaskData.insertTask(task);
      offlineTasks.add(task);
    }
    tasks.add(task);
  }

  Future<void> updateTask(Task task) async {
    if (connectivityService.isConnected.value) {
      await firestore.collection('tasks').doc(task.id).update(task.toJson());
    } else {
      await TaskData.updateTask(task);
      offlineTasks.add(task);
    }
    int index = tasks.indexWhere((t) => t.id == task.id);
    tasks[index] = task;
    tasks.refresh();
  }

  Future<void> deleteTask(String id) async {
    if (connectivityService.isConnected.value) {
      await firestore.collection('tasks').doc(id).delete();
    } else {
      await TaskData.deleteTask(id);
    }
    tasks.removeWhere((task) => task.id == id);
  }

  Future<void> syncOfflineTasks() async {
    for (Task task in offlineTasks) {
      await firestore.collection('tasks').doc(task.id).set(task.toJson());
      await TaskData.deleteTask(task.id);
    }
    offlineTasks.clear();
  }
}



