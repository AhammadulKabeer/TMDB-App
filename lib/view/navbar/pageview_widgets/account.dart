import 'package:apitmtpproject/constants/size.dart';
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
    double maxWidth = MediaQuery.of(context).size.width;
    double maxHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: maxHeight * (50 / Sizex.currentHeight),
                    bottom: maxHeight * (8 / Sizex.currentHeight),
                    left: maxWidth * (10 / Sizex.currentWidth)),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: maxWidth * (8 / Sizex.currentWidth)),
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: maxWidth * (30 / Sizex.currentWidth),
                      ),
                    ),
                    Text(
                      "Profiles & More",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: maxWidth * (25 / Sizex.currentWidth),
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: maxHeight * (10 / Sizex.currentHeight),
              ),
              SizedBox(
                // color: Colors.amber,
                height: maxHeight * (155 / Sizex.currentHeight),
                child: GridView.builder(
                    shrinkWrap: true,
                    itemCount: profile().pro.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      // childAspectRatio: 1 / 1.4,
                      mainAxisExtent: maxHeight * (140 / Sizex.currentHeight),
                      mainAxisSpacing: maxWidth * (6 / Sizex.currentWidth),
                      crossAxisSpacing: maxWidth * (6 / Sizex.currentWidth),
                    ),
                    itemBuilder: (context, index) {
                      return Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: maxWidth * (4 / Sizex.currentWidth),
                            vertical: maxHeight * (4 / Sizex.currentHeight),
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                // color: Colors.amber,
                                width: maxWidth * (100 / Sizex.currentWidth),
                                height: maxHeight * (100 / Sizex.currentHeight),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                      maxWidth * (15 / Sizex.currentWidth)),
                                  child: Image.asset(
                                    profile().pro[index],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Text(
                                profile().proname[index],
                                style: TextStyle(
                                    fontSize:
                                        maxWidth * (14 / Sizex.currentWidth),
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400),
                              )
                            ],
                          ));
                    }),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.edit,
                    size: maxWidth * (30 / Sizex.currentWidth),
                    color: Colors.white,
                  ),
                  Text(
                    "Manage Profile",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: maxWidth * (30 / Sizex.currentWidth)),
                  )
                ],
              ),
              SizedBox(
                height: maxHeight * (20 / Sizex.currentHeight),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: maxWidth * (10 / Sizex.currentWidth),
                  vertical: maxHeight * (10 / Sizex.currentHeight),
                ),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(
                      maxWidth * (10 / Sizex.currentWidth)),
                ),
                child: ExpansionTile(
                  onExpansionChanged: (value) {
                    setState(() {
                      tasExpanded = !value;
                    });
                  },
                  leading: Icon(
                    Icons.notifications,
                    color: Colors.white,
                    size: maxWidth * (28 / Sizex.currentWidth),
                  ),
                  trailing: Icon(
                    Icons.navigate_next,
                    color: Colors.white,
                    size: maxWidth * (30 / Sizex.currentWidth),
                  ),
                  title: Text(
                    'Notifications',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: maxWidth * (20 / Sizex.currentWidth),
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              AnimatedCrossFade(
                firstChild: Column(
                  children: [
                    Text(
                      'you are beautiful',
                      style: TextStyle(
                        fontSize: maxWidth * (50 / Sizex.currentWidth),
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
                margin: EdgeInsets.symmetric(
                  horizontal: maxWidth * (10 / Sizex.currentWidth),
                  vertical: maxHeight * (10 / Sizex.currentHeight),
                ),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(
                      maxWidth * (10 / Sizex.currentWidth)),
                ),
                child: ExpansionTile(
                  onExpansionChanged: (value) {
                    setState(() {
                      tbsExpanded = !value;
                    });
                  },
                  leading: Icon(
                    Icons.library_books_sharp,
                    color: Colors.white,
                    size: maxWidth * (28 / Sizex.currentWidth),
                  ),
                  trailing: Icon(
                    Icons.navigate_next,
                    color: Colors.white,
                    size: maxWidth * (30 / Sizex.currentWidth),
                  ),
                  title: Text(
                    'My list',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: maxWidth * (20 / Sizex.currentWidth),
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              AnimatedCrossFade(
                firstChild: Column(
                  children: [
                    Text(
                      'you can do it',
                      style: TextStyle(
                        fontSize: maxWidth * (50 / Sizex.currentWidth),
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
                margin: EdgeInsets.symmetric(
                  horizontal: maxWidth * (10 / Sizex.currentWidth),
                  vertical: maxHeight * (10 / Sizex.currentHeight),
                ),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(
                      maxWidth * (10 / Sizex.currentWidth)),
                ),
                child: ExpansionTile(
                  onExpansionChanged: (value) {
                    setState(() {
                      tcsExpanded = !value;
                    });
                  },
                  leading: Icon(
                    Icons.settings,
                    color: Colors.white,
                    size: maxWidth * (28 / Sizex.currentWidth),
                  ),
                  trailing: Icon(
                    Icons.navigate_next,
                    color: Colors.white,
                    size: maxWidth * (30 / Sizex.currentWidth),
                  ),
                  title: Text(
                    'App setting',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: maxWidth * (20 / Sizex.currentWidth),
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              AnimatedCrossFade(
                firstChild: Column(
                  children: [
                    Text(
                      'dont lose hope',
                      style: TextStyle(
                        fontSize: maxWidth * (50 / Sizex.currentWidth),
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
                margin: EdgeInsets.symmetric(
                    horizontal: maxWidth * (10 / Sizex.currentWidth),
                    vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(
                      maxWidth * (10 / Sizex.currentWidth)),
                ),
                child: ExpansionTile(
                  onExpansionChanged: (value) {
                    setState(() {
                      tdsExpanded = !value;
                    });
                  },
                  leading: Icon(
                    Icons.person,
                    color: Colors.white,
                    size: maxWidth * (28 / Sizex.currentWidth),
                  ),
                  trailing: Icon(
                    Icons.navigate_next,
                    color: Colors.white,
                    size: maxWidth * (30 / Sizex.currentWidth),
                  ),
                  title: Text(
                    'Account',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: maxWidth * (20 / Sizex.currentWidth),
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              AnimatedCrossFade(
                firstChild: Column(
                  children: [
                    Text(
                      'allah with you',
                      style: TextStyle(
                        fontSize: maxWidth * (50 / Sizex.currentWidth),
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
                margin: EdgeInsets.symmetric(
                  horizontal: maxWidth * (10 / Sizex.currentWidth),
                  vertical: maxHeight * (10 / Sizex.currentHeight),
                ),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(
                      maxWidth * (10 / Sizex.currentWidth)),
                ),
                child: ExpansionTile(
                  onExpansionChanged: (value) {
                    setState(() {
                      tesExpanded = !value;
                    });
                  },
                  leading: Icon(
                    Icons.help_center_outlined,
                    color: Colors.white,
                    size: maxWidth * (28 / Sizex.currentWidth),
                  ),
                  trailing: Icon(
                    Icons.navigate_next,
                    color: Colors.white,
                    size: maxWidth * (30 / Sizex.currentWidth),
                  ),
                  title: Text(
                    'Help',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: maxWidth * (20 / Sizex.currentWidth),
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              AnimatedCrossFade(
                firstChild: Column(
                  children: [
                    Text(
                      'try hard',
                      style: TextStyle(
                        fontSize: maxWidth * (50 / Sizex.currentWidth),
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                secondChild: SizedBox(),
                crossFadeState: tesExpanded
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
                duration: Duration(milliseconds: 500),
              ),
              Padding(
                padding: EdgeInsets.only(
                  bottom: maxHeight * (40 / Sizex.currentHeight),
                ),
                child: Center(
                  child: TextButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginPage(),
                            ),
                            (route) => false);
                      },
                      child: Text(
                        "Sign Out",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: maxWidth * (25 / Sizex.currentWidth)),
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
