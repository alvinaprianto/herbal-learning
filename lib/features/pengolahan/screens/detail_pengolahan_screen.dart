import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hele/core/constants/color_constant.dart';

import '../../../core/constants/image_constant.dart';
import '../../panduan/widgets/custom_button.dart';
import '../../panduan/widgets/panduan_widget.dart';

class DetailOlahTanaman extends StatefulWidget {
  const DetailOlahTanaman({super.key});

  @override
  State<DetailOlahTanaman> createState() => _DetailOlahTanamanState();
}

class _DetailOlahTanamanState extends State<DetailOlahTanaman> {
  final _controller = PageController();
  final _pages = const [
    OnBoardContentWidget(
      title: "Siapkan bahan",
      description: "Ambil beberapa lembar daun jambu biji",
      image: ImageConstant.olahJambuImage1,
    ),
    OnBoardContentWidget(
      title: "Haluskan",
      description: "Haluskan daun dengan ditumbuk atau diblender",
      image: ImageConstant.olahJambuImage2,
    ),
    OnBoardContentWidget(
      title: "Air",
      description: "Berikan air hangat matang di daun yang sudah dihaluskan",
      image: ImageConstant.olahJambuImage3,
    ),
    OnBoardContentWidget(
      title: "Minum",
      description: "Minum 3 kali sehari",
      image: ImageConstant.olahJambuImage4,
    ),
  ];

  int _activePage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leadingWidth: 30,
        title: const Text(
          "Daun Jambu Biji Obat Sakit Perut",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 1.5,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_sharp,
            color: Colors.black,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // SizedBox(
          //   height: 60,
          //   child: Padding(
          //     padding: const EdgeInsets.symmetric(horizontal: 24),
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //       crossAxisAlignment: CrossAxisAlignment.center,
          //       children: [
          //         AnimatedOpacity(
          //           opacity: _activePage > 0 ? 1.0 : 0.0,
          //           duration: const Duration(milliseconds: 300),
          //           child: GestureDetector(
          //               onTap: () async {
          //                 _controller.animateToPage(
          //                   _activePage - 1,
          //                   duration: const Duration(milliseconds: 300),
          //                   curve: Curves.easeIn,
          //                 );
          //               },
          //               child: Icon(Icons.arrow_back)),
          //         ),
          //         AnimatedOpacity(
          //           opacity: _activePage < _pages.length - 1 ? 1.0 : 0.0,
          //           duration: const Duration(milliseconds: 300),
          //           child: GestureDetector(
          //             onTap: () async {
          //               _controller.animateToPage(
          //                 _pages.length - 1,
          //                 duration: const Duration(milliseconds: 300),
          //                 curve: Curves.easeIn,
          //               );
          //             },
          //             child: const Text(
          //               "Skip",
          //               style: TextStyle(
          //                 fontSize: 14,
          //                 fontWeight: FontWeight.bold,
          //               ),
          //             ),
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          const SizedBox(height: 120),
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
    );
  }

  bool _isLoggedIn() {
    // @TODO: Check if user logged in or not
    return false;
  }
}
