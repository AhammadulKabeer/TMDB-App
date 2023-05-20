import 'package:apitmtpproject/controllers/addprofile.dart';
import 'package:apitmtpproject/view/loginpage/loginpage.dart';
import 'package:flutter/material.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({
    super.key,
  });

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50.0, bottom: 8, left: 10),
                child: Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    Text(
                      "Profiles & More",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                // color: Colors.amber,
                height: 155,
                child: GridView.builder(
                    shrinkWrap: true,
                    itemCount: profile().pro.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      // childAspectRatio: 1 / 1.4,
                      mainAxisExtent: 130,
                      mainAxisSpacing: 6,
                      crossAxisSpacing: 6,
                    ),
                    itemBuilder: (context, index) {
                      return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 4.0, vertical: 4),
                          child: Column(
                            children: [
                              SizedBox(
                                // color: Colors.amber,
                                width: 100,
                                height: 100,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.asset(
                                    profile().pro[index],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Text(
                                profile().proname[index],
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400),
                              )
                            ],
                          ));
                    }),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.edit,
                    size: 30,
                    color: Colors.white,
                  ),
                  Text(
                    "Manage Profile",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 30),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ExpansionTile(
                  onExpansionChanged: (value) {
                    setState(() {
                      tasExpanded = !value;
                    });
                  },
                  leading: const Icon(
                    Icons.notifications,
                    color: Colors.white,
                    size: 28,
                  ),
                  trailing: const Icon(
                    Icons.navigate_next,
                    color: Colors.white,
                  ),
                  title: const Text(
                    'Notifications',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              AnimatedCrossFade(
                firstChild: Column(
                  children: const [
                    Text(
                      'you are beautiful',
                      style: TextStyle(
                        fontSize: 50,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                secondChild: const SizedBox(),
                crossFadeState: tasExpanded
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
                duration: const Duration(milliseconds: 500),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ExpansionTile(
                  onExpansionChanged: (value) {
                    setState(() {
                      tbsExpanded = !value;
                    });
                  },
                  leading: const Icon(
                    Icons.library_books_sharp,
                    color: Colors.white,
                    size: 28,
                  ),
                  trailing: const Icon(
                    Icons.navigate_next,
                    color: Colors.white,
                  ),
                  title: const Text(
                    'My list',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              AnimatedCrossFade(
                firstChild: Column(
                  children: const [
                    Text(
                      'you can do it',
                      style: TextStyle(
                        fontSize: 50,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                secondChild: const SizedBox(),
                crossFadeState: tbsExpanded
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
                duration: const Duration(milliseconds: 500),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ExpansionTile(
                  onExpansionChanged: (value) {
                    setState(() {
                      tcsExpanded = !value;
                    });
                  },
                  leading: const Icon(
                    Icons.settings,
                    color: Colors.white,
                    size: 28,
                  ),
                  trailing: const Icon(
                    Icons.navigate_next,
                    color: Colors.white,
                  ),
                  title: const Text(
                    'App setting',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              AnimatedCrossFade(
                firstChild: Column(
                  children: const [
                    Text(
                      'dont lose hope',
                      style: TextStyle(
                        fontSize: 50,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                secondChild: const SizedBox(),
                crossFadeState: tcsExpanded
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
                duration: const Duration(milliseconds: 500),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ExpansionTile(
                  onExpansionChanged: (value) {
                    setState(() {
                      tdsExpanded = !value;
                    });
                  },
                  leading: const Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 28,
                  ),
                  trailing: const Icon(
                    Icons.navigate_next,
                    color: Colors.white,
                  ),
                  title: const Text(
                    'Account',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              AnimatedCrossFade(
                firstChild: Column(
                  children: const [
                    Text(
                      'allah with you',
                      style: TextStyle(
                        fontSize: 50,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                secondChild: const SizedBox(),
                crossFadeState: tdsExpanded
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
                duration: const Duration(milliseconds: 500),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ExpansionTile(
                  onExpansionChanged: (value) {
                    setState(() {
                      tesExpanded = !value;
                    });
                  },
                  leading: const Icon(
                    Icons.help_center_outlined,
                    color: Colors.white,
                    size: 28,
                  ),
                  trailing: const Icon(
                    Icons.navigate_next,
                    color: Colors.white,
                  ),
                  title: const Text(
                    'Help',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              AnimatedCrossFade(
                firstChild: Column(
                  children: const [
                    Text(
                      'try hard',
                      style: TextStyle(
                        fontSize: 50,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                secondChild: const SizedBox(),
                crossFadeState: tesExpanded
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
                duration: const Duration(milliseconds: 500),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 40.0),
                child: Center(
                  child: TextButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginPage(),
                            ),
                            (route) => false);
                      },
                      child: const Text(
                        "Sign Out",
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      )),
                ),
              )
            ],
          )
        ],
      )),
    );
  }

  bool tasExpanded = false;
  bool tbsExpanded = false;
  bool tcsExpanded = false;
  bool tdsExpanded = false;
  bool tesExpanded = false;
}
