import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
            leading: const Icon(Icons.account_circle),
            title: const Text('Profile'),
            onTap: () {
              // Handle menu item 1 tap
            },
          ),
          ListTile(
            leading: const Icon(Icons.search),
            title: const Text('Discover'),
            onTap: () {
              // Handle menu item 2 tap
            },
          ),
          ListTile(
            leading: const Icon(Icons.chrome_reader_mode_outlined),
            title: const Text('Creator'),
            onTap: () {
              // Handle menu item 2 tap
            },
          ),
          ListTile(
            leading: const Icon(Icons.wallet),
            title: const Text('Wallet'),
            onTap: () {
              // Handle menu item 2 tap
            },
          ),

          const Divider(thickness: 2),
          //SizedBox(height: 50),
          const ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
          ),
          const ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logut'),
          ),
          const Divider(thickness: 2),
          // Add more menu items as needed
        ],
      ),
    );
  }
}
