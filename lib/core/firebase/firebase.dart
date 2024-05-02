import 'package:dashboard2/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/foundation.dart';

class myfirebase {
  Future<void> init() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  }

  Future<String> serverUrl() async {
    String value = "";
    try {
      final FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;
      await remoteConfig.fetchAndActivate();
      await remoteConfig.setConfigSettings(RemoteConfigSettings(
          fetchTimeout: Duration(minutes: 1),
          minimumFetchInterval: Duration(seconds: 1)));
      value = remoteConfig.getString("key");
    } catch (e) {
      value = "";
    }
    return value;
  }
}
