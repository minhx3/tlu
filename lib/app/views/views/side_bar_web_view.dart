import 'package:flutter/material.dart';
import 'package:get/get.dart'; 

class SideBarWebView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SideBarWebView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'SideBarWebView is working', 
          style: TextStyle(fontSize:20),
        ),
      ),
    );
  }
}
  