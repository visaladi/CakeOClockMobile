import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomeWebPage extends StatelessWidget {
  final String url;

  HomeWebPage({required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: WebView(
        initialUrl: url,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
