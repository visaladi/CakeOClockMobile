import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'Homeweb.dart';
import 'Login.dart';
import 'Menu.dart';
import 'Orders.dart';
import 'About Us.dart';
import 'WebView.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Image.asset(
              'lib/images/logo.png', // Adjust the path according to your image location
              fit: BoxFit.contain,
              height: 40,
              width: 40, // Adjust the height as needed
            ),
            SizedBox(width: 68), // Add some space between logo and text
            Text("Cake O' Clock"),
          ],
        ),
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
                SizedBox(height: 5), // Add space for logo and text
                // Add Carousel Slider
                CarouselSlider(
                  options: CarouselOptions(
                    height: 180.0,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    aspectRatio: 16 / 9,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enableInfiniteScroll: true,
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    viewportFraction: 0.8,
                  ),
                  items: [
                    _buildCarouselItem('lib/images/cake1.png'),
                    _buildCarouselItem('lib/images/cake2.png'),
                    _buildCarouselItem('lib/images/cake3.png'),
                    _buildCarouselItem('lib/images/cake4.png'),
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
                    ); // Implement About Us action
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCarouselItem(String imagePath) {
    return Container(
      width: double.infinity,
      height: 150.0, // Adjust the height as needed
      child: Image.asset(
        imagePath,
        fit: BoxFit.cover,
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
