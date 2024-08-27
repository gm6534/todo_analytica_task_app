import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../view/task/model/task_model.dart';

class TaskService {
  final CollectionReference taskCollection = FirebaseFirestore.instance.collection('Tasks');

  Future<void> addTask(Task task) async {
    await taskCollection.add(task.toJson());
  }

  Future<void> updateTask(String id, Task task) async {
    await taskCollection.doc(id).update(task.toJson());
  }

  Future<void> deleteTask(String id) async {
    await taskCollection.doc(id).delete();
  }
}
