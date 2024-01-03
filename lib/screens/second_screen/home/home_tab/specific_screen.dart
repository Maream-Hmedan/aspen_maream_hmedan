// ignore_for_file: must_be_immutable, deprecated_member_use

import 'package:aspen_project/widget/shared_reference.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../model/facilities_model.dart';

class SpecificScreen extends StatefulWidget {
  final String id;
  String image;
  String name;
  String description;
  String rate;

  SpecificScreen(
      {super.key,
      required this.id,
      required this.image,
      required this.description,
      required this.name,
      required this.rate});

  @override
  State<SpecificScreen> createState() => _SpecificScreenState();
}

class _SpecificScreenState extends State<SpecificScreen> {
  final List<Facilities> _facilities = [];
  late Future<bool> isFavorite;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fillFacilities();
    isFavorite = Shared.getPrefBool(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        onWillPop: () {
          return Future.value(false);
        },
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                Stack(
                  children: [
                    SizedBox(width: 100.w, height: 42.h),
                    Image.asset(widget.image,
                        width: 100.w, height: 40.h, fit: BoxFit.fill),
                    Positioned(
                      top: 20,
                      left: 15,
                      child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              color: const Color(0xfFF3F8FE),
                              borderRadius: BorderRadius.circular(8)),
                          child: IconButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              icon: const Icon(
                                Icons.arrow_back_ios_sharp,
                                color: Color(0xffB8B8B8),
                              ))),
                    ),
                    Positioned(
                      top: 310,
                      left: 300,
                      child: Container(
                        width: 70,
                        height: 50,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xffB8B8B8),
                              spreadRadius: 0,
                              blurRadius: 19,
                              offset: Offset(0, 6),
                            ),
                          ],
                        ),
                        child: FutureBuilder<bool>(
                          future: isFavorite,
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              // If the Future is still running, you can show a loading indicator.
                              return const CircularProgressIndicator();
                            } else if (snapshot.hasError) {
                              // If there was an error while fetching the data, you can handle it here.
                              return Text('Error: ${snapshot.error}');
                            } else {
                              // The Future<bool> has completed, and you can use the result.
                              bool myBool = snapshot.data ??
                                  false; // Use a default value if null.
                              return FavoriteButton(
                                iconSize: 50,
                                isFavorite: myBool,
                                valueChanged: (isFavorite) {
                                  myBool = isFavorite;
                                  Shared.savePrefBoll(widget.id, myBool);
                                },
                              );
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.name,
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.w600),
                    ),
                    const Column(
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Show map",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff196EEE)),
                        )
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    const Icon(Icons.star, color: Color(0XFFDF9652), size: 12),
                    Text(" ${widget.rate} (355 Reviews)",
                        style: const TextStyle(
                            fontSize: 12,
                            color: Color(0xff606060),
                            fontWeight: FontWeight.w400)),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  widget.description,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w900,
                    color: Color(0xff000000),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 15, 233, 0),
                  width: double.infinity,
                  child: const Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Read more',
                        style: TextStyle(
                          color: Color(0xff176FF2),
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Icon(
                        Icons.keyboard_arrow_down,
                        size: 24,
                        color: Color(0xff176FF2),
                      )
                    ],
                  ),
                ),
                Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 25, 290, 10),
                      width: double.infinity,
                      child: const Text(
                        'Facilities',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          height: 1.2175,
                          color: Color(0xff232323),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 74,
                      width: double.infinity,
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemCount: _facilities.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, int index) {
                          final facilities = _facilities[index];
                          return Container(
                            height: 74,
                            width: 85,
                            margin: const EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              gradient: const LinearGradient(
                                colors: <Color>[
                                  Color(0x0c176ef2),
                                  Color(0x0c186eee)
                                ],
                                stops: <double>[0, 1],
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(facilities.image,
                                    width: 32, height: 32, fit: BoxFit.fill),
                                Text(
                                  facilities.label,
                                  style: const TextStyle(
                                    fontSize: 10,
                                    color: Color(0xffB8B8B8),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          bottomNavigationBar: Container(
            width: double.infinity,
            height: 84,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 2, 56, 30),
                  height: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        // price1ek (0:69)
                        margin: const EdgeInsets.only(bottom: 5),
                        child: const Text(
                          'Price',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            height: 1.2575,
                            color: Color(0xff232323),
                          ),
                        ),
                      ),
                      const Text(
                        '\$199',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          height: 1.2175,
                          color: Color(0xff2cd6a3),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 2, 0, 30),
                  height: 56,
                  width: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    gradient: const LinearGradient(
                      colors: <Color>[Color(0xff176ef2), Color(0xff186eee)],
                      stops: <double>[0, 1],
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x3d0038ff),
                        offset: Offset(0, 6),
                        blurRadius: 9.5,
                      ),
                    ],
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Book Now   ',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          height: 1.2575,
                          color: Color(0xffffffff),
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_rounded,
                        color: Color(0xffffffff),
                        size: 24,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void fillFacilities() {
    _facilities.addAll([
      Facilities(image: "assets/images/Vectorvector.png", label: "1 Heater"),
      Facilities(image: "assets/images/foodfood.png", label: "Dinner"),
      Facilities(image: "assets/images/bath tubbath.png", label: "1 Tub"),
      Facilities(image: "assets/images/Frameframe.png", label: "Pool"),
    ]);
  }
}
