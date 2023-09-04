import 'dart:convert';

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SideMenuPage extends StatefulWidget {
  const SideMenuPage({super.key});

  @override
  _SideMenuPageState createState() => _SideMenuPageState();
}

Future<List<Map<String, dynamic>>> fetchGenreData() async {
  final response = await http.get(Uri.parse(
      'https://mighty-thicket-88919.herokuapp.com/api/videos/all_video_types/v1/'));

  if (response.statusCode == 200) {
    final List<dynamic> data = json.decode(response.body);
    return data.cast<Map<String, dynamic>>();
  } else {
    throw Exception('Failed to fetch music data');
  }
}

Future<List<Map<String, dynamic>>> fetchVideoData() async {
  final response = await http.get(Uri.parse(
      'https://mighty-thicket-88919.herokuapp.com/api/videos/mixes/latest/v1/'));

  if (response.statusCode == 200) {
    final List<dynamic> data = json.decode(response.body);
    return data.cast<Map<String, dynamic>>();
  } else {
    throw Exception('Failed to fetch music data');
  }
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
        FutureBuilder<List<Map<String, dynamic>>>(
          future: fetchVideoData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator(); // Display a loading indicator while fetching data
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              final musicData = snapshot.data;

              return Container(
                color: Colors.black,
                height: 150,
                child: Swiper(
                  itemCount: musicData!.length,
                  itemBuilder: (BuildContext context, int index) {
                    final musicItem = musicData[index];

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
                            ListTile(
                              title: Text(musicItem['name'] ?? 'Genre $index'),
                              // Use 'name' field from API
                              subtitle: Text(musicItem['description'] ??
                                  'Music description'),
                              // Use 'description' field from API
                              leading: const Icon(Icons.music_note),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  viewportFraction: 0.4,
                  scale: 0.9,
                ),
              );
            }
          },
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
        SizedBox(
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

        FutureBuilder<List<Map<String, dynamic>>>(
          future: fetchGenreData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator(); // Display a loading indicator while fetching data
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              final musicData = snapshot.data;

              return Container(
                color: Colors.black,
                height: 150,
                child: Swiper(
                  itemCount: musicData!.length,
                  itemBuilder: (BuildContext context, int index) {
                    final musicItem = musicData[index];

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
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ListTile(
                              leading: const Icon(Icons.music_note),
                              title: const Text(
                                'Genre:',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                // Allow scrolling in the horizontal direction
                                child: Text(
                                  '${musicItem['name']}',
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  viewportFraction: 0.4,
                  scale: 0.9,
                ),
              );
            }
          },
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
      ],
    ),

    const Center(
        child: Text(
      'Library Page',
      style: TextStyle(color: Colors.white),
    )),

    //Account Upgrade menu
    Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DropdownButton<String>(
            hint: const Text(
              'Select the upgrade option',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            items: <String>[
              'Driver',
              'Agency',
              'Deejay',
              'Restaurant',
              'Organisation'
            ].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (_) {},
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.redAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            onPressed: () {
              // Handle the submit button tap
              // You can add your submit logic here
            },
            child: const Text('Upgrade', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    )
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
