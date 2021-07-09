import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:splashscreen/splashscreen.dart';

import 'bottom_tab.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.f
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver{


//////put the mouse pointer on "addsObserver, didChangeAppLifeCycleState, removeObserver" fr more details
//////do the same for any other widget to get more detailed information 

  @override 
    void initState() {
    
    WidgetsBinding.instance.addObserver(this);

    super.initState();
  }

  @override
 void didChangeAppLifecycleState(AppLifecycleState state) {}


  @override
  void dispose(){
        WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
//////ResponsiveSizer is a library for handling device orientation/// home is the splash screen//////
    return ResponsiveSizer(             
      child: MaterialApp(
        theme: ThemeData(
          // fontFamily: 'BlackMango',
          primaryColor: Colors.grey[50],
          accentColor: Colors.teal[900],
        ),
        debugShowCheckedModeBanner: false,
        home: Splash(),
      ),
    );
  }
}


//////this class shows the splash screen and moves to a new page after 8 seconds//////
class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      photoSize: 100,
      seconds: 5,
      navigateAfterSeconds: BottomNav(),
      title: Text(
        'Plant Identification',
        style: TextStyle(
          fontFamily: 'Futura',
          fontWeight: FontWeight.w200,
          fontSize: 20,
        ),
      ),
      image: Image.asset(
        'images/giphy.gif',
      ),
      loadingText: Text(
        'Welcome',
        style: TextStyle(
          color: Theme.of(context).accentColor,
          fontFamily: 'BlackMango',
          fontWeight: FontWeight.w600,
          fontSize: 20,
        ),
      ),
    );
  }
}
