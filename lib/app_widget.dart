import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:payflow/modules/insert_boleto/insert_boleto.dart';
import 'package:payflow/modules/splash/splash.dart';

import 'modules/barcode_scanner/barcode_scanner_page.dart';
import 'modules/home/home_page.dart';
import 'modules/login/login_page.dart';
import 'shared/themes/app_colors.dart';

class AppFirebase extends StatefulWidget {
  AppFirebase() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
  }
  // This widget is the root of your application.
  @override
  _AppFirebaseState createState() => _AppFirebaseState();
}

class _AppFirebaseState extends State<AppFirebase> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Material(
              child: Center(
                  child: Text("N'ao foi possivel inicializar o Firebase")),
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return MaterialApp(
              title: 'PayFlow',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primaryColor: AppColors.primary,
                primarySwatch: Colors.orange,
              ),
              initialRoute: '/splash',
              routes: {
                "/home": (context) => HomePage(),
                "/login": (context) => LoginPage(),
                "/splash": (context) => Splash(),
                "/scan": (context) => BarcodeScannerPage(),
                "/insert": (context) => InsertBoletoPage(),
              },
            );
          }
          return Material(
            child: Center(child: CircularProgressIndicator()),
          );
        });
  }
}
