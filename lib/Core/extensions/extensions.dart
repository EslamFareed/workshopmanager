import 'package:flutter/material.dart';

extension TapCallbackExtension on Widget {
  Widget onTap(VoidCallback? onTap) {
    return InkWell(
      onTap: onTap,
      child: this,
    );
  }
}
