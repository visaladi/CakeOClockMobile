import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TrackingPage extends StatelessWidget {
  final String url;

  TrackingPage({required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tracking'),
      ),
      body: WebView(
        initialUrl: url,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
