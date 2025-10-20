import 'package:flutter/material.dart';
import 'package:dtpocketfm/utils/color.dart';

class ModernStyles {
  // Modern text styles
  static const TextStyle headingLarge = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: white,
    letterSpacing: -0.5,
  );

  static const TextStyle headingMedium = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: white,
    letterSpacing: -0.3,
  );

  static const TextStyle headingSmall = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: white,
    letterSpacing: -0.2,
  );

  static const TextStyle bodyLarge = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: white,
    height: 1.5,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: lightGray,
    height: 1.4,
  );

  static const TextStyle bodySmall = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: otherColor,
    height: 1.3,
  );

  static const TextStyle labelLarge = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: white,
    letterSpacing: 0.1,
  );

  static const TextStyle labelMedium = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: otherColor,
    letterSpacing: 0.1,
  );

  // Modern card styles
  static BoxDecoration modernCard = BoxDecoration(
    gradient: cardGradient,
    borderRadius: BorderRadius.circular(16),
    boxShadow: [
      BoxShadow(
        color: blackTrans20,
        blurRadius: 12,
        offset: const Offset(0, 4),
      ),
    ],
  );

  static BoxDecoration modernCardElevated = BoxDecoration(
    gradient: cardGradient,
    borderRadius: BorderRadius.circular(20),
    boxShadow: [
      BoxShadow(
        color: blackTrans30,
        blurRadius: 20,
        offset: const Offset(0, 8),
      ),
      BoxShadow(
        color: primaryTras10,
        blurRadius: 4,
        offset: const Offset(0, 2),
      ),
    ],
  );

  // Modern button styles
  static BoxDecoration primaryButton = BoxDecoration(
    gradient: modernPrimary,
    borderRadius: BorderRadius.circular(12),
    boxShadow: [
      BoxShadow(
        color: primaryTras25,
        blurRadius: 8,
        offset: const Offset(0, 4),
      ),
    ],
  );

  static BoxDecoration secondaryButton = BoxDecoration(
    color: lightBlack,
    borderRadius: BorderRadius.circular(12),
    border: Border.all(color: colorPrimary.withOpacity(0.3)),
    boxShadow: [
      BoxShadow(
        color: blackTrans10,
        blurRadius: 4,
        offset: const Offset(0, 2),
      ),
    ],
  );

  // Modern input field style
  static InputDecoration modernInputDecoration({
    String? hintText,
    String? labelText,
    Widget? prefixIcon,
    Widget? suffixIcon,
  }) {
    return InputDecoration(
      hintText: hintText,
      labelText: labelText,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      filled: true,
      fillColor: textFieldBG,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: gray.withOpacity(0.3)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: colorPrimary, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: redColor, width: 1),
      ),
      hintStyle: const TextStyle(color: otherColor),
      labelStyle: const TextStyle(color: otherColor),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
    );
  }

  // Modern app bar decoration
  static AppBar modernAppBar({
    required String title,
    List<Widget>? actions,
    Widget? leading,
    bool centerTitle = true,
  }) {
    return AppBar(
      title: Text(
        title,
        style: headingSmall,
      ),
      centerTitle: centerTitle,
      backgroundColor: appBgColor,
      elevation: 0,
      leading: leading,
      actions: actions,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [appBgColor, lightBlack],
          ),
        ),
      ),
    );
  }

  // Modern bottom sheet decoration
  static BoxDecoration modernBottomSheet = const BoxDecoration(
    color: profileBottomSheetBG,
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(24),
      topRight: Radius.circular(24),
    ),
  );

  // Modern chip decoration
  static BoxDecoration modernChip({bool isSelected = false}) {
    return BoxDecoration(
      color: isSelected ? colorPrimary : lightBlack,
      borderRadius: BorderRadius.circular(20),
      border: Border.all(
        color: isSelected ? colorPrimary : gray.withOpacity(0.3),
      ),
    );
  }

  // Modern divider
  static Widget modernDivider = Container(
    height: 1,
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [
          transparentColor,
          gray.withOpacity(0.3),
          transparentColor,
        ],
      ),
    ),
  );

  // Modern loading indicator
  static Widget modernLoadingIndicator = Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: lightBlack,
      borderRadius: BorderRadius.circular(12),
    ),
    child: const CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation<Color>(colorPrimary),
      strokeWidth: 3,
    ),
  );

  // Modern shimmer effect
  static BoxDecoration shimmerDecoration = BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [
        shimmerColor,
        shimmerItemColor,
        shimmerColor,
      ],
    ),
    borderRadius: BorderRadius.circular(8),
  );
}
