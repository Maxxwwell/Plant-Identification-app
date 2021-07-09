import 'package:flutter/material.dart';
import 'package:fyp_plant_identification/screens/plant_details.dart';

//////this class is for each plant seen on the homepage


class PlantItem extends StatelessWidget {
  final String common_name;
  final String family;
  final String genus;
  final String id;
  final String image_url;
  final String scientific_name;
  final String about;
  final String wiki_url;

PlantItem(this.common_name, this.family, this.genus, this.id, this.image_url, this.scientific_name, this.about, this.wiki_url);
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: (){
            Navigator.of(context).push(MaterialPageRoute
            (builder: (ctx) => PlantDetails(common_name, family, genus, id, image_url,scientific_name, about, wiki_url)));
          },
//////the code above is for moving that data to new page when each plant in homepage is tapped on//////


//////the code below shows the loading spinner when the images are loading and shows a text when images were not able to load
          child:Image.network(image_url,
          fit: BoxFit.cover,
          loadingBuilder: (context, child, loadingProgress){
            if (loadingProgress == null) return child;

            return Center(
              child: Container(
                // margin: EdgeInsets.symmetric(vertical: 10),
                padding: EdgeInsets.all(8),
                height: 50,
                width: 50,
                child: Image.asset('images/s.gif',
                fit: BoxFit.cover, 
                ),

              ));
          },
          errorBuilder: (context, error, stackTrace) =>
              Text('Could not load image',
              style: TextStyle(color: Theme.of(context).accentColor,
              fontFamily: 'Futura',
              fontSize: 17
              ),
              textAlign: TextAlign.center,
              ),
          )
        ),
        footer: GridTileBar(title: Text(common_name,       //////this displays the name of plant at homepage//////
        style: TextStyle(
              fontFamily: 'BlackMango',
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 17,
            ),
            textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.black38,
        ),
        
      ),
    );
  }
}