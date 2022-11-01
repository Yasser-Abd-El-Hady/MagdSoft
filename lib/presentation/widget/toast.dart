import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

showToast(BuildContext context, String? text) {
  ToastContext().init(context);
  Toast.show("$text", duration: 2);
}
