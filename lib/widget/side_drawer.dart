import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';
import 'package:tibetan_prayer/util/constant.dart';
import 'package:url_launcher/url_launcher.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: _drawerAppBar(context),
      body: SafeArea(
        child: Container(
          width: 500,
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    leading: const Icon(
                      Icons.apps,
                      color: Colors.white,
                    ),
                    title: const Text('More App from Kharag'),
                    onTap: () {
                      launchInBrowser(AppConstant.MORE_URL);

                      Navigator.pop(context);
                    },
                  ),
                  !kIsWeb
                      ? ListTile(
                          leading: const Icon(Icons.language_outlined,
                              color: Colors.white),
                          title: const Text(AppConstant.VIEW_ON_WEB),
                          onTap: () {
                            launchInBrowser(AppConstant.WEB_URL);
                            Navigator.pop(context);
                          },
                        )
                      : Container(),
                  ListTile(
                    leading:
                        const Icon(Icons.email_outlined, color: Colors.white),
                    title: const Text(AppConstant.CONTACT_US),
                    onTap: () {
                      launchEmail(AppConstant.EMAIL, AppConstant.SUBJECT);
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.star_rate, color: Colors.white),
                    title: const Text('Rate Us'),
                    onTap: () {
                      launchInBrowser(AppConstant.APP_URL);

                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.share, color: Colors.white),
                    title: const Text('Share'),
                    onTap: () {
                      Share.share(AppConstant.SHARE_URL,
                          subject:
                              'Check out this Tibetan Language Learning  App.');
                      Navigator.pop(context);
                    },
                  ),
                  !kIsWeb
                      ? ListTile(
                          leading: const Icon(Icons.close, color: Colors.white),
                          title: const Text('Exit'),
                          onTap: () {
                            SystemNavigator.pop();
                          },
                        )
                      : Container(),
                ],
              ),
              Column(
                children: const [
                  Text('Made with ❤ with  KharagEdition'),
                  Text('Version: V.1.2.0'),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  static String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }

  static Future<void> launchInBrowser(url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  static void launchEmail(email, sub) async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: '$email',
      query: encodeQueryParameters(<String, String>{'subject': sub}),
    );
    launch(emailLaunchUri.toString());
  }

  _drawerAppBar(BuildContext context) => AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.chevron_left_outlined,
            color: Colors.white,
            size: 25,
          ),
        ),
        title: Container(
          padding: const EdgeInsets.all(10),
          child: const Text('Tibetan Prayer',
              style: TextStyle(
                fontSize: 20.0,
                fontFamily: 'jomolhari',
              )),
        ),
      );
}
