import 'package:flutter/material.dart';
import 'package:flutter_intern_task/custom/custom_page_view.dart';
import 'package:flutter_svg/svg.dart';

import 'custom/custom_grid_cart.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  final List<Map<String, dynamic>> _outline = [
    {
      "icon": Icons.mobile_friendly_sharp,
      "title": "Apps",
      "color": Color(0xFFF9F5FF),
    },
    {"icon": Icons.web, "title": "Websites", "color": Color(0xFFFDF2FA)},
    {
      "icon": Icons.design_services,
      "title": "Designs",
      "color": Color(0xFFFFFAF5)
    },
    {
      "icon": Icons.person_outline_rounded,
      "title": "Consultant",
      "color": Color(0xFFF0F9FF)
    },
  ];

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController(initialPage: 0);
// the index of the current page
  int _activePage = 0;

  final List<Widget> _pages = [
    CustomePageViewCart(),
    CustomePageViewCart(),
    CustomePageViewCart()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: SvgPicture.asset(
                      'assets/images/logo.svg', // Replace with the path to your SVG file
                      width: 48, // Set the width of the SVG
                      height: 48, // Set the height of the SVG
                    ),
                  ),
                  Text(
                    "Suvaye",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
            Spacer(),
            IconButton(
                onPressed: () {},
                icon: Icon(Icons.notifications_none, size: 30))
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hello Suvaye Tech",
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF371B34)),
              ),
              SizedBox(
                height: 20,
              ),

              Container(
                height: 28,
                child: Row(
                  children: [
                    Text(
                      "Services",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Text(
                      "See more",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF027A48)),
                    ),
                    Icon(Icons.chevron_right_sharp)
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              // Page View---------------------------
              SizedBox(
                height: 128,
                child: PageView.builder(
                    controller: _pageController,
                    onPageChanged: (int page) {
                      setState(() {
                        _activePage = page;
                      });
                    },
                    itemCount: _pages.length,
                    itemBuilder: (BuildContext context, int index) {
                      return _pages[index % _pages.length];
                    }),
              ),
              SizedBox(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List<Widget>.generate(
                    _pages.length,
                    (index) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: InkWell(
                        onTap: () {
                          _pageController.animateToPage(index,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeIn);
                        },
                        child: CircleAvatar(
                          radius: 3,
                          backgroundColor: _activePage == index
                              ? Colors.grey[400]
                              : Colors.grey[200],
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              // outline------
              Container(
                height: 28,
                child: Row(
                  children: [
                    Text(
                      "Outline",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Text(
                      "See more",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF027A48)),
                    ),
                    Icon(Icons.chevron_right_sharp)
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),

              // Grid view------------------------------------------------
              GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  mainAxisExtent: 56,
                ),
                itemBuilder: (context, index) {
                  return CustomGridCart(
                    icon: widget._outline[index]["icon"],
                    title: widget._outline[index]["title"],
                    color: widget._outline[index]["color"],
                  );
                },
                itemCount: widget._outline.length,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
