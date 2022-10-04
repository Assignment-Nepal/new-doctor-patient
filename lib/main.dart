//@dart=2.9

import 'package:doctor_patient/view/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  // setupLocator();
  WidgetsFlutterBinding.ensureInitialized();

//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
// );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
    //  MultiProvider(
    // providers: [
    //   // ChangeNotifierProvider<AuthClass>(
    //   //   create: (context) => AuthClass(),
    //   // ),
    //   // ChangeNotifierProvider<NotificationService>(
    //   //   create: (context) => NotificationService(),
    //   // ),
    //   // StreamProvider<User>.value(
    //   //   value: FirebaseAuth.instance.authStateChanges(),
    //   // ),
    // ],
    // HomePage(),
  }
}
