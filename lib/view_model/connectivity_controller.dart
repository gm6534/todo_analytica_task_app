import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../data/utils/widgets/debug_print.dart';

class NetworkController extends GetxController with WidgetsBindingObserver {
  RxBool isConnected = false.obs;

  Connectivity? _connectivity;

  late StreamSubscription _streamSubscription;

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
    return _updateState(connectivityResult);
  }

  Future<void> refreshConnectivity() async {
    await getConnectivityType();
  }

  _updateState(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.wifi:
      case ConnectivityResult.mobile:
      case ConnectivityResult.ethernet:
        isConnected.value = true;
        break;
      case ConnectivityResult.none:
        isConnected.value = false;
        break;
      default:
        isConnected.value = false;
        break;
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
