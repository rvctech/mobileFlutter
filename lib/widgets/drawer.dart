import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tunyce/controllers/auth_controller.dart';
import 'package:tunyce/core/common/app_colors.dart';
import 'package:tunyce/screens/auth/login_screen.dart';
import 'package:tunyce/widgets/custom_text.dart';

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
      backgroundColor: Colors.black,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: const BoxDecoration(
              color: AppColors.primaryColor,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
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
            leading: const Icon(
              Icons.account_circle,
              color: Colors.white,
            ),
            title: const CustomText(
              text: 'Profile',
              color: Colors.white,
            ),
            onTap: () {
              // Handle menu item 1 tap
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.search,
              color: Colors.white,
            ),
            title: const CustomText(
              text: 'Search',
              color: Colors.white,
            ),
            onTap: () {
              // Handle menu item 2 tap
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.chrome_reader_mode_outlined,
              color: Colors.white,
            ),
            title: const CustomText(
              text: 'Creator',
              color: Colors.white,
            ),
            onTap: () {
              // Handle menu item 2 tap
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.wallet,
              color: Colors.white,
            ),
            title: const CustomText(
              text: 'Wallet',
              color: Colors.white,
            ),
            onTap: () {
              // Handle menu item 2 tap
            },
          ),

          const Divider(
            thickness: 2,
            color: Colors.white12,
          ),
          //SizedBox(height: 50),
          ListTile(
            leading: const Icon(
              Icons.settings,
              color: Colors.white,
            ),
            title: const CustomText(
              text: 'Settings',
              color: Colors.white,
            ),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(
              Icons.logout,
              color: AppColors.primaryColor,
            ),
            title: const CustomText(
              text: 'Logout',
              color: AppColors.primaryColor,
            ),
            onTap: () async {
              Get.offAll(() => const LoginScreen());
            },
          ),
          const Divider(
            thickness: 2,
            color: Colors.white12,
          ),
        ],
      ),
    );
  }
}
