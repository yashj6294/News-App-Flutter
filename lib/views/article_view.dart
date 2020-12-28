import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleView extends StatefulWidget {
  final String webUrl;
  ArticleView({this.webUrl});
  @override
  _ArticleViewState createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  final Completer<WebViewController> _completer =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'News',
              style: TextStyle(color: Colors.blue),
            ),
            Text('App'),
          ],
        ),
        elevation: 0.0,
        actions: [
          Opacity(
            opacity: 0,
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: Icon(Icons.save),
            ),
          ),
        ],
      ),
      body: Container(
        child: WebView(
          onWebViewCreated: ((WebViewController webViewController) {
            _completer.complete(webViewController);
          }),
          initialUrl: widget.webUrl,
        ),
      ),
    );
  }
}
