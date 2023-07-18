import 'package:hele/core/constants/image_constant.dart';

class Article {
  final String title;
  final String subtitle;
  final String image;
  final String sumber;

  const Article({
    required this.title,
    required this.subtitle,
    required this.image,
    required this.sumber,
  });
}

List<Article> informasi = const [
  Article(
    title: 'Manfaat Mengonsumsi Daun Jambu Biji',
    subtitle: 'Halodoc',
    image: ImageConstant.articleImage1,
    sumber:
        'https://www.halodoc.com/artikel/ketahui-manfaat-mengonsumsi-daun-jambu-biji',
  ),
  Article(
    title: 'Ketahui 6 Manfaat Daun Sirsak untuk Kesehatan Tubuh',
    subtitle: 'Halodoc',
    image: ImageConstant.articleImage2,
    sumber:
        'https://www.halodoc.com/artikel/ketahui-6-manfaat-daun-sirsak-untuk-kesehatan-tubuh',
  ),
  Article(
    title: 'Masih Jarang Diketahui, Ini 15 Manfaat Kunyit bagi Kesehatan',
    subtitle: 'Halodoc',
    image: ImageConstant.articleImage3,
    sumber:
        'https://www.halodoc.com/artikel/masih-jarang-diketahui-ini-15-manfaat-kunyit-bagi-kesehatan',
  ),
  Article(
    title: 'Ini 15 Manfaat Daun Sirih yang Masih Jarang Diketahui',
    subtitle: 'Halodoc',
    image: ImageConstant.articleImage4,
    sumber:
        'https://www.halodoc.com/artikel/ini-15-manfaat-daun-sirih-yang-masih-jarang-diketahui',
  ),
  Article(
    title:
        'Manfaat Daun Jambu Biji Bagi KesehatanKaya Serat dan Zat Besi, Ini 5 Manfaat Daun Kari',
    subtitle: 'Halodoc',
    image: ImageConstant.articleImage5,
    sumber:
        'https://www.halodoc.com/artikel/kaya-serat-dan-zat-besi-ini-5-manfaat-daun-kari',
  ),
  Article(
    title: 'Manfaat Daun Jambu Biji Bagi Kesehatan',
    subtitle: 'Edukasi Medis',
    image: 'assets/images/article_sample.jpeg',
    sumber: 'https://www.mitrakeluarga.com/artikel/tips-diet-sehat',
  ),
  Article(
    title: 'Manfaat Daun Jambu Biji Bagi Kesehatan',
    subtitle: 'Edukasi Medis',
    image: 'assets/images/article_sample.jpeg',
    sumber: 'https://www.mitrakeluarga.com/artikel/tips-diet-sehat',
  ),
  Article(
    title: 'Manfaat Daun Jambu Biji Bagi Kesehatan',
    subtitle: 'Edukasi Medis',
    image: 'assets/images/article_sample.jpeg',
    sumber: 'https://www.mitrakeluarga.com/artikel/tips-diet-sehat',
  ),
];
