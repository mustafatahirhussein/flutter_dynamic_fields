import 'package:flutter/material.dart';
import 'package:flutter_dynamic_fields/dynamic_fields.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp()
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      home: DynamicFields(),
    );
  }
}
