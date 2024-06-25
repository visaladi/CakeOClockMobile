import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AboutUsPage extends StatelessWidget {
  final String url;

  AboutUsPage({required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
      ),
      body: WebView(
        initialUrl: url,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
