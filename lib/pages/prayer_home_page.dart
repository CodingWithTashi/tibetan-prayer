import 'package:flutter/material.dart';
import 'package:tibetan_prayer/model/prayer.dart';
import 'package:tibetan_prayer/pages/prayer_detail_page.dart';
import 'package:tibetan_prayer/pages/prayer_list_page.dart';
import 'package:tibetan_prayer/util/screen_util.dart';

class PrayerHomePage extends StatefulWidget {
  const PrayerHomePage({Key? key}) : super(key: key);

  @override
  State<PrayerHomePage> createState() => _PrayerHomePageState();
}

class _PrayerHomePageState extends State<PrayerHomePage> {
  Prayer? selectedPrayer;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 2),
        ),
        child: ResponsiveWidget(
          smallScreen: const PrayerListPage(),
          mediumOrLargeScreen: Row(
            children: [
              Expanded(
                flex: 3,
                child: PrayerListPage(
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
    );
  }
}
