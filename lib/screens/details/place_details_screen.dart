import 'package:aspen_project/configuration/app_images.dart';
import 'package:aspen_project/model/facilities_model.dart';
import 'package:aspen_project/model/popular_model.dart';
import 'package:aspen_project/utils/ui/custom_button.dart';
import 'package:aspen_project/utils/ui/shared_reference.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class PlaceDetailsScreen extends StatefulWidget {
  final Popular model;

  const PlaceDetailsScreen({super.key, required this.model});

  @override
  State<PlaceDetailsScreen> createState() => _PlaceDetailsScreenState();
}

class _PlaceDetailsScreenState extends State<PlaceDetailsScreen> {
  final List<Facilities> _facilities = [];
  late Future<bool> _isFavorite;

  @override
  void initState() {
    super.initState();
    _fillFacilities();
    _isFavorite = Shared.getPrefBool(widget.model.id);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PopScope(
        canPop: false,
        child: Scaffold(
          body: Container(
            height: 100.h,
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                Stack(
                  children: [
                    SizedBox(width: 100.w, height: 42.h),
                    Image.asset(widget.model.image,
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
                      bottom: 0,
                      right: 20,
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
                          future: _isFavorite,
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
                                  Shared.savePrefBoll(widget.model.id, myBool);
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
                  height: 3,
                ),
                SizedBox(
                  height: 37.h,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.model.name,
                            style: TextStyle(
                                fontSize: 17.sp, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "Show map",
                            style: TextStyle(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w700,
                                color: const Color(0xff196EEE)),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Row(
                        children: [
                          const Icon(Icons.star,
                              color: Color(0XFFDF9652), size: 12),
                          Text(" ${widget.model.rate} (355 Reviews)",
                              style: TextStyle(
                                  fontSize: 8.sp,
                                  color: const Color(0xff606060),
                                  fontWeight: FontWeight.w400)),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        widget.model.description,
                        style: TextStyle(
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w900,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            'Read more',
                            style: TextStyle(
                              color: const Color(0xff176FF2),
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const Icon(
                            Icons.keyboard_arrow_down,
                            size: 24,
                            color: Color(0xff176FF2),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Facilities',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          height: 1.21,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Expanded(
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
                ),
              ],
            ),
          ),
          bottomNavigationBar: SizedBox(
            width: double.infinity,
            height: 9.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 10, 56, 10),
                  child: Column(
                    children: [
                      Text(
                        'Price',
                        style: TextStyle(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w500,
                          height: 1.25,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        '\$199',
                        style: TextStyle(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w700,
                          height: 1.21,
                          color: const Color(0xff2cd6a3),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 10, right: 10),
                  child: CustButton(
                    width: 30.h,
                    buttonChild: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Book Now',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            height: 1.2575,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.arrow_forward_rounded,
                          color: Colors.white,
                          size: 24,
                        )
                      ],
                    ),
                    onTap: () {},
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _fillFacilities() {
    _facilities.addAll([
      Facilities(image: heaterFacilities, label: "1 Heater"),
      Facilities(image: dinnerFacilities, label: "Dinner"),
      Facilities(image: tubFacilities, label: "1 Tub"),
      Facilities(image: poolFacilities, label: "Pool"),
    ]);
  }
}
