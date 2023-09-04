import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tunyce/controllers/auth_controller.dart';
import 'package:tunyce/core/common/app_colors.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  final authController = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: const BoxDecoration(
              color: AppColors.primaryColor,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: CircleAvatar(
                    radius: 40, // Adjust the radius as needed
                    backgroundImage: AssetImage('assets/images/icon.jpg'),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  '${authController.currentUser?.firstName} ${authController.currentUser?.lastName}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  '${authController.currentUser?.email}',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontSize: 14,
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
            leading: Icon(
              Icons.logout,
              color: AppColors.primaryColor,
            ),
            title: Text('Logut'),
          ),
          const Divider(thickness: 2),
          // Add more menu items as needed
        ],
      ),
    );
  }
}
