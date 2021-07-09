import 'package:flutter/material.dart';


//////the same as the tips screen. In here contains the icons, information and widget to give this look//////
//////It mostly contains widgets for styling text and positioning and overall appearance//////

class About extends StatelessWidget {
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
                    'images/r.png',
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
              "About",
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
                            leading: Icon(Icons.photo_camera,
                            color: Theme.of(context).accentColor,
                            ),
                            
                            title: Text(
                      '''Take photos of plant to upload and view the results in seconds.''',
                      style: TextStyle(
                        fontFamily: 'Futura',
                        fontSize: 17,
                      ),
                            ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10,),
                          Text('Identify plant'),
                        ],
                      ),
                          ),
                          ListTile(
                            // title: Text('Identify'),
                            leading: Icon(Icons.local_florist_rounded,
                            color: Theme.of(context).accentColor,
                            ),
                            
                            title: Text( '''Identify thousands of plants including flowers, tress and bushes from all species over the world. We give common names, brief description and taxonomy of the plant''',
                            style: TextStyle(
                        fontFamily: 'Futura',
                        fontSize: 17,
                      ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10,),
                          Text('Plenty of plants'),
                        ],
                      ),
                          ),
                          ListTile(
                            leading: Icon(Icons.api_rounded,
                            color: Theme.of(context).accentColor,
                            ),
                            title: Text(
                      '''We use cutting edge methods of machine learning and customized deep convolutional neural networks to ensure the best possible results.''',
                      style: TextStyle(
                        fontFamily: 'Futura',
                        fontSize: 17,
                      ),
                            ),
                            
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 10,),
                                Text('Power of Machine Learning'),
                              ],
                            ),
                            ),
                          ListTile(
                            leading: Icon(Icons.person_rounded, 
                            color: Theme.of(context).accentColor,
                            ),
                            title: Text("Contact",
                            style: TextStyle(
                        fontFamily: 'Futura',
                        fontSize: 18,
                      ),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 5,),
                                Text(
                                    "+233 ........"),
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
