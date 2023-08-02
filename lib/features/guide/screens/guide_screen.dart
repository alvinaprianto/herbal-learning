import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hele/core/constants/color_constant.dart';

import '../../../core/constants/image_constant.dart';
import '../widgets/custom_button.dart';
import '../widgets/guide_widget.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final _controller = PageController();
  final _pages = const [
    OnBoardContentWidget(
      title: "Scan Tanaman",
      description: "Scan atau ambil foto dari galeri di handphone kamu",
      image: ImageConstant.onBoarding1,
    ),
    OnBoardContentWidget(
      title: "Dapatkan Hasil",
      description: "Dapatkan hasil tanaman yang sudah di scan",
      image: ImageConstant.onBoarding2,
    ),
    OnBoardContentWidget(
      title: "Detail Tanaman",
      description: "Lihat detail deskripsi dan manfaat tanaman",
      image: ImageConstant.onBoarding3,
    ),
  ];

  int _activePage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 60,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AnimatedOpacity(
                      opacity: _activePage > 0 ? 1.0 : 0.0,
                      duration: const Duration(milliseconds: 300),
                      child: GestureDetector(
                          onTap: () async {
                            _controller.animateToPage(
                              _activePage - 1,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeIn,
                            );
                          },
                          child: Icon(Icons.arrow_back)),
                    ),
                    AnimatedOpacity(
                      opacity: _activePage < _pages.length - 1 ? 1.0 : 0.0,
                      duration: const Duration(milliseconds: 300),
                      child: GestureDetector(
                        onTap: () async {
                          _controller.animateToPage(
                            _pages.length - 1,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeIn,
                          );
                        },
                        child: const Text(
                          "Skip",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 152),
            SizedBox(
              height: 335,
              child: PageView.builder(
                scrollBehavior: const ScrollBehavior(),
                controller: _controller,
                onPageChanged: (int page) {
                  setState(() {
                    _activePage = page;
                  });
                },
                itemCount: _pages.length,
                itemBuilder: (context, index) => _pages[index],
              ),
            ),
            const SizedBox(height: 74),
            Wrap(
              spacing: 10,
              alignment: WrapAlignment.center,
              children: List<Widget>.generate(
                _pages.length,
                (index) => InkWell(
                  onTap: () async {
                    _controller.animateToPage(
                      index,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeIn,
                    );
                  },
                  child: CircleAvatar(
                    radius: 5,
                    backgroundColor: _activePage == index
                        ? ColorConstant.primaryColor
                        : Colors.black,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
            AnimatedOpacity(
              opacity: _activePage == _pages.length - 1 ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 300),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: CustomButton(
                  onPressed: () => {
                    // if (_isLoggedIn())
                    //   {}
                    // else
                    //   Navigator.pushNamed(
                    //     context,
                    //     RoutePaths.navigationScreen,
                    //   )
                  },
                  child: const Text("Kembali ke Home"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool _isLoggedIn() {
    // @TODO: Check if user logged in or not
    return false;
  }
}
