import 'package:flutter/material.dart';
import 'package:hele/core/about/screens/about_navigation_screen.dart';
import 'package:hele/core/constants/icon_constant.dart';
import 'package:hele/core/home/screens/home_navigation_screen.dart';
import 'package:hele/features/article/screens/article_screen.dart';
import 'package:hele/core/constants/color_constant.dart';
import 'package:hele/features/detection/screens/scan_screen.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int _currentIndex = 0;
  late PageController _myPage;

  final List<Widget> _widgetOptions = [
    const HomeNavigationScreen(),
    const AboutNavigationScreen()
  ];

  @override
  void initState() {
    super.initState();
    _myPage = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 14,
          ),
          height: 75,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Column(
                  children: [
                    IconButton(
                      iconSize: 30.0,
                      icon: ImageIcon(
                        Svg(
                          IconConstant.homeNavigation,
                        ),
                        color: _currentIndex == 0
                            ? ColorConstant.primaryColor
                            : Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          _myPage.jumpToPage(0);
                        });
                      },
                    ),
                    Text(
                      "Home",
                      style: _currentIndex == 0
                          ? Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(color: ColorConstant.primaryColor)
                          : Theme.of(context).textTheme.bodySmall,
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 30),
                child: Column(
                  children: [
                    IconButton(
                      iconSize: 30.0,
                      icon: ImageIcon(
                        Svg(IconConstant.aboutAppNavigation),
                        color: _currentIndex == 1
                            ? ColorConstant.primaryColor
                            : Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          _myPage.jumpToPage(1);
                        });
                      },
                    ),
                    Text(
                      "About",
                      style: _currentIndex == 1
                          ? Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(color: ColorConstant.primaryColor)
                          : Theme.of(context).textTheme.bodySmall,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: PageView(
          controller: _myPage,
          onPageChanged: ((value) {
            setState(() {
              _currentIndex = value;
            });
          }),
          physics: const NeverScrollableScrollPhysics(),
          children: _widgetOptions),
      floatingActionButton: SizedBox(
        height: 65.0,
        width: 65.0,
        child: FittedBox(
          child: FloatingActionButton(
            tooltip: "Miner",
            backgroundColor: ColorConstant.primaryColor,
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => ScanScreen(title: "Hele")));
            },
            child: ImageIcon(
              Svg(
                IconConstant.scan,
              ),
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
