import 'package:flutter/material.dart';
import 'package:amritotsavam_app/utils/colors.dart' as colors;

class UNaviBarItem extends BottomNavigationBarItem {
  UNaviBarItem(BuildContext context, {required Icon icon, required label})
      : super(
      icon: Container(
        decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(100.0)),
        padding:
        const EdgeInsets.symmetric(vertical: 4.0, horizontal: 20.0),
        margin: const EdgeInsets.only(bottom: 8.0, top: 4.0),
        child: icon,
      ),
      activeIcon: Container(
          decoration: BoxDecoration(
            color: colors.buttonColor,
            borderRadius: BorderRadius.circular(100.0),
          ),
          padding:
          const EdgeInsets.symmetric(vertical: 4.0, horizontal: 20.0),
          margin: const EdgeInsets.only(bottom: 8.0, top: 4.0),
          child: icon),
      label: label);
}
