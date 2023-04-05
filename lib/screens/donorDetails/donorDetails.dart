// ignore_for_file: prefer_typing_uninitialized_variables, implementation_imports, file_names, must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:red_drop/models/bloodGroupModel.dart';

class DonorDetailsPage extends StatefulWidget {
  DonorDetailsPage(
      {super.key,
      this.bloodGroupDataName,
      this.bloodGroupDataBloodGroup,
      this.bloodGroupDataAge,
      this.bloodGroupDataAddress});
  final bloodGroupDataName;
  final bloodGroupDataBloodGroup;
  final bloodGroupDataAge;
  final bloodGroupDataAddress;
  @override
  State<DonorDetailsPage> createState() => _DonorDetailsPageState();
}

class _DonorDetailsPageState extends State<DonorDetailsPage> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(widget.bloodGroupDataName),
        backgroundColor: Colors.red,
      ),
      body: Container(
        width: width,
        height: height,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 100,
                backgroundColor: Colors.red,
                child: Text(
                  widget.bloodGroupDataBloodGroup,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      letterSpacing: 3,
                      fontWeight: FontWeight.w900),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Container(
                  height: height / 3,
                  color: Colors.red,
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Name  :  ${widget.bloodGroupDataName.toString().toUpperCase()}",
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w900),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Text(
                              "Age : ${widget.bloodGroupDataAge.toString().toUpperCase()}",
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w900)),
                          const SizedBox(
                            height: 40,
                          ),
                          Text(
                              "Blood Group : ${widget.bloodGroupDataBloodGroup.toString()}",
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w900)),
                          const SizedBox(
                            height: 40,
                          ),
                          Text(
                              "Address : ${widget.bloodGroupDataAddress.toString().toLowerCase()}",
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w900)),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
