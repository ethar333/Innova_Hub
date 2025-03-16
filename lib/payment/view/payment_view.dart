import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymetExcuteWebView extends StatefulWidget {
  final String url;
  const PaymetExcuteWebView({super.key, required this.url});

  @override
  State<PaymetExcuteWebView> createState() => _PaymetExcuteWebViewState();
}

class _PaymetExcuteWebViewState extends State<PaymetExcuteWebView> {
  late WebViewController controller;
  @override
  void initState() {
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {
            if (url.contains("payment-success")) {
           
            } else if (url.contains("payment-failed")) {
        
            
            }
          },
          onHttpError: (HttpResponseError error) {},
          onWebResourceError: (WebResourceError error) {},
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: WebViewWidget(controller: controller),
    );
  }
}