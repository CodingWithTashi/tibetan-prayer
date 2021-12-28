import 'package:flutter/material.dart';

class ResponsiveWidget extends StatelessWidget {
  final Widget smallScreen;
  final Widget mediumOrLargeScreen;

  static const double breakpointSmallScreen = 750;

  const ResponsiveWidget({
    Key? key,
    required this.smallScreen,
    required this.mediumOrLargeScreen,
  }) : super(key: key);

  static bool isSmallScreen(BuildContext context) {
    return MediaQuery.of(context).size.width < breakpointSmallScreen;
  }

  static bool isMediumOrLargeScreen(BuildContext context) {
    return MediaQuery.of(context).size.width > breakpointSmallScreen;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (isSmallScreen(context)) {
          return smallScreen;
        } else {
          return mediumOrLargeScreen;
        }
      },
    );
  }
}
