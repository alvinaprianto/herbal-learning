import 'package:flutter/material.dart';
import 'package:hele/features/article/widgets/article_widget.dart';
import 'package:shimmer/shimmer.dart';
import '../models/article_model.dart';

class ArticleScreen extends StatefulWidget {
  const ArticleScreen({super.key});

  @override
  State<ArticleScreen> createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen> {
  final _information = informasi;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(bottom: 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                child: Image.asset(
                  "assets/images/logo2.png",
                  width: MediaQuery.of(context).size.width * 0.2,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height,
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 5,
                  itemBuilder: ((context, index) {
                    return CardArtikel(
                      data: _information[index],
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
