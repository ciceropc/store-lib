import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'package:app/shared_widgets/widget/app_bar/label_app_bar.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:webview_flutter/webview_flutter.dart';

class WebViewGenericPage extends StatefulWidget {
  final String url;
  final String title;

  const WebViewGenericPage({Key key, this.url, this.title}) : super(key: key);

  @override
  _WebViewGenericPageState createState() => _WebViewGenericPageState();
}

class _WebViewGenericPageState extends State<WebViewGenericPage> {
  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  var _isLoading = false;

  WebViewController _webViewController;
  final Completer<WebViewController> _controller = Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LabelAppBar(
        title: widget.title,
      ),
      body: Stack(
        children: [
          WebView(
            initialUrl: widget.url,
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (controller) {
              _controller.complete(_webViewController);
              _webViewController = controller;

              setState(() {
                _isLoading = true;
              });
            },
            navigationDelegate: (navigation) async {
              if (navigation.url.startsWith('whatsapp')) {
                if (await canLaunch(navigation.url)) {
                  await launch(navigation.url);
                } else {
                  throw 'Could not launch ${navigation.url}';
                }
                return NavigationDecision.prevent;
              }
              return NavigationDecision.navigate;
            },
            onPageFinished: (_) async {
              _webViewController.evaluateJavascript(
                  "document.getElementsByTagName('header')[0].style.display = 'none';" +
                      "document.getElementsByTagName('footer')[0].style.display = 'none';" +
                      'document.querySelector("#BANNER_header--slim").style.display = "none";' +
                      'document.querySelector("#CENTRAL_navegacao").style.display = "none";' +
                      'document.querySelector("#content-center").style = "padding-top: 0px";');
              _webViewController
                  .evaluateJavascript('document.querySelector("#content-center").style = "padding-top: 0px";');
              _webViewController.evaluateJavascript('document.querySelector("#MODAL_lgdp").style.display = "none";');

              await Future.delayed(Duration(milliseconds: 250));
              setState(() {
                _isLoading = false;
              });
            },
          ),
          _isLoading
              ? Container(
                  color: Colors.white,
                  child: Center(
                      child: Lottie.asset(
                    'assets/anim/loader_azul_nv.json',
                    width: 100,
                    height: 100,
                  )),
                )
              : Container()
        ],
      ),
    );
  }
}
