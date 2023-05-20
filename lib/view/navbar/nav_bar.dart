import 'package:apitmtpproject/providers/provider.dart';
import 'package:apitmtpproject/view/navbar/pageview_widgets/account.dart';
import 'package:apitmtpproject/view/navbar/pageview_widgets/home.dart';
import 'package:apitmtpproject/view/navbar/pageview_widgets/moview.dart';
import 'package:apitmtpproject/view/navbar/pageview_widgets/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
        padding: const EdgeInsets.only(bottom: 40.0),
        child: Card(
          shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: BottomNavigationBar(
              elevation: 0,
              selectedItemColor: Colors.black,
              unselectedItemColor: Colors.grey,
              currentIndex: ref.watch(bottomprovider),
              onTap: (value) {
                ref.read(bottomprovider.notifier).state = value;
                ref.read(pageProvider.notifier).state.animateToPage(value,
                    duration: Duration(milliseconds: 10), curve: Curves.easeIn);
              },
              backgroundColor: Colors.transparent,
              type: BottomNavigationBarType.fixed,
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.home,
                      size: 30,
                    ),
                    label: ""),
                BottomNavigationBarItem(
                    icon: Icon(Icons.search, size: 30), label: ""),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person, size: 30), label: ""),
              ]),
        ),
      ),
    );
  }
}
