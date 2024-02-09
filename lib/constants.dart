import 'package:flutter/material.dart';

Color primaryColor = Colors.grey.shade700;

TextStyle titleStyle = TextStyle(color: Colors.grey.shade700, fontSize: 20);
TextStyle subTitleStyle = TextStyle(color: Colors.grey.shade600, fontSize: 19);

height(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

width(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

popNav(BuildContext context) {
  return Navigator.of(context).pop();
}

showToast(BuildContext context, String msg) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(msg),
      duration: Duration(seconds: 1),
    ),
  );
}
