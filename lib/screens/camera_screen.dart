import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:async/async.dart';
import 'package:path/path.dart' as path;
import 'package:http/http.dart' as http;
import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:toast/toast.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({Key? key}) : super(key: key);

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  File? _image;
  bool? loading;
  final ImagePicker _picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("camera"),
        actions: [
          IconButton(
              onPressed: () {
                shareFile();
              },
              icon: Icon(Icons.share)),
          IconButton(
              onPressed: () {
                uploadFile(_image);
                setState(() {
                  loading = true;
                });
              },
              icon: Icon(Icons.upload)),
        ],
      ),
      body: _image == null
          ? Center(
              child: Text("tidak ada gambar"),
            )
          : Column(
              children: [
                Image.file(
                  _image!,
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
                loading == true ? CircularProgressIndicator() : Container()
              ],
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          tampilPilihan();
        },
        child: Icon(Icons.camera_alt),
      ),
    );
  }

  tampilPilihan() {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  GestureDetector(
                    child: Text("Take a photo"),
                    onTap: () {
                      getImageFromCamera();
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    child: Text("open photo from galery"),
                    onTap: () {
                      getImageFromGalery();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  Future<void> getImageFromCamera() async {
    // Capture a photo
    final XFile? photo =
        await _picker.pickImage(source: ImageSource.camera, imageQuality: 50);
    File file = File(photo!.path);
    setState(() {
      _image = file;
    });
    Navigator.pop(context);
  }

  Future<void> getImageFromGalery() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    File file = File(image!.path);
    setState(() {
      _image = file;
    });
    Navigator.pop(context);
  }

  shareFile() {
    getByteFromFile().then((value) {
      Share.file("Share Image file via :", path.basename(_image!.path),
          value.buffer.asUint8List(), "image/png");
    });
  }

  Future<ByteData> getByteFromFile() async {
    Uint8List bytes = File(_image!.path).readAsBytesSync() as Uint8List;
    return ByteData.view(bytes.buffer);
  }

  uploadFile(File? image) async {
    var stream = http.ByteStream(DelegatingStream.typed(_image!.openRead()));
    var length = await _image!.length();
    var uri =
        Uri.parse("http://192.168.100.69/db_makananlanjutan/uploadmakanan.php");
    var request = http.MultipartRequest("POST", uri);
    request.fields['vsnamamakanan'] = "nasi goreng";
    request.fields['vsiduser'] = "117";
    request.fields['vskategori'] = "nasi";
    request.fields['vstimeinsert'] = "2021.10.01 at 10:25:49";
    var multipartFile = http.MultipartFile("image", stream, length,
        filename: path.basename(_image!.path));
    request.files.add(multipartFile);
    var response = await request.send();
    print("response:" + response.statusCode.toString());
    response.stream.transform(utf8.decoder).listen((event) {
      setState(() {
        loading = false;
        Toast.show("Upload File Berhasil", context,
            duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
      });
      print("hasil:" + event);
    });
  }
}
