import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CategoriesPage extends StatelessWidget {
  final String url;

  CategoriesPage({required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
      ),
      body: WebView(
        initialUrl: url,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
