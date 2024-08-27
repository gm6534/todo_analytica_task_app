import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:todo_analytica_task_app/view/task/view_model/offlineController.dart';

import '../data/utils/widgets/debug_print.dart';

class NetworkController extends GetxController with WidgetsBindingObserver {
  RxBool isConnected = false.obs;

  Connectivity? _connectivity;

  late StreamSubscription _streamSubscription;
  final OfflineController offlineController = Get.find();

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addObserver(this);
    _connectivity = Connectivity();
    getConnectivityType();
    _streamSubscription =
        _connectivity!.onConnectivityChanged.listen(_updateState);
  }

  Future<void> getConnectivityType() async {
    late ConnectivityResult connectivityResult;
    try {
      connectivityResult = await (_connectivity!.checkConnectivity());
    } on PlatformException catch (e) {
      Debug.mLog(e.toString());
      connectivityResult = ConnectivityResult.none;
    }
      _updateState(connectivityResult);
  }

  Future<void> refreshConnectivity() async {
    await getConnectivityType();
  }

  _updateState(ConnectivityResult result) async {
    switch (result) {
      case ConnectivityResult.wifi:
      case ConnectivityResult.mobile:
      case ConnectivityResult.ethernet:
        isConnected.value = true;
        break;
      case ConnectivityResult.none:
      default:
        isConnected.value = false;
        break;
    }
    if(isConnected.value && !offlineController.isSyncing.value) {
      await offlineController.syncOfflineTasks();
    }
  }

  @override
  void onClose() {
    _streamSubscription.cancel();
    WidgetsBinding.instance.removeObserver(this);
    super.onClose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    switch (state) {
      case AppLifecycleState.resumed:
        Debug.mLog(state.name);
        refreshConnectivity();
        break;
      case AppLifecycleState.inactive:
        Debug.mLog(state.name);
        break;
      case AppLifecycleState.paused:
        Debug.mLog(state.name);
        break;
      case AppLifecycleState.detached:
        Debug.mLog(state.name);
        break;
      case AppLifecycleState.hidden:
        Debug.mLog(state.name);
        break;
    }
  }
}
