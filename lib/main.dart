import 'package:flutter/material.dart';
import 'package:flutter_dynamic_fields/dynamic_fields.dart';
import 'package:flutter_dynamic_fields/explore_launcher.dart';
import 'package:flutter_dynamic_fields/shimmer_eff.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DynamicFields(),
      //home: ShimmerEff(),
      // home: ExploreLauncher(),
    //  home: MenuTutorail(),
    );
  }
}

class MenuTutorail extends StatelessWidget {
  const MenuTutorail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Exploring PopUps"),
        actions: appBarActions(context),
      ),
    );
  }

  List<Widget> appBarActions(BuildContext context) {
    return [
      PopupMenuButton<String>(
        itemBuilder: (_) {
          return const [
            PopupMenuItem<String>(value: "1", child: Text("Rate Us")),
            PopupMenuItem<String>(value: "2", child: Text("Leave a review")),
            PopupMenuItem<String>(value: "3", child: Text("Share")),
            PopupMenuItem<String>(value: "4", child: Text("Exit")),
          ];
        },
        icon: const Icon(Icons.account_circle),
        onSelected: (i) {
         if(i == "1"){
           displayBar(context, i);
         }
         else if(i == "2"){
           displayBar(context, i);
         }
         else if(i == "3"){
           displayBar(context, i);
         }
         else if(i == "4"){
           displayBar(context, i);
         }
         else {}
        },
        onCanceled: () => displayBar(context,"Cancelled",cancel: true),
      ),
    ];
  }

  dynamic displayBar(BuildContext context, String text, {bool cancel = false}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: !cancel ? Text("Click Item $text") : Text(text)));
  }
}
