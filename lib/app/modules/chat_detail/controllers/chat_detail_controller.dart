import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatDetailController extends GetxController {
  final TextEditingController _inputChatController = TextEditingController();
  TextEditingController get inputChatController => _inputChatController;
}
