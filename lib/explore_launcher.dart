import 'dart:io';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' as u;

class ExploreLauncher extends StatelessWidget {
  const ExploreLauncher({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Exploring Url_Launcher"),
      ),
      body: ListView(
        shrinkWrap: true,
        children: buildChildren(context),
      ),
    );
  }

  List<Widget> buildChildren(BuildContext context) {
    return [
      AppButton(
        title: "EMAIL TO",
        callback: () => launchEmail(),
      ),
      AppButton(
        title: "TEL",
     //   callback: () => launchTel(),
      ),
      AppButton(
        title: "URL LAUNCH",
        callback: () => launchBrowser(),
      ),
    ];
  }

  dynamic launchEmail() async {
    try
    {
      // print("ad");
      // await u.launchUrl(Uri.parse("mailto: developerportal365@gmail.com"));

      Uri email = Uri(
        scheme: 'mailto',
        path: "developerportal365@gmail.com",
        queryParameters: {
          'subject': "Data avl"
        },
      );

      await u.launchUrl(email);
    }
    catch(e) {
      print(e.toString());
    }
  }

  dynamic launchBrowser() async {
    try
    {

      Uri email = Uri(
        scheme: 'https',
        path: "www.github.com/mustafatahirhussein"
      );

      await u.launchUrl(email);
    }
    catch(e) {
      debugPrint(e.toString());
    }
  }

  dynamic openDirectory() async {
    try {}
    catch(e) {
      debugPrint(e.toString());
    }
  }
}

class AppButton extends StatelessWidget {
  final String? title;
  final VoidCallback? callback;

  const AppButton({Key? key, this.title, this.callback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(onPressed: callback, child: Text(title!)),
    );
  }
}
