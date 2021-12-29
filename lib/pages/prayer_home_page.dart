import 'package:flutter/material.dart';
import 'package:tibetan_prayer/model/prayer.dart';
import 'package:tibetan_prayer/pages/prayer_detail_page.dart';
import 'package:tibetan_prayer/pages/prayer_list_page.dart';
import 'package:tibetan_prayer/util/screen_util.dart';
import 'package:tibetan_prayer/widget/side_drawer.dart';

class PrayerHomePage extends StatefulWidget {
  const PrayerHomePage({Key? key}) : super(key: key);

  @override
  State<PrayerHomePage> createState() => _PrayerHomePageState();
}

class _PrayerHomePageState extends State<PrayerHomePage> {
  Prayer? selectedPrayer;
  DateTime? currentBackPressTime;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Theme.of(context).primaryColor,
      drawer: Container(
          constraints: const BoxConstraints(maxWidth: 300),
          child: const SideDrawer()),
      body: WillPopScope(
        child: Container(
          constraints: BoxConstraints(minWidth: 300),
          child: ResponsiveWidget(
            smallScreen: SafeArea(
                child: PrayerListPage(
              scaffoldKey: scaffoldKey,
            )),
            mediumOrLargeScreen: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 2),
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: PrayerListPage(
                      scaffoldKey: scaffoldKey,
                      onClick: (prayer) {
                        selectedPrayer = prayer;
                        setState(() {});
                      },
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    child: PrayerDetailPage(
                      selectedPrayer: selectedPrayer,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        onWillPop: onWillPop,
      ),
    );
  }

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Press back again to exit')));
      return Future.value(false);
    }
    return Future.value(true);
  }
}
