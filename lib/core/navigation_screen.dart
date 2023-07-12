import 'package:flutter/material.dart';
import 'package:hele/features/detection/screens/scan_screen.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int _currentIndex = 0;
  late PageController _myPage;

  final List<Widget> _widgetOptions = [
    const ScanScreen(title: "hele"),
    const ScanScreen(title: "hele"),    
  ];

  @override
  void initState() {
    super.initState();
    // setState(() {
    //   if (widget.param != null) {
    //     _currentIndex = widget.param!.selectedIndex;
    //     _myPage = PageController(initialPage: widget.param!.selectedIndex);
    //   } else {
    //     _myPage = PageController(initialPage: 0);
    //   }
    // });
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
              Column(
                children: [
                  IconButton(
                    iconSize: 30.0,
                    icon: ImageIcon(
                      Svg(
                        IconConstants.home,
                      ),
                      color: _currentIndex == 0
                          ? ColorConstants.primaryColor
                          : ColorConstants.darkGrey,
                    ),
                    // Icon(
                    //   Icons.home_outlined,
                    // color: _currentIndex == 0 ? primaryColor : Colors.white,
                    // ),
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
                            .copyWith(color: ColorConstants.primaryColor)
                        : Theme.of(context).textTheme.bodySmall,
                  )
                ],
              ),
              Column(
                children: [
                  IconButton(
                    iconSize: 30.0,
                    icon: ImageIcon(
                      Svg(
                        IconConstants.exchange,
                      ),
                      color: _currentIndex == 1
                          ? ColorConstants.primaryColor
                          : ColorConstants.darkGrey,
                    ),
                    onPressed: () {
                      setState(() {
                        _myPage.jumpToPage(1);
                      });
                    },
                  ),
                  Text(
                    "Exchange",
                    style: _currentIndex == 1
                        ? Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: ColorConstants.primaryColor)
                        : Theme.of(context).textTheme.bodySmall,
                  )
                ],
              ),
              const SizedBox(
                height: 28,
              ),
              Column(
                children: [
                  IconButton(
                    iconSize: 30.0,
                    icon: ImageIcon(
                      Svg(
                        IconConstants.wallet,
                      ),
                      color: _currentIndex == 2
                          ? ColorConstants.primaryColor
                          : ColorConstants.darkGrey,
                    ),
                    // icon: Image(
                    //   image: const Svg(icNavFocuse, size: Size(25, 25)),
                    //   color: _currentIndex == 2 ? primaryColor : Colors.white,
                    // ),
                    onPressed: () {
                      setState(() {
                        _myPage.jumpToPage(2);
                      });
                    },
                  ),
                  Text(
                    "Wallet",
                    style: _currentIndex == 2
                        ? Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: ColorConstants.primaryColor)
                        : Theme.of(context).textTheme.bodySmall,
                  )
                ],
              ),
              Column(
                children: [
                  IconButton(
                    iconSize: 30.0,
                    icon: ImageIcon(
                      Svg(
                        IconConstants.profile,
                      ),
                      color: _currentIndex == 3
                          ? ColorConstants.primaryColor
                          : ColorConstants.darkGrey,
                    ),
                    // icon: Image(
                    //   image: const Svg(icNavProfile, size: Size(25, 25)),
                    //   color: _currentIndex == 3 ? primaryColor : Colors.white,
                    // ),
                    onPressed: () {
                      setState(() {
                        _myPage.jumpToPage(3);
                      });
                    },
                  ),
                  Text(
                    "Profile",
                    style: _currentIndex == 3
                        ? Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: ColorConstants.primaryColor)
                        : Theme.of(context).textTheme.bodySmall,
                  )
                ],
              )
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
      // body: _widgetOptions.elementAt(_currentIndex),
      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: _currentIndex,
      //   showSelectedLabels: true,
      //   showUnselectedLabels: true,
      //   selectedItemColor: ColorConstants.primaryColor,
      //   unselectedItemColor: ColorConstants.darkGrey,
      //   items: const [
      //     BottomNavigationBarItem(
      // icon: ImageIcon(
      //   Svg(
      //     IconConstants.home,
      //   ),
      // ),
      //         label: "Home"),
      //     BottomNavigationBarItem(
      //         icon: ImageIcon(
      //           Svg(
      //             IconConstants.exchange,
      //           ),
      //         ),
      //         label: "Exchange"),
      //     BottomNavigationBarItem(
      //         icon: ImageIcon(
      //           Svg(
      //             IconConstants.wallet,
      //           ),
      //         ),
      //         label: "Wallet"),
      //     BottomNavigationBarItem(
      //         icon: ImageIcon(
      //           Svg(
      //             IconConstants.profile,
      //           ),
      //         ),
      //         label: "Profile"),
      //   ],
      //   onTap: (index) {
      //     setState(() {
      //       _currentIndex = index;
      //     });
      //   },
      // ),
      floatingActionButton: SizedBox(
        height: 65.0,
        width: 65.0,
        child: FittedBox(
          child: FloatingActionButton(
            tooltip: "Miner",
            backgroundColor: ColorConstants.primaryColor,
            onPressed: () {
              Navigator.of(context).pushNamed("activeminerscreen");
            },
            child: Image.asset(
              ImageConstants.miner,
              height: 30,
            ),
            // elevation: 5.0,
          ),
        ),
      ),
    );
  }

}
