import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:fyp_plant_identification/models/cure.dart';
import 'dart:async';
import 'package:tflite/tflite.dart';
import 'package:image_picker/image_picker.dart';

//////A trained model was used to create the plant disease detection using tflite

//////the code here mostly involves using the trained model

class PlantHealth extends StatefulWidget {
  @override
  _PlantHealthState createState() => _PlantHealthState();
}

class _PlantHealthState extends State<PlantHealth> {
  File _image;
  List _recognitions;
  String diseaseName = "";
  bool _busy = false;

  Future _showDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            backgroundColor: Colors.white,
            title: Text(
              "Make a choice! ",
              style: TextStyle(
                color: Theme.of(context).accentColor,
                fontSize: 15,
              ),
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  GestureDetector(
                    child: Row(
                      children: [
                        Text(
                          "Gallery ",
                          style: TextStyle(
                            color: Theme.of(context).accentColor,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(width: 8),
                        Icon(Icons.insert_photo_rounded),
                      ],
                    ),
                    onTap: () {
                      predictImagePickerGallery(context);
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                  ),
                  GestureDetector(
                    child: Row(
                      children: [
                        Text(
                          "Camera",
                          style: TextStyle(
                            color: Theme.of(context).accentColor,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(width: 8),
                        Icon(Icons.photo_camera_rounded),
                      ],
                    ),
                    onTap: () {
                      predictImagePickerCamera(context);
                    },
                  )
                ],
              ),
            ),
          );
        });
  }

//////the functions for selecting image from gallery and camera are below...

  Future<void> predictImagePickerGallery(BuildContext context) async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (image == null) return;
    setState(() {
      _busy = true;
      _image = image;
    });
    Navigator.of(context).pop();
    recognizeImage(image);
  }

  Future<void> predictImagePickerCamera(BuildContext context) async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    if (image == null) return;
    setState(() {
      _busy = true;
      _image = image;
    });
    Navigator.of(context).pop();
    recognizeImage(image);
  }

//////..it ends here

////// codes for loading and using the model
  @override
  void initState() {
    super.initState();

    _busy = true;

    loadModel().then((val) {
      setState(() {
        _busy = false;
      });
    });
  }

//////loading the model
  Future loadModel() async {
    try {
      await Tflite.loadModel(
        model: "assets/Tanmay_final_model.tflite",
        labels: "assets/Labels.txt",
      );
    } on PlatformException {
      print('Failed to load model.');
    }
  }

  Future recognizeImage(File image) async {
    var recognitions = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 6,
      threshold: 0.05,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    setState(() {
      _busy = false;
      _recognitions = recognitions;
    });
  }

//////function for getting the results from the Cure class with plant diseases
  handleCure() {
    // Navigator.of(context).push(MaterialPageRoute(
    showDialog(context: context, builder: (context) => Cure(diseaseName));
    // ));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<Widget> stackChildren = [];

//////the code below shows the UI seen on the plant disease detection screen..
    stackChildren.add(Positioned(
      top: 0.0,
      left: 0.0,
      width: size.width,
      child: _image == null
          ? Text(
              'No image selected.',
              style: TextStyle(
                fontFamily: 'Futura',
                fontSize: 20,
                color: Theme.of(context).accentColor,
              ),
              textAlign: TextAlign.center,
            )
          : Image.file(_image),
    ));

    stackChildren.add(Center(
      child: Column(
        children: _recognitions != null
            ? _recognitions.map((res) {
                diseaseName = res['label'];
                return Text(
                  '',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    background: Paint()..color = Colors.blue,
                  ),
                );
              }).toList()
            : [],
      ),
    ));

    if (_image != null) {
      stackChildren.add(Positioned(
        bottom: 1,
        left: 140.0,
//        width: size.width,
        child: ElevatedButton(
          onPressed: handleCure,
          child: Text('Diagnose',
              style: TextStyle(
                fontFamily: 'Futura',
                fontSize: 18,
                color: Colors.white,
              )),

          style: ElevatedButton.styleFrom(
            elevation: 10,
            primary: Theme.of(context).accentColor,
            enableFeedback: true,
          ),
          // color: Colors.blue,
        ),
      ));
    }

    if (_busy) {
      stackChildren.add(const Opacity(
        child: ModalBarrier(dismissible: false, color: Colors.blue),
        opacity: 0.3,
      ));
      stackChildren.add(const Center(child: CircularProgressIndicator()));
    }

//////place mouse pointer on widgets to get more detailed info the the UI codes below
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          'Plant Disease Recognition',
          style: TextStyle(
            fontFamily: 'Futura',
            fontSize: 20,
            color: Theme.of(context).accentColor,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        child: Stack(
          children: stackChildren,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showDialog(context);
        },
        tooltip: 'Pick Image',
        child: Icon(Icons.photo_camera_rounded),
      ),
    );
  }
}
