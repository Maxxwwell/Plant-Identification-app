import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fyp_plant_identification/screens/results.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

//////this is the class that handels sending image to sever for identification...

class ScanPlantScreen extends StatefulWidget {
  @override
  _ScanPlantScreenState createState() => _ScanPlantScreenState();
}

class _ScanPlantScreenState extends State<ScanPlantScreen> {
  
  //////the  code below sets the image picker for selecting images from gallery...
  File uploadimage;

  Future<void> pickImage() async {
    var chosenimage = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      uploadimage = chosenimage;
    });
  }
/////this code for selecting images from camera//////
    Future<void> pickedImage() async {
    var chosenimage = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      uploadimage = chosenimage;
    });
  }

//////this code handels sending the selected image to the sever for identification//////

  uploadImage() async {
    const url = 'https://api.plant.id/v2/identify';
    const header = {
      "Content-Type": "application/json",
      "Api-Key": "uLmlgBOMpYmbxEgSpO9UmUkVr1MRcs5TCIy9L9GnpZia172bDl"
    };
    if (uploadimage == null) return;
    String base64Image = base64Encode(uploadimage.readAsBytesSync());

    var body = jsonEncode({
      'images': [base64Image],
       "plant_details": ["common_names", "taxonomy","wiki_images", "wiki_description"]

    });


    final response = await http.post(url, headers: header, body: body);

    if (response.statusCode == 200) {
      String data = response.body;
      
      
      final List common_names = jsonDecode(data)['suggestions'][0]['plant_details']['common_names'];
      final String family = jsonDecode(data)['suggestions'][0]['plant_details']['taxonomy']['family'];
      final String genus = jsonDecode(data)['suggestions'][0]['plant_details']['taxonomy']['genus'];
      final String scientific_name = jsonDecode(data)['suggestions'][0]['plant_details']['scientific_name'];
      final String order = jsonDecode(data)['suggestions'][0]['plant_details']['taxonomy']['order'];
      final String phylum = jsonDecode(data)['suggestions'][0]['plant_details']['taxonomy']['phylum'];
      final String kingdom = jsonDecode(data)['suggestions'][0]['plant_details']['taxonomy']['kingdom'];
      final String classs = jsonDecode(data)['suggestions'][0]['plant_details']['taxonomy']['class'];
      final String wiki_image_i = jsonDecode(data)['suggestions'][0]['plant_details']['wiki_images'][0]['value'];
      final String wiki_image_ii = jsonDecode(data)['suggestions'][0]['plant_details']['wiki_images'][1]['value'];
      final String wiki_image_iii = jsonDecode(data)['suggestions'][0]['plant_details']['wiki_images'][2]['value'];
      final String wiki_description = jsonDecode(data)['suggestions'][0]['plant_details']['wiki_description']['value'];
      
//////the code above is the information obtained from the sever after the image has been sent//////
//////the name, family and other details are all providedd from the API response above//////



        print(common_names.toString());
      print(family);
      print(genus);
      print(scientific_name);
      print(order);
      print(phylum);
      print(kingdom);
      print(classs);
      print(wiki_image_i);
      print(wiki_image_ii);
       print(wiki_image_iii);
      print(wiki_description);

   //////the information obtained from the API is moved to another page and displayed. Will point it to you..
       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
      return Results(name: common_names, fam: family, gen: genus, sci: scientific_name, ord: order,phy: phylum, kin: kingdom, cla: classs, wikiImage_i: wiki_image_i, wikiImage_ii: wiki_image_ii, wikiImage_iii: wiki_image_iii, wikiDes: wiki_description);
    }
    ));


      
     
    } else {
      print(response.statusCode);
    }
   
  }
//////the code below is what is displayed in the app. All the ones above are fuctions working with the UI//////
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
      

        child: Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40.0),
              topRight: Radius.circular(40.0),
            ),
          ),
          child: Column(
            children: [
              Text(
                'Select from gallery or use camera',
                style: TextStyle(
                  fontFamily: 'Futura',
                  fontSize: 17,
                  fontWeight: FontWeight.w300,
                  color: Theme.of(context).accentColor,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: Theme.of(context).accentColor,
                    radius: 22,
                    child: IconButton(
                      icon: Icon(Icons.insert_photo_rounded),
                      onPressed: () => pickImage(),
                      iconSize: 22,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  SizedBox(width: 25,),
                  CircleAvatar(
                    backgroundColor: Theme.of(context).accentColor,
                    radius: 22,
                    child: IconButton(
                      icon: Icon(Icons.photo_camera),
                      onPressed: () => pickedImage(),
                      iconSize: 22,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                  decoration: BoxDecoration(
                      // color: Colors.black12,
                      borderRadius: BorderRadius.circular(8)),
                  height: 185,
                  child: uploadimage != null
                      ? Image.file(
                          uploadimage,
                          fit: BoxFit.fill,
                        )
                      : Text('No image to upload',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Futura',
                            fontSize: 18,
                            fontWeight: FontWeight.w300,
                            color: Theme.of(context).accentColor,
                          ))),
              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Theme.of(context).accentColor),
                  
//////this is the function for uploading the image after it has been selected...
//////if the image is not null pressing the button will send it to the API...
                  onPressed: () {
                    if (uploadimage != null){
                      uploadImage();
                     Navigator.push(context, MaterialPageRoute(builder: (context)
                      => SpinKitPulse(
                        color: Colors.white,
                        // Theme.of(context).accentColor,
                        size: 50,
                      ),),
                      
                      );
                    

                    }

//////if no image has been selected and the upload button is pressed alertDialog will be showing no image is selected
                    else{
                      return showDialog(context: context, builder: (ctx) => AlertDialog(
                        content: Text("Select image and upload to get results",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.center,
                        ),
                      
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        backgroundColor: Theme.of(context).accentColor,
                      )
                      );
                      
                    }
                  },
//////the code below is to display the upload button along with the incon//////
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Upload',
                        style: TextStyle(
                          fontFamily: 'BlackMango',
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Icon(Icons.cloud_upload),
                      
                    ],
                  ),
                  ),

            ],
          ),
        ),
      ),
    );
  }
}


