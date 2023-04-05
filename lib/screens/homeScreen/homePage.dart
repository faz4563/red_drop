// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:red_drop/controllers/ApiController.dart';
import 'package:red_drop/models/bloodGroupModel.dart';
import 'package:red_drop/screens/donorDetails/donorDetails.dart';
import 'package:red_drop/screens/donorRegistration/donorRegistration.dart';

import '../../controllers/ApiConstants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

BloodGroupModel bloodGroupData = BloodGroupModel();

class _HomeScreenState extends State<HomeScreen> {
  bool dataFound = false;
  gettingBloodgroupData() async {
    var response = await ApiController.get(ApiConstants.gettingBloodGroupApi);
    bloodGroupData = BloodGroupModel.fromJson(response);
    if (bloodGroupData.flag == "T") {
      setState(() {
        dataFound = true;
      });
    }
  }

  var derivedData = [];

  @override
  void initState() {
    gettingBloodgroupData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text("red _ drop"),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DonorRegistration(),
                      ));
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(width * 0.5, 0),
                ),
                child: const Text("Register as a Donor"),
              ),
            )
          ],
        ),
        body: Container(
          width: width,
          height: height,
          // color: Colors.black,
          child: dataFound == true
              ? ListView.builder(
                  itemCount: bloodGroupData.bloodGroupList!.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    child: Container(
                      decoration: BoxDecoration(border: Border.all()),
                      child: ListTile(
                        tileColor: Colors.red,
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DonorDetailsPage(
                                    bloodGroupDataBloodGroup: bloodGroupData
                                        .bloodGroupList![index].bloodGroup,
                                    bloodGroupDataName: bloodGroupData
                                        .bloodGroupList![index].name,
                                    bloodGroupDataAge: bloodGroupData
                                        .bloodGroupList![index].age,
                                    bloodGroupDataAddress: bloodGroupData
                                        .bloodGroupList![index].address),
                              ));
                        },
                        leading: CircleAvatar(
                            radius: 20,
                            child: ClipOval(
                              child: Text(bloodGroupData
                                  .bloodGroupList![index].bloodGroup!
                                  .split(" ")
                                  .first),
                            )),
                        hoverColor: Colors.white,
                        title: Text(
                          bloodGroupData.bloodGroupList![index].name.toString(),
                          style: const TextStyle(color: Colors.white),
                        ),
                        subtitle: Text(
                          bloodGroupData.bloodGroupList![index].bloodGroup
                              .toString(),
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                )
              : const Center(
                  child: CircularProgressIndicator(),
                ),
          // child: dataFound == true
          //     ? GridView.builder(
          //         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          //           crossAxisCount: 2,
          //           crossAxisSpacing: 10.0,
          //           mainAxisSpacing: 10.0,
          //         ),
          //         itemCount: bloodGroupData.bloodGroupList!.length,
          //         itemBuilder: (context, index) => Card(
          //           color: Colors.white,
          //           shape: RoundedRectangleBorder(
          //             borderRadius: BorderRadius.circular(100),
          //           ),
          //           child: Center(
          //             child: Column(
          //               mainAxisAlignment: MainAxisAlignment.center,
          //               crossAxisAlignment: CrossAxisAlignment.start,
          //               children: [
          //                 Text(
          //                   bloodGroupData.bloodGroupList![index].name
          //                       .toString(),
          //                   style: const TextStyle(
          //                       color: Colors.black, fontSize: 20),
          //                 ),
          //                 Text(
          //                   bloodGroupData.bloodGroupList![index].bloodGroup
          //                       .toString(),
          //                   style: const TextStyle(
          //                       color: Colors.black, fontSize: 14),
          //                 ),
          //               ],
          //             ),
          //           ),
          //         ),
          //       )
        ),
      ),
    );
  }
}
