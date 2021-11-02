import 'dart:io';
import 'dart:typed_data';
import 'package:path/path.dart' as path;
import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({Key? key}) : super(key: key);

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  File? _image;
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
          IconButton(onPressed: () {}, icon: Icon(Icons.upload)),
        ],
      ),
      body: _image == null
          ? Center(
              child: Text("tidak ada gambar"),
            )
          : Image.file(
              _image!,
              width: double.infinity,
              fit: BoxFit.fill,
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
    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
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
}
