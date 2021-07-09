import 'package:flutter/material.dart';

//////when a plant item is tapped on homepage this where it brings you//////
/////////it has the same properties as the plantItem class and presents that information here//////


class PlantDetails extends StatelessWidget {
  final String common_name;
  final String family;
  final String genus;
  final String id;
  final String image_url;
  final String scientific_name;
  final String about;
  final String wiki_url;

  PlantDetails(this.common_name, this.family, this.genus, this.id,
      this.image_url, this.scientific_name, this.about, this.wiki_url);

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          common_name,
          style: TextStyle(
            fontFamily: 'BlackMango',
            color: Theme.of(context).accentColor,
            fontWeight: FontWeight.w500,
            fontSize: 24,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.green[100],
              height: 195,
              width: double.maxFinite,
              child: Image.network(
                image_url,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 1,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.green[200],
                // Theme.of(context).accentColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
              ),
              width: 350,
              height: 360,
              child: Wrap(children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 1, vertical: 2),
                  width: 160,
                  child: ListTile(
                    tileColor: Colors.white24,
                    enableFeedback: true,
                    title: Text(
                      common_name,
                      style: TextStyle(
                        fontFamily: 'Futura',
                        color: Theme.of(context).accentColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 24,
                      ),
                    ),
                    subtitle: Text('common name'),
                  ),
                ),

                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                  width: 170,
                  child: ListTile(
                    tileColor: Colors.white24,
                    title: Text(
                      family,
                      style: TextStyle(
                        fontFamily: 'Futura',
                        color: Theme.of(context).accentColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 24,
                      ),
                    ),
                    subtitle: Text('family'),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 1, vertical: 2),
                  width: 160,
                  child: ListTile(
                    tileColor: Colors.white24,
                    title: Text(
                      genus,
                      style: TextStyle(
                        fontFamily: 'Futura',
                        color: Theme.of(context).accentColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 24,
                      ),
                    ),
                    subtitle: Text('genus'),
                  ),
                ),
                //  SizedBox(width: 10,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                  width: 170,
                  child: ListTile(
                    tileColor: Colors.white24,
                    title: Text(
                      scientific_name,
                      style: TextStyle(
                        fontFamily: 'Futura',
                        color: Theme.of(context).accentColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 24,
                      ),
                    ),
                    subtitle: Text('scientific name'),
                  ),
                ),
                //  SizedBox(height: 2,),
                Center(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 2, vertical: 4),
                    width: 330,
                    height: 70,
                    child: ListTile(
                        tileColor: Colors.white24,
                        title: Text(
                          'wikipedia link',
                          style: TextStyle(
                            fontFamily: 'Futura',
                            color: Theme.of(context).accentColor,
                            fontWeight: FontWeight.w300,
                            fontSize: 18,
                          ),
                        ),
                        subtitle: Text(wiki_url)),
                  ),
                ),

                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                  width: 330,
                  height: 135,
                  child: ListTile(
                      tileColor: Colors.white24,
                      title: Text(
                        'About',
                        style: TextStyle(
                          fontFamily: 'Futura',
                          color: Theme.of(context).accentColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 24,
                        ),
                      ),
                      subtitle: Text(
                        about,
                        textAlign: TextAlign.start,
                      )),
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
