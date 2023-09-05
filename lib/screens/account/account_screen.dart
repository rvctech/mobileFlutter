import 'package:flutter/material.dart';
import 'package:tunyce/core/common/app_colors.dart';
import 'package:tunyce/widgets/custom_text.dart';
import 'package:tunyce/widgets/drawer.dart';
import 'package:tunyce/widgets/primary_button.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  final _plans = <String>[
    'Driver',
    'Agency',
    'Deejay',
    'Restaurant',
    'Organisation'
  ];
  String? selectedPlan;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account'),
      ),
      drawer: const AppDrawer(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 22,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Row(
                children: [
                  const CustomText(
                    text: 'Upgrade to: ',
                    size: 18,
                    weight: FontWeight.w400,
                  ),
                  const SizedBox(width: 10),
                  DropdownButton<String>(
                    hint: const Text(
                      'Select option',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    items: _plans.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    value: selectedPlan,
                    style: const TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 18,
                    ),
                    onChanged: (value) {
                      setState(() {
                        selectedPlan = value;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              PrimaryButtonWidget(
                label: 'Upgrade',
                onTap: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
