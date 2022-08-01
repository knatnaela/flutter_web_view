import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_web_view/view/webview/webview_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Timer(
        const Duration(seconds: 5),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const WebViewPage())));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Center(child: FlutterLogo()),
          SizedBox(
            height: 20,
          ),
          Center(
            child: CircularProgressIndicator(),
          )
        ],
      ),
    );
  }
}
