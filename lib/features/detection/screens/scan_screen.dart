import 'dart:io';
import 'package:hele/core/constants/color_constant.dart';
import 'package:hele/features/detection/models/plant_model.dart';
import 'package:hele/features/detection/screens/detail_screen.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class ScanScreen extends StatefulWidget {
  const ScanScreen({super.key, required this.title});

  final String title;

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  bool _loading = true;
  File _image = File("");
  List _output = [];
  final picker = ImagePicker();

//   final mapJambuBiji = {
//     "Family": "Myrtaceae",
//     "Ilmiah Name": "Psidium Guajava",
//     "Description":
//         """Jambu biji adalah pohon berdaun hijau yang tumbuh hingga ketinggian sekitar 5-10 meter. Tanaman ini memiliki batang yang berkulit halus dan berwarna cokelat. Daunnya berbentuk lonjong dan memiliki ujung meruncing, dengan warna hijau tua mengkilap di bagian atas dan hijau pucat di bagian bawah. Bunganya berwarna putih dengan benang sari kuning yang menonjol. Buah jambu biji adalah buah yang bulat atau pear-shaped, dengan kulit tipis yang bisa berwarna hijau, kuning, atau merah muda, tergantung pada varietasnya. Daging buahnya berwarna putih atau merah muda dengan biji-biji kecil di dalamnya.""",
//     "Benefits":
//         '''Kaya akan Vitamin C: Jambu biji merupakan sumber yang baik dari vitamin C, yang berperan penting dalam meningkatkan sistem kekebalan tubuh, melawan infeksi, dan mempercepat penyembuhan luka.
// Serat makanan: Jambu biji mengandung serat makanan yang tinggi, membantu meningkatkan pencernaan, mencegah sembelit, dan menjaga kesehatan usus.
// Antioksidan: Buah jambu biji mengandung senyawa antioksidan seperti likopen, karotenoid, dan vitamin C, yang melindungi sel-sel tubuh dari kerusakan akibat radikal bebas dan berkontribusi pada kesehatan jantung dan pencegahan kanker.
// Menurunkan Risiko Diabetes: Jambu biji memiliki indeks glikemik rendah, sehingga dapat membantu mengendalikan kadar gula darah dan menurunkan risiko diabetes tipe 2.
// Sumber energi: Buah jambu biji mengandung karbohidrat yang mudah dicerna dan memberikan energi yang dibutuhkan oleh tubuh.
// Menjaga Kesehatan Mata: Jambu biji mengandung vitamin A, vitamin C, dan antioksidan lutein yang baik untuk menjaga kesehatan mata, mencegah degenerasi makula, dan mengurangi risiko katarak.
// Menyegarkan Kulit: Buah jambu biji dapat digunakan sebagai bahan alami untuk perawatan kulit. Masker jambu biji dapat membantu membersihkan kulit, mengurangi jerawat, dan memberikan kelembapan.''',
//   };

//   final mapSirih = {
//     "Family": "Piperaceae",
//     "Ilmiah Name": "Piper betle",
//     "Description":
//         """Daun sirih adalah tanaman merambat yang memiliki daun hijau mengkilap dan berbentuk hati atau memanjang. Tanaman ini sering ditemukan di wilayah tropis Asia Tenggara. Daunnya memiliki aroma khas yang harum dan sedikit pedas. Daun sirih biasanya digunakan dalam praktik tradisional dan budaya, termasuk dalam upacara keagamaan, pengobatan tradisional, dan sebagai bahan untuk membuat makanan atau minuman.""",
//     "Benefits":
//         '''Khasiat Antiinflamasi: Daun sirih mengandung senyawa aktif seperti eugenol dan kavikol, yang memiliki sifat antiinflamasi dan dapat membantu meredakan peradangan pada tubuh.
// Sifat Antimikroba: Daun sirih memiliki sifat antimikroba yang kuat dan telah digunakan secara tradisional untuk membantu melawan infeksi bakteri dan jamur. Ekstrak daun sirih sering digunakan dalam pembuatan obat kumur dan pasta gigi untuk membantu menjaga kesehatan mulut dan gigi.
// Melawan Bau Mulut: Kandungan senyawa aktif dalam daun sirih dapat membantu menghilangkan bau mulut yang tidak sedap dan mengurangi pertumbuhan bakteri penyebab bau mulut.
// Menyembuhkan Luka: Daun sirih memiliki sifat antiseptik dan dapat membantu mempercepat penyembuhan luka. Ekstrak daun sirih sering digunakan dalam bentuk krim atau salep untuk merawat luka atau luka bakar ringan.
// Efek Pembersih dan Detoksifikasi: Mengunyah daun sirih secara tradisional dianggap dapat membersihkan mulut dan sistem pencernaan, serta membantu dalam proses detoksifikasi tubuh.''',
//   };

