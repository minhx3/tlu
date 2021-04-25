import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:thanglong_university/app/views/views/app_bar_view.dart';
import 'package:thanglong_university/app/views/views/app_widget.dart';

import '../controllers/detail_new_controller.dart';

class DetailNewView extends GetView<DetailNewController> {
  @override
  Widget build(BuildContext context) {
    return AppContainer(
      systemUiOverlayStyle: SystemUiOverlayStyle.light,
      child: Scaffold(
        body: Column(
          children: [
            AppBarView(
              type: AppBarType.navigator,
            ),
            Center(
              child: Text(
                'DetailNewView is working',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
