import 'package:flutter/material.dart';
import 'package:hele/core/constants/color_constant.dart';
import 'package:hele/core/constants/image_constant.dart';


class AboutNavigationScreen extends StatefulWidget {
  const AboutNavigationScreen({super.key});

  @override
  State<AboutNavigationScreen> createState() => _AboutNavigationScreenState();
}

class _AboutNavigationScreenState extends State<AboutNavigationScreen> {
  final mapAbout = {
    "Version": "1.0.0",
    "Description":
        """Hele App is a comprehensive herbal learning application designed to assist you in classifying and identifying various herbs and plants. Whether you are a passionate gardener, a herbal enthusiast, or simply curious about the world of plants, Hele App is here to provide you with a wealth of knowledge and guidance. Hele App is the ultimate companion for anyone seeking to deepen their understanding of herbs, plants, and gardening. Whether you're a beginner or an experienced herbalist, this app will inspire, educate, and empower you to create a greener, healthier, and more fulfilling connection with nature. Embark on a journey of herbal discovery with Hele App today!""",
    "Developers": '1. Alvin Aprianto 2. Bagas Miftahun Naim',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: Image.asset(ImageConstant.topHomeDecoration),
              ),
              Positioned(
                bottom: 10,
                right: 20,
                left: 20,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: 60,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: ColorConstant.primaryColor.withOpacity(0.2),
                          blurRadius: 16,
                          offset: Offset(1, 1),
                        ),
                      ]),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          ImageConstant.logoApp,
                          height: 40,
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              ImageConstant.logoTextApp,
                              height: 18,
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              "Herbal Learning",
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w400),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Column(
            children: List.generate(
              mapAbout.length,
              (index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      mapAbout.keys.elementAt(index),
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      mapAbout.values.elementAt(index),
                      style: TextStyle(
                          letterSpacing: 0.6,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: index == 0
                              ? ColorConstant.primaryColor
                              : Colors.black),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Divider(
                      thickness: 2,
                      color: Colors.grey.withOpacity(0.1),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