//   final mapKari = {
//     "Family": "Rutaceae",
//     "Ilmiah Name": "Murraya koenigii",
//     "Description":
//         """Daun kari adalah daun yang berasal dari tanaman berkelamin tunggal yang tumbuh di wilayah Asia Selatan dan Tenggara. Tanaman ini memiliki batang kecil dan daun majemuk berbentuk pinnate, yang terdiri dari 11 hingga 21 daun kecil yang tersusun berpasangan. Daun kari memiliki aroma yang khas dan tajam, dengan sentuhan citrus. Biasanya digunakan sebagai bumbu dalam masakan India, terutama dalam hidangan kari, serta dalam berbagai hidangan Asia Selatan dan Tenggara.""",
//     "Benefits":
//         '''Kandungan Nutrisi: Daun kari mengandung berbagai nutrisi penting seperti vitamin A, vitamin C, vitamin B, kalsium, fosfor, zat besi, serat, dan antioksidan, yang memberikan manfaat kesehatan.
// Menyehatkan Pencernaan: Daun kari dapat membantu meningkatkan pencernaan dan meredakan masalah pencernaan seperti gangguan perut, sembelit, dan gangguan pencernaan lainnya.
// Efek Antiinflamasi: Daun kari memiliki sifat antiinflamasi dan dapat membantu mengurangi peradangan dalam tubuh, mengurangi gejala arthritis, dan meredakan nyeri sendi.''',
//   };

//   final mapKunyit = {
//     "Family": "Zingiberaceae",
//     "Ilmiah Name": "Curcuma longa",
//     "Description":
//         """Kunyit adalah tanaman rimpang yang berasal dari Asia Selatan. Tanaman ini memiliki daun berbentuk panjang, berwarna hijau, dan tumbuh sejajar dengan tanah. Bagian yang paling terkenal dari kunyit adalah rimpangnya yang berwarna jingga keemasan. Rimpang kunyit memiliki aroma yang kuat dan khas serta rasa yang sedikit pahit dan pedas. Kunyit sering digunakan sebagai bumbu dalam masakan, terutama dalam hidangan Asia Tenggara dan India, dan juga memiliki penggunaan tradisional dalam pengobatan herbal.""",
//     "Benefits":
//         '''Sifat Antiinflamasi: Kunyit mengandung senyawa aktif bernama kurkumin, yang memiliki sifat antiinflamasi dan dapat membantu meredakan peradangan dalam tubuh. Ini dapat bermanfaat dalam mengurangi gejala arthritis, nyeri sendi, dan kondisi inflamasi lainnya.
// Antioksidan yang Kuat: Kurkumin dalam kunyit juga memiliki sifat antioksidan yang kuat. Antioksidan membantu melindungi sel-sel tubuh dari kerusakan akibat radikal bebas, yang dapat menyebabkan penuaan dini dan berbagai penyakit.
// Mendukung Kesehatan Jantung: Kunyit dapat membantu menjaga kesehatan jantung dengan mengurangi risiko penyakit jantung. Kurkumin dalam kunyit telah dikaitkan dengan penurunan kadar kolesterol, pengurangan pembentukan plak di arteri, dan penurunan risiko trombosis.
// Membantu Pencernaan: Kunyit telah digunakan secara tradisional untuk meredakan masalah pencernaan seperti perut kembung, gangguan pencernaan, dan perut mulas. Senyawa dalam kunyit dapat membantu meningkatkan produksi empedu dan merangsang aktivitas enzim pencernaan.''',
//   };

