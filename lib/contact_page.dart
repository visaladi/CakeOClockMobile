import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ContactPage extends StatelessWidget {
  final String url;

  ContactPage({required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Us'),
      ),
      body: WebView(
        initialUrl: url,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
