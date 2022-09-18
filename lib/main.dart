import 'package:flutter/material.dart';
import 'presentation/router/app_router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'presentation/router/auth_router.dart';



Future<void> main() async {
WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(brightness: Brightness.dark) ,
      darkTheme: ThemeData(
    brightness: Brightness.dark,
  ),
  home: AuthFlowNavigator(),
    );
  }
}
