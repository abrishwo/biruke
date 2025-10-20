import 'package:flutter/material.dart';

// Spotify-like Green Theme Color Palette
const colorPrimary = Color(0xFF1DB954); // Spotify green
const colorPrimaryDark = Color(0xFF1ED760); // Lighter Spotify green
const colorAccent = Color(0xFF1DB954); // Spotify green

const complimentryColor = Color(0xFF1DB954); // Spotify green
const primaryLight = Color(0xFF1ED760); // Light Spotify green
const primaryDark = Color(0xFF1DB954); // Spotify green
const primaryTras75 = Color(0xBF1DB954);
const primaryTras50 = Color(0x801DB954);
const primaryTras25 = Color(0x401DB954);
const primaryTras10 = Color(0x1A1DB954);
const primaryTras5 = Color(0x0D1DB954);
const moreLikeTxt = Color(0xFF64748B); // Slate gray
const saveBtnBg = Color(0xFF1DB954); // Spotify green
const profileBottomSheetBG = Colors.white; // White background
const textFieldBG = Color(0xFFF5F5F5); // Light gray

const appBgColor = Colors.white; // White background for modern clean look
const dotsDefaultColor = Color(0xFF9E9E9E); // Gray dots
const dotsActiveColor = Color(0xFF1DB954); // Spotify green for active dots
const statusBarColor = Color.fromRGBO(0, 0, 0, 0);
const tabDefaultColor = Color(0x99475569);
const subscriptionBG = Color(0xFF1E293B); // Slate 800
const edtBG = Color(0xFF475569); // Slate 600
const otherIcons = Color(0xFF94A3B8); // Slate 400
const otherColor = Color(0xFF94A3B8); // Slate 400
const yellowButton = Color(0xFFF59E0B); // Amber 500
const secProgressColor = Color(0x8094A3B8);
const transparentColor = Color(0x00000000);
const redColor = Color(0xFFEF4444); // Red 500
const greenColor = Color(0xFF1DB954); // Spotify green
const deleteBg = Color(0xFFDC2626); // Red 600

// Modern status and feedback colors
const successBG = Color(0xFF1DB954); // Spotify green
const warningBG = Color(0xFFF59E0B); // Amber 500
const infoBG = Color(0xFF3B82F6); // Blue 500
const successIcon = Color(0xFF6EE7B7); // Emerald 300
const failureBG = Color(0xFFEF4444); // Red 500

// Modern neutral colors
const black = Color(0xFF000000);
const blackTrans95 = Color(0xF5000000);
const blackTrans90 = Color(0xE6000000);
const blackTransparent = Color(0x80000000);
const blackTrans70 = Color(0xB3000000);
const blackTrans60 = Color(0x99000000);
const blackTrans50 = Color(0x80000000);
const blackTrans40 = Color(0x66000000);
const blackTrans30 = Color(0x4D000000);
const blackTrans20 = Color(0x33000000);
const blackTrans10 = Color(0x1A000000);
const lightBlack = Color(0xFF1E293B); // Slate 800
const shimmerColor = Color(0xFFF5F5F5); // Light gray for white background
const shimmerItemColor = Color(0xFFE0E0E0); // Slightly darker light gray
const gray = Color(0xFF6B7280); // Gray 500
const grayDark = Color(0xFF374151); // Gray 700
const lightGray = Color(0xFFD1D5DB); // Gray 300
const white = Color(0xFFFFFFFF);
const whiteLight = Color(0xFFF8FAFC); // Slate 50
const whiteTransparent = Color(0x80FFFFFF);

// Modern app-specific colors
const darkappbgcolor = Colors.white; // White background for seamless look
const lanBgColor1 = Color(0xFF8B5CF6); // Violet 500
const lanBgColor2 = Color(0xFFC084FC); // Violet 400
const brown = Color(0xFF92400E); // Amber 800
const lightappbgcolor = Colors.white; // White background for seamless look
const gmailLogincolor = Color(0xFF475569); // Slate 600
const red = Color(0xFFEF4444); // Red 500
const lightpink = Color(0xFFF472B6); // Pink 400
const authorProfileBg = Color(0xFF7C2D12); // Orange 800
const darkBrown = Color(0xFF451A03); // Amber 900
const yellow = Color(0xFFF59E0B); // Amber 500
const lightblue = Color(0xFF94A3B8); // Slate 400
const lightGreen = Color(0xFF1DB954); // Spotify green
const bottmsheetTextColor = Color(0xFFE2E8F0); // Slate 200
const black1 = Colors.white; // White background for seamless look

// Spotify-like gradients for premium feel
Gradient coinPrice = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      const Color(0xFF1DB954).withOpacity(1.0), // Spotify green
      const Color(0xFF1ED760).withOpacity(1.0), // Light Spotify green
      const Color(0xFF1AAE4F).withOpacity(1.0), // Dark Spotify green
      const Color(0xFF169C47).withOpacity(1.0), // Darker Spotify green
      const Color(0xFF128A3F).withOpacity(1.0)  // Darkest Spotify green
    ]);

Gradient lightOrange = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      const Color(0xFF1DB954).withOpacity(1.0), // Spotify green
      const Color(0xFF1ED760).withOpacity(1.0), // Light Spotify green
    ]);

// Additional Spotify-like gradients
Gradient modernPrimary = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      const Color(0xFF1DB954), // Spotify green
      const Color(0xFF1ED760), // Light Spotify green
    ]);

Gradient cardGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Colors.white, // White background
      const Color(0xFFF5F5F5), // Light gray
    ]);
