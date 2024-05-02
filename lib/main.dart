// ignore_for_file: unused_import

import 'package:dashboard2/Routes.dart';
import 'package:dashboard2/dashboard/view/pages/dashPage.dart';
import 'package:dashboard2/firebase_options.dart';
import 'package:dashboard2/read.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
// runApp(
//    DevicePreview(
//     enabled: true,
//     builder: (context) => const DashPage(), // Wrap your app
//   ),
// );

  runApp(MaterialApp(
    initialRoute: Routes.initialRoute,
    routes: Routes.route,
    debugShowCheckedModeBanner: false,
  ));

  // runApp(REAd());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: DevicePreview.appBuilder,
      // ignore: deprecated_member_use
      useInheritedMediaQuery: true,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("welcome"),
        ),
        body: const Center(
          child: Column(
            children: [
              TextField(
                  cursorWidth: 20,
                  decoration: InputDecoration(
                    labelText: 'Enter some text',
                    border: OutlineInputBorder(),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
