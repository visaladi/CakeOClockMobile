import 'package:flutter/material.dart';
import 'Home.dart'; // Assuming Home.dart contains your HomePage widget

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Your App Name',
      theme: ThemeData(
        // Define your app's theme
        primarySwatch: Colors.blue,
      ),
      navigatorKey: navigatorKey, // Set the navigator key
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("lib/images/background.png"), // Replace with your background image path
              fit: BoxFit.cover,
              alignment: Alignment.center, // Align background image to center
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                top: 50, // Align text to the top left
                left: 20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'CAKE O CLOCK' ,
                      style: TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'lets bake as you like \nand as you desired', // Replace with your theme motto
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 20, // Align button to the bottom right
                right: 20,
                child: ElevatedButton.icon(
                  onPressed: () {
                    navigatorKey.currentState?.push(MaterialPageRoute(builder: (context) => HomePage())); // Use navigatorKey.currentState
                  },
                  icon: Icon(Icons.arrow_forward),
                  label: Text("Let's Start"),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
