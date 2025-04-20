import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:innovahub_app/home/home_Tap_User.dart';
import 'package:innovahub_app/home/model/user_home_layout.dart';
import 'package:innovahub_app/home/user_home_screen.dart';
import 'package:quickalert/quickalert.dart';
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
          onUrlChange: (url) {
            log(url.url.toString());
          },
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {
            log(url);
          },
          onPageFinished: (String url) {
            if (url.contains("payment-success")) {
              Navigator.pop(context);
              QuickAlert.show(
                context: context,
                text: "Payment Success",
                type: QuickAlertType.success,
                autoCloseDuration: const Duration(
                  seconds: 2,
                ),
              );
              // Navigator.pushNamedAndRemoveUntil(
              //         context, HomeScreenUser.routeName, (_) => false)
              //     .then((value) {

              // });
            } else if (url.contains("payment-failed")) {
              Navigator.pop(context);
              QuickAlert.show(
                context: context,
                text: "Payment Failed",
                type: QuickAlertType.error,
                autoCloseDuration: const Duration(
                  seconds: 2,
                ),
              );
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
      body: WebViewWidget(controller: controller),
    );
  }
}
