import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tibetan_prayer/model/prayer.dart';
import 'package:tibetan_prayer/pages/prayer_detail_page.dart';
import 'package:tibetan_prayer/util/application_util.dart';
import 'package:tibetan_prayer/widget/prayer_border.dart';

class PrayerListPage extends StatefulWidget {
  final Function(Prayer prayer)? onClick;
  const PrayerListPage({Key? key, this.onClick}) : super(key: key);

  @override
  _PrayerListPageState createState() => _PrayerListPageState();
}

class _PrayerListPageState extends State<PrayerListPage> {
  List<Prayer> prayerList = [];
  @override
  void initState() {
    prayerList = Prayer.getPrayer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: const ShapeDecoration(
          shape: PrayerBorder(radius: 32), color: Colors.white),
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(vertical: 10),
        itemCount: prayerList.length,
        itemBuilder: (context, index) {
          Prayer prayer = prayerList[index];
          if (index == 0) {
            return Column(
              children: [_dalailamaPhotos(), _getSingleTile(prayer)],
            );
          }
          return _getSingleTile(prayer);
        },
      ),
    );
  }

  Widget _getSingleTile(Prayer prayer) => InkWell(
        onTap: () {
          if (widget.onClick != null) {
            widget.onClick!(prayer);
          } else {
            Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (context) {
                  return Scaffold(
                    backgroundColor: Theme.of(context).primaryColor,
                    body: PrayerDetailPage(
                      selectedPrayer: prayer,
                    ),
                  );
                },
              ),
            );
          }
        },
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: ApplicationUtil.getBoxDecorationOne(context),
          child: ListTile(
            title: Row(
              children: [
                Text(
                  prayer.serialNo,
                  style: const TextStyle(color: Colors.white, fontSize: 26),
                ),
                Expanded(
                  child: Text(
                    prayer.title,
                    style: const TextStyle(color: Colors.white, fontSize: 26),
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  _dalailamaPhotos() => Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            decoration: ApplicationUtil.getBoxDecorationOne(context),
            child: Image.asset(
              'assets/images/dalailama.png',
              width: 250,
              height: 250,
            ),
          ),
          const Text(
            'Dedicated to ~His Holiness',
            style: TextStyle(fontSize: 18),
          ),
        ],
      );
}
