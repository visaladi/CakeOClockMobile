import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomewebPage extends StatelessWidget {
  final String url;

  HomewebPage({required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WebView'),
      ),
      body: WebView(
        initialUrl: url,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
