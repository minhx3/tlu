import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thanglong_university/Images/resources.dart';
import 'package:thanglong_university/app/modules/auth/views/web/form_login_web_view.dart';

class LoginWebPageView extends StatelessWidget {
  const LoginWebPageView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        Container(
          height: Get.height,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                width: Get.width * 0.65,
                child: Stack(
                  children: [
                    Image.network(
                      Images.schoolBackground,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                    Positioned(
                      left: 35,
                      top: 35,
                      child: Image.network(
                        Images.logoWeb,
                        fit: BoxFit.contain,
                        width: 250,
                        height: 100,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: Get.width - Get.width * 0.65,
                child: Stack(
                  children: [
                    Image.network(
                      Images.loginBackground,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                    Center(
                            child: SingleChildScrollView(
                                child: FormLoginWebView()))
                        .marginAll(15)
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
