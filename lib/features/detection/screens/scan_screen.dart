import 'dart:io';
import 'package:hele/core/constants/color_constant.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';
import 'package:flutter/material.dart';

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

  @override
  void initState() {
    super.initState();
    loadModel().then((value) {
      setState(() {});
    });
  }

  detectImage(File image) async {
    var output = await Tflite.runModelOnImage(
        path: image.path,
        numResults: 5,
        threshold: 0.5,
        imageMean: 127.5,
        imageStd: 127.5);
    setState(() {
      _output = output!;
      _loading = false;
    });
  }

  loadModel() async {
    await Tflite.loadModel(
        model: 'assets/tf/model_unquant.tflite',
        labels: 'assets/tf/labels2.txt');
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
        body: Container(
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
                    GestureDetector(
                      onTap: () {
                        pickImage();
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.7,
                        alignment: Alignment.center,
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 14),
                        decoration: BoxDecoration(
                          color: ColorConstant.primaryColor,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          'Capture a Photo',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text("Or"),
                    SizedBox(
                      height: 12,
                    ),
                    GestureDetector(
                      onTap: () {
                        pickGalleryImage();
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.7,
                        alignment: Alignment.center,
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 14),
                        decoration: BoxDecoration(
                          color: ColorConstant.primaryColor,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          'Select a Photo',
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
        ),
      ),
    );
  }
}
