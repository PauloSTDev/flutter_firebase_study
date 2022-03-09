import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_study/screens/home_page.dart';

void main() async {
  //Explicação sobre o código abaixo
  //https://stackoverflow.com/questions/63873338/what-does-widgetsflutterbinding-ensureinitialized-do
  //https://api.flutter.dev/flutter/widgets/WidgetsFlutterBinding/ensureInitialized.html
  //https://docs-flutter-io.firebaseapp.com/flutter/flutter_test/TestWidgetsFlutterBinding/ensureInitialized.html
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _fbApp = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: HomePage(),
    );
  }
}