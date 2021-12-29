import 'package:flutter/material.dart';
import 'package:tibetan_prayer/model/prayer.dart';

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
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration:
          BoxDecoration(border: Border.all(color: Colors.white, width: 2)),

      /*const ShapeDecoration(
          shape: PrayerBorder(radius: 10), color: Colors.white),*/
      child: widget.selectedPrayer == null
          ? const Center(
              child: Text(
                'ཁ་བཏོན་འདེམ།',
                style: TextStyle(fontSize: 28, color: Colors.grey),
              ),
            )
          : SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              primary: false,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Center(
                  child: Column(
                    children: [
                      Hero(
                        tag: widget.selectedPrayer!.id,
                        child: Material(
                          type: MaterialType.transparency,
                          child: Text(
                            widget.selectedPrayer!.title,
                            style: const TextStyle(fontSize: 32, height: 1.5),
                          ),
                        ),
                      ),
                      Text(
                        widget.selectedPrayer!.content,
                        style: const TextStyle(fontSize: 26, height: 1.5),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
