import 'package:flutter/material.dart';
import 'package:hele/core/constants/color_constant.dart';
import 'package:hele/core/constants/icon_constant.dart';
import 'package:hele/core/constants/image_constant.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

import '../../../features/article/models/article_model.dart';
import '../../../features/article/widgets/article_widget.dart';

class HomeNavigationScreen extends StatefulWidget {
  const HomeNavigationScreen({super.key});

  @override
  State<HomeNavigationScreen> createState() => _HomeNavigationScreenState();
}

class _HomeNavigationScreenState extends State<HomeNavigationScreen> {
  final _information = informasi;
  final mapMenu = {
    IconConstant.cultivationMenu: "Cultivation",
    IconConstant.quizMenu: "Quiz",
    IconConstant.recipesMenu: "Recipes",
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                  mapMenu.length,
                  (index) => Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            margin: EdgeInsets.only(bottom: 10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                    color: ColorConstant.primaryColor
                                        .withOpacity(0.1),
                                    blurRadius: 10,
                                    offset: Offset(0, 3),
                                  ),
                                ]),
                            child: Image(
                                width: 32,
                                height: 32,
                                image: Svg(mapMenu.keys.elementAt(index))),
                          ),
                          Text(
                            mapMenu.values.elementAt(index),
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.w500),
                          )
                        ],
                      )),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Divider(
            thickness: 10,
            color: Colors.grey.withOpacity(0.1),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Herb Articles",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                Text(
                  "See All",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: ColorConstant.primaryColor),
                )
              ],
            ),
          ),
          ListView.builder(
            padding: EdgeInsets.only(bottom: 24),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 5,
            itemBuilder: ((context, index) {
              return CardArtikel(
                data: _information[index],
              );
            }),
          ),
        ],
      ),
    ));
  }
}
