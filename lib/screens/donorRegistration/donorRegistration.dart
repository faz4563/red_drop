import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:red_drop/controllers/ApiConstants.dart';
import 'package:red_drop/controllers/ApiController.dart';
import 'package:red_drop/screens/homeScreen/homePage.dart';

class DonorRegistration extends StatefulWidget {
  const DonorRegistration({super.key});

  @override
  State<DonorRegistration> createState() => _DonorRegistrationState();
}

class _DonorRegistrationState extends State<DonorRegistration> {
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController bloodGroupController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  submit(name, age, bloodGroup, address) {
    var data = {
      "name": name,
      "age": age,
      "bloodGroup": bloodGroup,
      "address": address
    };
    var response =
        ApiController.post(ApiConstants.registerDonorApi, jsonEncode(data));
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text("Donor Registration"),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: width,
          height: height,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), label: Text("Name")),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: ageController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), label: Text("Age")),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), label: Text("Blood Group")),
                  controller: bloodGroupController,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), label: Text("Address")),
                  controller: addressController,
                ),
                ElevatedButton(
                    onPressed: () {
                      submit(nameController.text, ageController.text,
                          bloodGroupController.text, addressController.text);
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          content: Text("Blood Donor Registered Successfully"),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => HomeScreen(),
                                      ));
                                },
                                child: Text("Ok"))
                          ],
                        ),
                      );
                    },
                    child: const Text("Submit"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
