import 'package:flutter/material.dart';
import 'package:tibetan_prayer/model/prayer.dart';
import 'package:tibetan_prayer/util/application_util.dart';
import 'package:tibetan_prayer/widget/prayer_border.dart';

class PrayerDetailPage extends StatefulWidget {
  final Prayer? selectedPrayer;
  const PrayerDetailPage({Key? key, this.selectedPrayer}) : super(key: key);

  @override
  _PrayerDetailPageState createState() => _PrayerDetailPageState();
}

class _PrayerDetailPageState extends State<PrayerDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: const ShapeDecoration(
          shape: PrayerBorder(radius: 32), color: Colors.white),
      child: widget.selectedPrayer == null
          ? const Center(
              child: Text('No Prayer Selected'),
            )
          : SingleChildScrollView(
              primary: false,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Center(
                  child: Text(
                    widget.selectedPrayer!.content,
                    style: TextStyle(fontSize: 26, height: 1.5),
                  ),
                ),
              ),
            ),
    );
  }
}
