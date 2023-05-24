import 'package:apitmtpproject/constants/size.dart';
import 'package:apitmtpproject/providers/provider.dart';
import 'package:apitmtpproject/view/navbar/pageview_widgets/account.dart';
import 'package:apitmtpproject/view/navbar/pageview_widgets/home.dart';

import 'package:apitmtpproject/view/navbar/pageview_widgets/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double maxWidth = MediaQuery.of(context).size.width;
    double maxHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      extendBody: true,
      body: PageView(
        controller: ref.watch(pageProvider),
        onPageChanged: (value) {
          ref.read(bottomprovider.notifier).state = value;
        },
        children: [
          HomePageview(),
          SearchPage(),
          AccountPage(),
        ],
      ),
      bottomNavigationBar: Padding(
        padding:
            EdgeInsets.only(bottom: maxHeight * (40 / Sizex.currentHeight)),
        child: Card(
          shape: BeveledRectangleBorder(
            borderRadius:
                BorderRadius.circular(maxWidth * (20 / Sizex.currentWidth)),
          ),
          child: BottomNavigationBar(
              elevation: 0,
              selectedItemColor: Colors.black,
              unselectedItemColor: Colors.grey,
              currentIndex: ref.watch(bottomprovider),
              onTap: (value) {
                ref.read(bottomprovider.notifier).state = value;
                ref.watch(pageProvider).animateToPage(value,
                    duration: Duration(milliseconds: 10), curve: Curves.easeIn);
              },
              backgroundColor: Colors.transparent,
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.home,
                      size: maxWidth * (30 / Sizex.currentWidth),
                    ),
                    label: ""),
                BottomNavigationBarItem(
                    icon: Icon(Icons.search,
                        size: maxWidth * (30 / Sizex.currentWidth)),
                    label: ""),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person,
                        size: maxWidth * (30 / Sizex.currentWidth)),
                    label: ""),
              ]),
        ),
      ),
    );
  }
}
