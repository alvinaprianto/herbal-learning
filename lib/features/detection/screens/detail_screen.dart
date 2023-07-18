import 'package:flutter/material.dart';

import '../../../core/constants/color_constant.dart';
import '../../../core/constants/image_constant.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key, required this.mapDetail});

  final Map<String, dynamic> mapDetail;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Align(
            child: Image.asset(ImageConstant.topDetailDecoration),
            alignment: Alignment.topCenter,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 12, top: 32),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back_sharp,
                      color: Colors.white,
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
            ),
          ),
          SizedBox.expand(
            child: DraggableScrollableSheet(
                maxChildSize: 1,
                initialChildSize: 0.8,
                minChildSize: 0.75,
                // expand: true,
                builder: ((context, scrollController) {
                  return SingleChildScrollView(
                    controller: scrollController,
                    child: Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: new BorderRadius.only(
                          topLeft: const Radius.circular(25.0),
                          topRight: const Radius.circular(25.0),
                        ),
                        // boxShadow: [
                        //   BoxShadow(
                        //     color: Colors.grey.withOpacity(0.5),
                        //     spreadRadius: 1,
                        //     blurRadius: 1,
                        //     offset:
                        //         Offset(0, 1), // changes position of shadow
                        //   ),
                        // ],
                      ),
                      child: Column(children: [
                        Text(
                          "Jambu Biji",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w600),
                        ),
                        Container(
                          width: 350,
                          height: 300,
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            // boxShadow: [
                            //   BoxShadow(
                            //     color: ColorConstant.primaryColor
                            //         .withOpacity(0.2),
                            //     blurRadius: 10,
                            //     offset: Offset(0, 3),
                            //   ),
                            // ]
                          ),
                          child: Image.asset(
                            ImageConstant.detailJambuBiji,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Column(
                          children: List.generate(
                            widget.mapDetail.length,
                            (index) => Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 24),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.mapDetail.keys.elementAt(index),
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    widget.mapDetail.values.elementAt(index),
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
                      ]),
                    ),
                  );
                })),
          )
        ],
      ),
    );
  }
}
