import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class SideMenuPage extends StatefulWidget {
  @override
  _SideMenuPageState createState() => _SideMenuPageState();
}

class _SideMenuPageState extends State<SideMenuPage> {
  int _currentIndex = 0;

  // Current index for bottom navigation

  // Define your pages/screens that correspond to each bottom navigation tab
  final List<Widget> _pages = [
    Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        //First Menu Option is Playlist
        Container(
          color: Colors.black,
          height: 150,
          child: Swiper(
            itemCount: 5, // Number of cards
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  // Handle card tap
                  print('Playlist $index tapped');
                },
                child: Card(
                  color: Colors.redAccent,
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      // Add your card content here
                      ListTile(
                        title: Text('Playlist $index'),
                        subtitle: const Text('Playlist description'),
                        leading: const Icon(Icons.music_note),
                      ),
                      //Divider(thickness: 2),
                    ],
                  ),
                ),
              );
            },
            // Customize swiper properties if needed
            viewportFraction: 0.4,
            scale: 0.9,
          ),
        ),

        //Second Menu Option in the home scree
        Container(
          color: Colors.black,
          height: 150,
          child: Swiper(
            itemCount: 5, // Number of cards
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  // Handle card tap
                  print('Music $index tapped');
                },
                child: Card(
                  color: Colors.deepOrangeAccent,
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      // Add your card content here
                      ListTile(
                        title: Text('Music $index'),
                        subtitle: const Text('Music description'),
                        leading: const Icon(Icons.music_note),
                      ),
                      //Divider(thickness: 2),
                    ],
                  ),
                ),
              );
            },
            // Customize swiper properties if needed
            viewportFraction: 0.4,
            scale: 0.9,
          ),
        ),

        //Third menu option in home scree
        Container(
          height: 150,
          child: Swiper(
            itemCount: 5, // Number of cards
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  // Handle card tap
                  print('Artist $index tapped');
                },
                child: Card(
                  color: Colors.cyanAccent,
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      // Add your card content here
                      ListTile(
                        title: Text('Artist $index'),
                        subtitle: const Text('Artist description'),
                        leading: const Icon(Icons.music_note),
                      ),
                      //Divider(thickness: 2),
                    ],
                  ),
                ),
              );
            },
            // Customize swiper properties if needed
            viewportFraction: 0.4,
            scale: 0.9,
          ),
        ),

        //Fourth option in the home screen
        Container(
          height: 150,
          child: Swiper(
            itemCount: 5, // Number of cards
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  // Handle card tap
                  print('Music $index tapped');
                },
                child: Card(
                  color: Colors.blueAccent,
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      // Add your card content here
                      ListTile(
                        title: Text('Music $index'),
                        subtitle: const Text('Music description'),
                        leading: const Icon(Icons.music_note),
                      ),
                      //Divider(thickness: 2),
                    ],
                  ),
                ),
              );
            },
            // Customize swiper properties if needed
            viewportFraction: 0.4,
            scale: 0.9,
          ),
        ),
      ],
    ),
    //const SizedBox(height: 20),
    //Search Page
    Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        // Search TextField and Button
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  // You can add additional logic for handling search queries here
                ),
              ),
              const SizedBox(width: 10),
              // Add spacing between TextField and Button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.redAccent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                onPressed: () {
                  // Handle the search button tap
                  // You can add your search logic here
                },
                child: const Text('Search'),
              ),
            ],
          ),
        ),
        // Center(child: Text('Search Page', style: TextStyle(color: Colors.white),)),
      ],
    ),
    //Center(child: Text('Search Page',style: TextStyle(color: Colors.white),)),
    const Center(
        child: Text(
          'Library Page',
          style: TextStyle(color: Colors.white),
        )),
    const Center(
        child: Text(
          'Account',
          style: TextStyle(color: Colors.white),
        )),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Home Page'),
        backgroundColor: Colors.redAccent,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              // Handle cart icon tap
            },
          ),
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // Handle notifications icon tap
            },
          ),
        ],
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
      ),
      body: _pages[_currentIndex],
      // Show the current page based on the index
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex =
                index; // Update the current index when a tab is tapped
          });
        },
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 24, color: Colors.redAccent),
            // Set the color here
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              size: 24,
              color: Colors.redAccent,
            ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.music_note,
              size: 24,
              color: Colors.redAccent,
            ),
            label: 'Library',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              size: 24,
              color: Colors.redAccent,
            ),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}