//   final mapSirsak = {
//     "Family": "Annonaceae",
//     "Ilmiah Name": "Annona muricata",
//     "Description":
//         """Sirsak adalah pohon yang tumbuh di daerah tropis Amerika Latin dan beberapa wilayah Asia Tenggara. Pohon sirsak memiliki daun yang hijau gelap dan berbentuk oval. Buahnya berukuran besar, dengan kulit yang berduri dan berwarna hijau. Daging buahnya putih, lembut, dan berair, dengan biji-biji hitam di dalamnya. Sirsak memiliki rasa manis dan asam yang unik serta aroma yang khas.""",
//     "Benefits":
//         '''Kaya akan Nutrisi: Buah sirsak mengandung berbagai nutrisi penting, termasuk vitamin C, vitamin B, serat, kalsium, fosfor, dan zat besi. Konsumsi buah sirsak dapat membantu memenuhi kebutuhan nutrisi harian.
// Antioksidan yang Kuat: Buah sirsak kaya akan senyawa antioksidan, seperti acetogenins, flavonoid, dan vitamin C. Antioksidan membantu melindungi sel-sel tubuh dari kerusakan akibat radikal bebas dan peradangan, serta berkontribusi pada kesehatan jantung dan sistem kekebalan tubuh yang kuat.
// Meningkatkan Sistem Kekebalan Tubuh: Kandungan vitamin C dalam sirsak dapat membantu meningkatkan sistem kekebalan tubuh, melawan infeksi, dan meningkatkan produksi kolagen untuk kesehatan kulit.
// Mendukung Kesehatan Jantung: Beberapa studi menunjukkan bahwa senyawa dalam sirsak dapat membantu menjaga kesehatan jantung. Sirsak dapat membantu menurunkan tekanan darah, mengurangi peradangan, dan menjaga keseimbangan kolesterol dalam tubuh.
// Potensi Anti Kanker: Sirsak telah menjadi subjek penelitian karena potensi anti kanker. Beberapa penelitian menunjukkan bahwa senyawa dalam sirsak dapat menghambat pertumbuhan sel kanker, menginduksi apoptosis (kematian sel kanker), dan menghambat perkembangan tumor.''',
//   };

  Future<List<PlantModel>?> readJsonData() async {
    try {
      String jsonString =
          await rootBundle.loadString('assets/json/model/model_tanaman.json');
      final jsonData = json.decode(jsonString);

      List<dynamic> tanamanData = jsonData;
      List<PlantModel> tempList = [];
      for (var item in tanamanData) {
        tempList.add(PlantModel.fromJson(item));
      }
      print(tempList);
      return tempList;
    } catch (e) {
      print(e);
    }
    return null;
  }

  late Future<List<PlantModel>?> futurePlantModel;

  @override
  void initState() {
    super.initState();
    futurePlantModel = readJsonData();
    setState(() {
      _loading = true;
    });
    loadModel().then((value) {
      setState(() {});
    });
  }

  detectImage(File image) async {
    var output = await Tflite.runModelOnImage(
        path: image.path,
        numResults: 24,
        threshold: 0.8,
        imageMean: 224,
        imageStd: 224);
    setState(() {
      _output = output!;
      _loading = false;
    });
  }

  loadModel() async {
    await Tflite.loadModel(
        model: 'assets/tf/model_last.tflite',
        labels: 'assets/tf/labels_last.txt');
  }

  @override
  void dispose() {
    super.dispose();
  }

  pickImage() async {
    var image = await picker.getImage(source: ImageSource.camera);
    // if(image == null) return null;

    setState(() {
      if (image != null) {
        _image = File(image.path);
      } else {
        return null;
      }
    });

    detectImage(_image);
  }

  pickGalleryImage() async {
    var image = await picker.getImage(source: ImageSource.gallery);
    if (image == null) return null;

    setState(() {
      _image = File(image.path);
    });

    detectImage(_image);
  }

  @override
  Widget build(BuildContext context) {
    print(_output.toString() + "TEST");
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leadingWidth: 30,
          title: const Text(
            "Scan",
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
        body: FutureBuilder(
            future: futurePlantModel,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: _loading
                            ? Container(
                                width: 350,
                                height: 300,
                                child: Column(
                                  children: [
                                    Image.asset(
                                      'assets/images/holder_image.png',
                                      fit: BoxFit.cover,
                                    ),
                                    SizedBox(
                                      height: 50,
                                    )
                                  ],
                                ),
                              )
                            : Container(
                                child: Column(
                                  children: [
                                    Container(
                                      width: 350,
                                      height: 300,
                                      padding: EdgeInsets.all(12),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          boxShadow: [
                                            BoxShadow(
                                              color: ColorConstant.primaryColor
                                                  .withOpacity(0.2),
                                              blurRadius: 10,
                                              offset: Offset(0, 3),
                                            ),
                                          ]),
                                      child: Image.file(
                                        _image,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      _output.length == 0
                                          ? "Unclassified image. Please try again"
                                          : '${_output[0]['label']}',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    )
                                  ],
                                ),
                              ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 40),
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          children: [
                            Visibility(
                              visible: !_loading && _output.length == 0
                                  ? false
                                  : true,
                              child: GestureDetector(
                                onTap: () {
                                  _loading
                                      ? pickImage()
                                      : Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  DetailScreen(mapDetail: () {
                                                    return snapshot.data!
                                                        .elementAt(_output[0]
                                                            ['index']);
                                                  }())));
                                },
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.7,
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 14),
                                  decoration: BoxDecoration(
                                    color: ColorConstant.primaryColor,
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Text(
                                    _loading ? 'Capture a Photo' : 'See Detail',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            !_loading && _output.length == 0
                                ? Container()
                                : Text("Or"),
                            SizedBox(
                              height: 12,
                            ),
                            GestureDetector(
                              onTap: () {
                                if (_loading) {
                                  pickGalleryImage();
                                } else {
                                  _image.delete();
                                  setState(() {
                                    _loading = true;
                                  });
                                }
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.7,
                                alignment: Alignment.center,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 14),
                                decoration: BoxDecoration(
                                  color: ColorConstant.primaryColor,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Text(
                                  _loading ? 'Select a Photo' : "Retry",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              } else {
                return CircularProgressIndicator();
              }
            }),
      ),
    );
  }
}
