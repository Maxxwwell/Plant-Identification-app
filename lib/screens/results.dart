import 'package:flutter/material.dart';

//////the API response is passed to this class and is displayed in the UI..
//////name, fam, gen and the rest were all from the previous page and were moved through the constructor over here.

class Results extends StatelessWidget {
  final name;
  final fam;
  final gen;
  final sci;
  final ord;
  final phy;
  final kin;
  final cla;
  final wikiImage_i;
  final wikiImage_ii;
  final wikiImage_iii;
  final wikiDes;

  Results(
      {this.name,
      this.fam,
      this.gen,
      this.sci,
      this.ord,
      this.phy,
      this.kin,
      this.cla,
      this.wikiImage_i,
      this.wikiImage_ii,
      this.wikiImage_iii,
      this.wikiDes});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: name == null
              ? Text(
                  name.toString(),
                  style: TextStyle(
                    fontFamily: 'Futura',
                    color: Theme.of(context).accentColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 22,
                  ),
                )
              : Text(
                  name.join(", ").toString(),
                  //  name.toString(),
                  style: TextStyle(
                    fontFamily: 'Futura',
                    color: Theme.of(context).accentColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 22,
                  ),
                )

//////this very similar to the plantDetails screen but over here the information is being provided from the API response..

          ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.white10,
              height: 195,
              width: double.maxFinite,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                  child: Row(
                    children: [
                      Container(
                        width: 160,
                        height: 180,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            wikiImage_i, //////wikiImage from the constructor//////
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: 160,
                        height: 180,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            wikiImage_ii, //////wikiImage_ii from the constructor//////
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: 160,
                        height: 180,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            wikiImage_iii, //////wikiImage_iii from the constructor//////
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
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
              width: double.infinity,
              height: 850,
              child: Wrap(children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 1, vertical: 2),
                  width: 220,
                  child: ListTile(
                    tileColor: Colors.white24,
                    enableFeedback: true,
                    title: name == null
                        ? Text(
                            name.toString(), //////name from the constructor//////
                            style: TextStyle(
                              fontFamily: 'Futura',
                              color: Theme.of(context).accentColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 22,
                            ),
                          )
                        : Text(
                            name.join(", ").toString(),
                            //  name.toString(),
                            style: TextStyle(
                              fontFamily: 'Futura',
                              color: Theme.of(context).accentColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                            ),
                          ),
                    subtitle: Text('common name'),
                  ),
                ),

                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                  width: 240,
                  child: ListTile(
                    tileColor: Colors.white24,
                    title: Text(
                      fam, //////fam from the constructor//////
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
                  width: 220,
                  child: ListTile(
                    tileColor: Colors.white24,
                    title: Text(
                      gen, //////wikiImage from the constructor//////
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
                  width: 240,
                  child: ListTile(
                    tileColor: Colors.white24,
                    title: Text(
                      sci, //////sci from the constructor//////
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
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 1, vertical: 2),
                  width: 220,
                  child: ListTile(
                    tileColor: Colors.white24,
                    title: Text(
                      ord, //////ord from the constructor//////
                      style: TextStyle(
                        fontFamily: 'Futura',
                        color: Theme.of(context).accentColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 24,
                      ),
                    ),
                    subtitle: Text('order'),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                  width: 240,
                  child: ListTile(
                    tileColor: Colors.white24,
                    title: Text(
                      phy, //////phy from the constructor//////
                      style: TextStyle(
                        fontFamily: 'Futura',
                        color: Theme.of(context).accentColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 24,
                      ),
                    ),
                    subtitle: Text('phylum'),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 1, vertical: 2),
                  width: 220,
                  child: ListTile(
                    tileColor: Colors.white24,
                    title: Text(
                      kin, //////kin from the constructor//////
                      style: TextStyle(
                        fontFamily: 'Futura',
                        color: Theme.of(context).accentColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 24,
                      ),
                    ),
                    subtitle: Text('kingdom'),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 5,
                  ),
                  width: 240,
                  child: ListTile(
                    tileColor: Colors.white24,
                    title: Text(
                      cla, //////cla from the constructor//////
                      style: TextStyle(
                        fontFamily: 'Futura',
                        color: Theme.of(context).accentColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 24,
                      ),
                    ),
                    subtitle: Text('class'),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 4, vertical: 5),
                  width: 458,
                  height: 130,
                  child: ListTile(
                      tileColor: Colors.white24,
                      title: Text(
                        'Medical Puporses',
                        style: TextStyle(
                          fontFamily: 'Futura',
                          color: Theme.of(context).accentColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 24,
                        ),
                      ),
                      subtitle: Text(
                        'Various parts of the plants such as leaf, stem, root, seeds, etc are being used to prevent allay symptoms or revert abnormalities. Medicinal plants and their components posses a range of beneficial preventive properties', //////wikiDes from the constructor//////
                        textAlign: TextAlign.start,
                      )),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                  width: 458,
                  height: 350,
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
                        wikiDes, //////wikiDes from the constructor//////
                        textAlign: TextAlign.start,
                      )),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
