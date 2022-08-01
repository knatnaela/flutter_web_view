import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  const WebViewPage({Key? key}) : super(key: key);

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  late WebViewController controller;
  double progress = 0;
  @override
  void initState() {
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (await controller.canGoBack()) {
          controller.goBack();
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Flutter"),
          actions: [
            IconButton(
                onPressed: () => controller.reload(),
                icon: const Icon(Icons.refresh)),
          ],
        ),
        body: Column(
          children: [
            LinearProgressIndicator(
              value: progress,
              color: const Color(0xFF94cc2e),
              backgroundColor: Colors.black12,
            ),
            Expanded(
              child: WebView(
                javascriptMode: JavascriptMode.unrestricted,
                initialUrl: 'https://flutter.dev/',
                onWebViewCreated: (controller) => this.controller = controller,
                onProgress: (progress) => setState(
                  () => this.progress = progress / 100,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
