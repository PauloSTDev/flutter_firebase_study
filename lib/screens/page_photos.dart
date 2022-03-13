import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PagePhotos extends StatefulWidget {
  const PagePhotos({Key? key}) : super(key: key);

  @override
  State<PagePhotos> createState() => _PagePhotosState();
}

class _PagePhotosState extends State<PagePhotos> {
  List<File> _image = [];
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Photos"),
        centerTitle: true,
        actions: [
          TextButton(onPressed: () {}, child: Text("Upload"))
        ],
      ),
      body: GridView.builder(
        itemCount: _image.length+1,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemBuilder: (context, index){
          return index == 0
              ? Center(
            child: IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                chooseImage();
              },
            ),
          ) : Container(
            margin: EdgeInsets.all(3),
            decoration: BoxDecoration(
                image: DecorationImage(image: FileImage(_image[index-1]))
            ),
          );
        },
      ),
    );
  }
  chooseImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image.add(File(pickedFile!.path));
    });
    if (pickedFile!.path == null) retrieveLostData();
  }

  Future<void> retrieveLostData() async {
    final LostDataResponse response = await picker.retrieveLostData();
    if (response.isEmpty) {
      return;
    }
    if (response.file != null) {
      setState(() {
        _image.add(File(response.file!.path));
      });
    } else {
      print(response.file);
    }
  }
}
