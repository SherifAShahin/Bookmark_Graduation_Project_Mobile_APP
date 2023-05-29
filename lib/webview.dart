import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewImage extends StatelessWidget {

  final controller;
  WebViewImage(
      this.controller,
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        titleSpacing: 0.0,
        title: Text(
          'BookMark',
          style: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.w700,
          ),
        ),
        leading: IconButton(
          onPressed: ()
          {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
          ),
        ),
        backgroundColor: HexColor(
          '#045255',
        ),
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}
