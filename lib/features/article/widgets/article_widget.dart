import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:shimmer/shimmer.dart';
import '../models/article_model.dart';

class CardArtikel extends StatefulWidget {
  const CardArtikel({
    super.key,
    required this.data,
  });

  final Article data;

  @override
  State<CardArtikel> createState() => _CardArtikelState();
}

class _CardArtikelState extends State<CardArtikel> {
  bool _loading = true;
  late Timer timer;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    timer = Timer(Duration(seconds: 3), () {
      setState(() {
        _loading = false;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20, top: 0),
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _loading
                  ? Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade100,
                      enabled: true,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          widget.data.image,
                          fit: BoxFit.cover,
                          height: 68.0,
                          width: 89.0,
                        ),
                      ),
                    )
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        widget.data.image,
                        fit: BoxFit.cover,
                        height: 68.0,
                        width: 89.0,
                      ),
                    ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    _loading
                        ? Shimmer.fromColors(
                            baseColor: Colors.grey.shade300,
                            highlightColor: Colors.grey.shade100,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2),
                                color: Colors.grey.shade300,
                              ),
                              margin:
                                  EdgeInsets.only(left: 10, bottom: 15, top: 0),
                              height: 12,
                              width: double.infinity,
                            ),
                          )
                        : Padding(
                            padding:
                                EdgeInsets.only(left: 10, bottom: 15, top: 0),
                            child: Text(
                              widget.data.title.toString(),
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 16,
                                fontFamily: 'poppins',
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.justify,
                            ),
                          ),
                    _loading
                        ? Shimmer.fromColors(
                            baseColor: Colors.grey.shade300,
                            highlightColor: Colors.grey.shade100,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2),
                                color: Colors.grey.shade300,
                              ),
                              margin: EdgeInsets.only(
                                  left: 10, bottom: 15, top: 10),
                              height: 12,
                              width: 100,
                            ),
                          )
                        : Padding(
                            padding: EdgeInsets.only(left: 10, top: 10),
                            child: Text(
                              widget.data.subtitle.toString(),
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'poppins',
                                  color: Colors.black54),
                            ),
                          ),
                  ],
                ),
              )
            ],
          ),
          Divider(
            thickness: 1,
            color: Colors.grey.shade300,
          )
        ],
      ),
    );
  }
}
