import 'package:flutter/material.dart';

void restoreRoute({
  required BuildContext context,
  required String initialRouteName,
}) {
  Navigator.popUntil(context, ModalRoute.withName(initialRouteName));
  Navigator.pushNamed(context, initialRouteName);
}
