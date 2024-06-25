import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'orders_page.dart';
import 'custom_order_page.dart';
import 'home_web_page.dart';
import 'about_us_page.dart';
import 'tracking_page.dart';
import 'contact_page.dart';
import 'categories_page.dart';
import 'Login.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white, // Set background color to white
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Image.asset(
                'lib/images/logo.png',
                fit: BoxFit.contain,
                height: 40,
                width: 40,
              ),
            ),
            SizedBox(width: 8),
            Text("Cake O' Clock"),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.login),
            onPressed: () {
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
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.grey, // Set background color to grey
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeWebPage(
                      url: 'https://cakeoclockwebclient.azurewebsites.net/',
                    ),
                  ),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OrdersPage(
                      url: 'https://cakeoclockwebclient.azurewebsites.net/cart',
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("lib/images/home.png"),
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 20),
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
                    SizedBox(height: 40),
                    GridView.count(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      mainAxisSpacing: 20.0,
                      crossAxisSpacing: 20.0,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      children: [
                        _buildGridButton(
                          context,
                          'Bake It',
                          Icons.cake,
                          CustomOrderPage(url: 'https://cakeoclockwebclient.azurewebsites.net/CustomOrder'),
                        ),
                        _buildGridButton(
                          context,
                          'Home',
                          Icons.home,
                          HomeWebPage(url: 'https://cakeoclockwebclient.azurewebsites.net'),
                        ),
                        _buildGridButton(
                          context,
                          'About Us',
                          Icons.info,
                          AboutUsPage(url: 'https://cakeoclockwebclient.azurewebsites.net/About'),
                        ),
                        _buildGridButton(
                          context,
                          'Tracking',
                          Icons.track_changes,
                          TrackingPage(url: 'https://cakeoclockwebclient.azurewebsites.net/tracking'),
                        ),
                        _buildGridButton(
                          context,
                          'Contact',
                          Icons.contact_mail,
                          ContactPage(url: 'https://cakeoclockwebclient.azurewebsites.net/Contactus'),
                        ),
                        _buildGridButton(
                          context,
                          'Categories',
                          Icons.category,
                          CategoriesPage(url: 'https://cakeoclockwebclient.azurewebsites.net/ProductsPage'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCarouselItem(String imagePath) {
    return Container(
      width: double.infinity,
      height: 150.0,
      child: Image.asset(
        imagePath,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildGridButton(BuildContext context, String text, IconData icon, Widget page) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => page,
          ),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.grey[800],
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40, color: Colors.white),
          SizedBox(height: 8),
          Text(
            text,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
