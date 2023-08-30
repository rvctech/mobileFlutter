import 'package:flutter/material.dart';

class SideMenuPage extends StatefulWidget {
  @override
  _SideMenuPageState createState() => _SideMenuPageState();
}

class _SideMenuPageState extends State<SideMenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        backgroundColor: Colors.redAccent,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.redAccent,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 40, // Adjust the radius as needed
                    backgroundImage: AssetImage('assets/images/icon.jpg'),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Farid',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            ListTile(
              title: Text('Home'),
              onTap: () {
                // Handle menu item 1 tap
              },
            ),
            ListTile(
              title: Text('Discover'),
              onTap: () {
                // Handle menu item 2 tap
              },
            ),
            ListTile(
              title: Text('Live'),
              onTap: () {
                // Handle menu item 2 tap
              },
            ),
            ListTile(
              title: Text('Library'),
              onTap: () {
                // Handle menu item 2 tap
              },
            ),
            // Add more menu items as needed
          ],
        ),
      ),
      body: Center(
        child: Text('Content goes here'),
      ),
    );
  }
}
