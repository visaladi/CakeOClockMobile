import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CustomOrderPage extends StatelessWidget {
  final String url;

  CustomOrderPage({required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom Order'),
      ),
      body: WebView(
        initialUrl: url,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
