// Add necessary imports
import 'package:cakeoclock/Homeweb.dart';
import 'package:cakeoclock/Login.dart';
import 'package:cakeoclock/Menu.dart';
import 'package:cakeoclock/orders.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart'; // Import url_launcher package
import 'package:cakeoclock/About us.dart';
import 'package:cakeoclock/WebView.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cake O' clock"),
        actions: [
          IconButton(
            icon: Icon(Icons.login),
            onPressed: () {
              // Implement login action
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginPage(
                    url: 'https://cakeoclockwebclient.azurewebsites.net/login',
                  ),
                ),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              Navigator.pop(context);
              // Implement home button action
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomewebPage(
                      url: 'https://cakeoclockwebclient.azurewebsites.net/',
                    ),
                  ),
                );
                // Implement home action
              },
            ),
            IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OrdersPage(
                      url: 'https://cakeoclockwebclient.azurewebsites.net/tracking',
                    ),
                  ),
                );
                // Implement orders action
              },
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.white, Colors.grey],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Add Carousel Slider
                CarouselSlider(
                  options: CarouselOptions(
                    height: 200.0,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    aspectRatio: 16 / 9,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enableInfiniteScroll: true,
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    viewportFraction: 0.8,
                  ),
                  items: [
                    Image.asset(
                      'lib/images/cake1.png',
                      fit: BoxFit.cover,
                    ),
                    Image.asset(
                      'lib/images/cake2.png',
                      fit: BoxFit.cover,
                    ),
                    Image.asset(
                      'lib/images/cake3.png',
                      fit: BoxFit.cover,
                    ),
                    Image.asset(
                      'lib/images/cake4.png',
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
                SizedBox(height: 50), // Add space between carousel and buttons
                // Buttons
                RoundedButton(
                  text: 'Bake It',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WebViewPage(
                          url: 'https://cakeoclockwebclient.azurewebsites.net/',
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(height: 20), // Add space between buttons
                RoundedButton(
                  text: 'Menu',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MenuPage(
                          url: 'https://cakeoclockwebclient.azurewebsites.net/ProductsPage',
                        ),
                      ),
                    );

                    // Implement Another One action
                  },
                ),
                SizedBox(height: 20), // Add space between buttons
                RoundedButton(
                  text: 'About Us',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AboutUsPage()),
                    );// Implement About Us action
                  },
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}

class RoundedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const RoundedButton({
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.grey[800], // Button color
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30), // Rounded edges
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}

void _launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
