import 'package:flutter/material.dart';

//////this page shows tips screen from the bottom navigation bar//////


class Tips extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade100,
        extendBodyBehindAppBar: true,
        extendBody: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Stack(children: [
                Container(
                  height: 200,
                  width: double.infinity,
                  child: Image.asset(
                    'images/tips.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ]),
              const SizedBox(
                height: 20.0,
              ),
              UserInfo(),
            ],
          ),
        ));
  }
}

//////this contains the icons and text and how they look//////

class UserInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(left: 8.0, bottom: 4.0),
            alignment: Alignment.topLeft,
            child: Text(
              "Tips",
              style: TextStyle(
                fontFamily: 'Futura',
                color: Colors.black87,
                fontWeight: FontWeight.w500,
                fontSize: 25,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Card(
            child: Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.all(15),
              child: Column(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      ...ListTile.divideTiles(
                        color: Colors.grey,
                        tiles: [
                          ListTile(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 12, vertical: 4),
                            leading: Icon(Icons.info_outline_rounded,
                            color: Theme.of(context).accentColor,
                            ),
                            
                            title: Text(
                      '''Direct sunlight can be too harsh for photographing plants, so take care not to create too many shadows.''',
                      style: TextStyle(
                        fontFamily: 'Futura',
                        fontSize: 17,
                      ),
                            ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10,),
                          Text('Avoid shadows'),
                        ],
                      ),
                          ),
                          ListTile(
                            // title: Text('Identify'),
                            leading: Icon(Icons.center_focus_strong_outlined,
                            color: Theme.of(context).accentColor,
                            ),
                            
                            title: Text( '''keep the photo background clear of distracting elements''',
                            style: TextStyle(
                        fontFamily: 'Futura',
                        fontSize: 17,
                      ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10,),
                          Text('clear images'),
                        ],
                      ),
                          ),
                          ListTile(
                            leading: Icon(Icons.center_focus_strong_outlined,
                            color: Theme.of(context).accentColor,
                            ),
                            title: Text(
                      '''Make sure that the focus is on the plant to be identified and not the background of the image.''',
                      style: TextStyle(
                        fontFamily: 'Futura',
                        fontSize: 17,
                      ),
                            ),
                            
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 10,),
                                Text('focus on plant'),
                              ],
                            ),
                            ),
                          ListTile(
                            leading: Icon(Icons.info_outline_rounded,
                            color: Theme.of(context).accentColor,
                            ),
                            title: Text('''Do not snap plants that are too far off frame or not belonging to the desired species(pot, soil, etc).''',
                            style: TextStyle(
                        fontFamily: 'Futura',
                        fontSize: 18,
                      ),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 10,),
                                Text(
                                    "upload good images"),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
