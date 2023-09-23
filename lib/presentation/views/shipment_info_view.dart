import 'package:flutter/material.dart';
import 'package:movemate/utils/app_colors.dart';

class ShipmentInfoView extends StatefulWidget {
  const ShipmentInfoView({super.key});

  @override
  State<ShipmentInfoView> createState() => _ShipmentInfoViewState();
}

class _ShipmentInfoViewState extends State<ShipmentInfoView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("MoveMate"),
              const SizedBox(
                height: 40,
              ),
              Container(
                height: 100,
                width: 100,
                color: Colors.blue,
              ),
              const SizedBox(
                height: 30,
              ),
              const Text("Total Estimated Amount"),
              const SizedBox(
                height: 15,
              ),
              const Text("N500,000.00"),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Text(
                  "Nostrud nulla in non voluptate labore laboris reprehend",
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                height: 54,
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryOrangeColor,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                    ),
                  ),
                  onPressed: () {
                    print("Heyyy");
                  },
                  child: const Text("Back to home"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
