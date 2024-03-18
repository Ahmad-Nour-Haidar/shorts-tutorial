import 'package:flutter/material.dart';

void navigatorAndFinish(BuildContext context, Widget widget) =>
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
      (Route<dynamic> route) => false, // This will remove all previous screens
    );

void navigatorTo(BuildContext context, Widget widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );
