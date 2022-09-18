import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

mixin SmoothSchedulerBindingMixin on SchedulerBinding {
  DateTime? get beginFrameTime => _beginFrameTime;
  DateTime? _beginFrameTime;

  @override
  void handleBeginFrame(Duration? rawTimeStamp) {
    _beginFrameTime = DateTime.now();
    super.handleBeginFrame(rawTimeStamp);
  }
}

// ref [AutomatedTestWidgetsFlutterBinding]
class SmoothWidgetsFlutterBinding extends WidgetsFlutterBinding with SmoothSchedulerBindingMixin {
  @override
  void initInstances() {
    super.initInstances();
    _instance = this;
  }

  static SmoothWidgetsFlutterBinding get instance => BindingBase.checkInstance(_instance);
  static SmoothWidgetsFlutterBinding? _instance;

  // ignore: prefer_constructors_over_static_methods
  static SmoothWidgetsFlutterBinding ensureInitialized() {
    if (SmoothWidgetsFlutterBinding._instance == null) SmoothWidgetsFlutterBinding();
    return SmoothWidgetsFlutterBinding.instance;
  }
}
