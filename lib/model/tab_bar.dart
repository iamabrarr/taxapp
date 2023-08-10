import 'package:flutter/material.dart';

class TabbarItem {
  String text;
  VoidCallback onTap;
  TabbarItem({required this.onTap, required this.text});
}
