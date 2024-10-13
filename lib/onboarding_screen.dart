import 'package:flutter/material.dart';
import 'package:swift_rides/main.dart';
import 'package:swift_rides/signUp.dart';

class OnboardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    
     return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset(
            'assets/onboarding1.png',
            fit: BoxFit.cover,
          ),
          Container(
            color: Colors.black.withOpacity(0.5),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Spacer(flex: 2),
                Text(
                  'Do you need an extra Cash?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.width * 0.068,
                    fontWeight: FontWeight.normal,
                  ),
                  ),
                  Text('Ride with Swift and get paid on your terms.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.width * 0.068,
                    fontWeight: FontWeight.normal,
                  ),),
                  
                Spacer(flex: 2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () {
                      
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(50, 50),
                        primary: Colors.white,
                        onPrimary: Colors.black,
                          shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5), // Square-ish corners
                        ),
                      ),
                      child: Text('Skip'),
                    ),
                    Spacer(),
                    ElevatedButton(
                      
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => OnboardingScreen2(),));
                        
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(50, 50),
                        primary: Colors.white,
                        onPrimary: Colors.black,
                          shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5), // Square-ish corners
                        ),
                      ),
                      child: Text('Next'),
                    ),
                  ],
                ),
                Spacer(flex: 1),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


class OnboardingScreen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset(
            'assets/onboarding2.png',
            fit: BoxFit.cover,
          ),
          Container(
            color: Colors.black.withOpacity(0.5),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Spacer(flex: 2),
                Text(
                  'Join the Swift community',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: deviceWidth * 0.068,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Text(
                  'and start earning today',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: deviceWidth * 0.068,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Spacer(flex: 3),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: ((context) => Signup())));
                    
                    },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    onPrimary: Colors.black,
                    minimumSize: Size(deviceWidth * 0.35, 60), 
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8), 
                    ),
                  ),
                  child: Text('Get Started'),
                ),
                Spacer(flex: 1), // Adjust the spacing below the button
              ],
            ),
          ),
        ],
      ),
    );
  }
}