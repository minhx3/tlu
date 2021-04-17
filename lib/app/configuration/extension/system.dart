import 'package:flutter/material.dart';

dismissKeyboard({BuildContext context}) {
  FocusScope.of(context).requestFocus(FocusNode());
  // SystemChannels.textInput.invokeMethod('TextInput.hide');
}

extension BuildContextProperty on BuildContext {
  Object get arguments => ModalRoute.of(this).settings.arguments;
}
