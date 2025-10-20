import 'package:dtpocketfm/pages/audiobook.dart';
import 'package:dtpocketfm/pages/home.dart';
import 'package:dtpocketfm/pages/novel.dart';
import 'package:dtpocketfm/pages/setting.dart';
import 'package:dtpocketfm/provider/generalprovider.dart';
import 'package:dtpocketfm/provider/profileprovider.dart';
import 'package:dtpocketfm/utils/adhelper.dart';
import 'package:dtpocketfm/utils/color.dart';
import 'package:dtpocketfm/utils/constant.dart';
import 'package:dtpocketfm/utils/sharedpre.dart';
import 'package:dtpocketfm/utils/strings.dart';
import 'package:dtpocketfm/utils/utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';

ValueNotifier<AudioPlayer?> currentlyPlaying = ValueNotifier(null);
const double playerMinHeight = kIsWeb ? 100 : 70;
const miniplayerPercentageDeclaration = 0.7;

class Bottombar extends StatefulWidget {
  const Bottombar({super.key});

  @override
  State<Bottombar> createState() => BottombarState();
}

class BottombarState extends State<Bottombar> {
  SharedPre sharedPre = SharedPre();
  int selectedIndex = 0;
  DateTime? currentBackPressTime;

  static List<Widget> widgetOptions = <Widget>[
    const Home(pageName: ""),
    const AudioBooks(
      pageName: '',
    ),
    const Novel(
      pageName: '',
    ),
    const Setting(),
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _getData();
    });
  }

  _getData() async {
    final generalsetting = Provider.of<GeneralProvider>(context, listen: false);
    final profileProvider =
        Provider.of<ProfileProvider>(context, listen: false);
    if (Constant.userID != null) {
      await profileProvider.getProfile(context);
    } else {
      Utils.updatePremium("0");
      Utils.loadAds(context);
    }
    if (!mounted) return;
    await generalsetting.getGeneralsetting(context);
    Future.delayed(Duration.zero).then((value) {
      if (!mounted) return;
      setState(() {});
    });
  }

  void _onItemTapped(int index) {
    AdHelper.showFullscreenAd(context, Constant.interstialAdType, () async {
      setState(() {
        selectedIndex = index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (didPop) {
        onBackPressed();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(children: [
          Center(
            child: widgetOptions[selectedIndex],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    spreadRadius: 0,
                    blurRadius: 10,
                    offset: Offset(0, -2),
                  ),
                ],
              ),
              clipBehavior: Clip.antiAlias,
              child: BottomNavigationBar(
                backgroundColor: Colors.white,
                selectedLabelStyle: GoogleFonts.montserrat(
                  fontSize: 10,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF1DB954),
                ),
                unselectedLabelStyle: GoogleFonts.montserrat(
                  fontSize: 10,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[600],
                ),
                selectedFontSize: 12,
                unselectedFontSize: 12,
                elevation: 0,
                currentIndex: selectedIndex,
                unselectedItemColor: Colors.grey[600],
                selectedItemColor: const Color(0xFF1DB954),
                type: BottomNavigationBarType.fixed,
                items: [
                  BottomNavigationBarItem(
                    backgroundColor: black,
                    label: bottomView1,
                    activeIcon: _buildBottomNavIcon(
                        iconName: 'ic_home', iconColor: const Color(0xFF1DB954)),
                    icon: _buildBottomNavIcon(iconName: 'ic_home', iconColor: gray),
                  ),
                  BottomNavigationBarItem(
                    backgroundColor: black,
                    label: bottomView2,
                    activeIcon: _buildBottomNavIcon(
                        iconName: 'ic_audiobook', iconColor: const Color(0xFF1DB954)),
                    icon: _buildBottomNavIcon(
                        iconName: 'ic_audiobook', iconColor: gray),
                  ),
                  BottomNavigationBarItem(
                    backgroundColor: black,
                    label: bottomView3,
                    activeIcon: _buildBottomNavIcon(
                        iconName: 'ic_novel', iconColor: const Color(0xFF1DB954)),
                    icon:
                        _buildBottomNavIcon(iconName: 'ic_novel', iconColor: gray),
                  ),
                  BottomNavigationBarItem(
                    backgroundColor: black,
                    label: "Settings",
                    activeIcon: _buildBottomNavIcon(
                        iconName: 'ic_setting', iconColor: const Color(0xFF1DB954)),
                    icon:
                        _buildBottomNavIcon(iconName: 'ic_setting', iconColor: gray),
                  ),
                ],
                onTap: _onItemTapped,
              ),
            ),
          ),
        ]),
      ),
    );
  }

  Widget _buildBottomNavIcon(
      {required String iconName, required Color? iconColor}) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.all(7),
        child: Image.asset(
          "assets/images/$iconName.png",
          width: 22,
          height: 22,
          color: iconColor,
        ),
      ),
    );
  }

  Future<bool> onBackPressed() async {
    if (selectedIndex == 0) {
      DateTime now = DateTime.now();
      if (currentBackPressTime == null ||
          now.difference(currentBackPressTime!) > const Duration(seconds: 2)) {
        currentBackPressTime = now;
        Utils.showSnackbar(context, "", "exit_warning", true);
        return Future.value(false);
      }
      SystemNavigator.pop();
      return Future.value(true);
    } else {
      _onItemTapped(0);
      return Future.value(false);
    }
  }
}
