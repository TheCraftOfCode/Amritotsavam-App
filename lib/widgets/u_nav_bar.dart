import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:amritotsavam_app/widgets/u_nav_bar_item.dart';
import 'package:amritotsavam_app/utils/colors.dart' as colors;

class UNaviBar extends StatelessWidget {
  const UNaviBar({
    Key? key,
    required this.items,
    this.selectedIndex = 0,
    this.onTap,
  }) : super(key: key);
  final List<UNaviBarItem> items;
  final int selectedIndex;
  final Function(int)? onTap;
  @override
  Widget build(BuildContext context) {
    assert(items.length >= 2, "At least 2 UNaviBarItems needed");

    return BottomNavigationBar(
      enableFeedback: true,
      backgroundColor: colors.textBoxFill,
      currentIndex: selectedIndex,
      selectedItemColor: colors.primaryTextColor,
      unselectedItemColor: colors.primaryTextColor,
      elevation: 0.0,
      selectedFontSize: 13.0,
      unselectedFontSize: 13.0,
      onTap: (j) => onTap?.call(j),
      selectedLabelStyle: GoogleFonts.nunito(fontWeight: FontWeight.w500, color: colors.gradientBeginColor),
      unselectedLabelStyle: GoogleFonts.nunito(fontWeight: FontWeight.w500, color: colors.gradientBeginColor),
      items: items,
    );
  }
}
