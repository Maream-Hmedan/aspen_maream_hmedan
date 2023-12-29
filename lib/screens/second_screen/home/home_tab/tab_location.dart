import 'package:aspen_project/model/recommended_model.dart';
import 'package:aspen_project/screens/second_screen/home/home_tab/specific_screen.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../../../model/popular_model.dart';

class TabLocationPage extends StatefulWidget {
  const TabLocationPage({super.key});

  @override
  State<TabLocationPage> createState() => _TabLocationPageState();
}

class _TabLocationPageState extends State<TabLocationPage> {
  final List<Popular> _popularLocation = [];
  final List<Recommended> _recommendedLocation = [];



  @override
  void initState() {
    // TODO: implement initState
    fillPopularLocation();
    fillRecommendedLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 20, bottom: 10),
            child: Row(
              children: [
                Text("Popular",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color(0XFF232323))),
                SizedBox(
                  width: 265,
                ),
                Text(
                  "See all",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff176FF2)),
                )
              ],
            ),
          ),
          SizedBox(
            height: 250,
            child: ListView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: _popularLocation.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, int index) {
                final popular = _popularLocation[index];
                return InkWell(
                  onTap: ()  {
                      PersistentNavBarNavigator.pushNewScreen(
                      context,
                      screen: SpecificScreen(
                        image: popular.image,
                        description: popular.description,
                        name: popular.name,
                        rate: popular.rate,
                        id: popular.iD,
                      ),
                      withNavBar: false,
                    );
                  },
                  child: Stack(
                    children: [
                      Container(
                        width: 188,
                        height: 240,
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          image: DecorationImage(
                              image: AssetImage(popular.image),
                              fit: BoxFit.cover),
                        ),
                      ),
                      Positioned(
                        top: 170,
                        left: 35,
                        child: Container(
                          width: 98,
                          height: 23,
                          decoration: const BoxDecoration(
                            color: Color(0XFF4D5652),
                            borderRadius: BorderRadius.all(Radius.circular(59)),
                          ),
                          child: Center(
                            child: Text(popular.name,
                                style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0XFFFFFFFF))),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 200,
                        left: 35,
                        child: Container(
                          width: 52,
                          height: 24,
                          decoration: const BoxDecoration(
                            color: Color(0XFF4D5652),
                            borderRadius: BorderRadius.all(Radius.circular(59)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Icon(Icons.star,
                                  color: Color(0XFFF8D675), size: 16),
                              Text(
                                popular.rate,
                                style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0XFFFFFFFF)),
                              ),
                            ],
                          ),
                        ),
                      ),
                        Positioned(
                          top: 205,
                          left: 170,
                          child: Container(
                            width: 24,
                            height: 24,
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
                            child: const Icon(Icons.favorite,size: 11,color: Colors.red ),
                          ),
                        ),
                    ],
                  ),
                );
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20, bottom: 10),
            child: Text("Recommended",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Color(0XFF232323))),
          ),
          SizedBox(
            height: 170,
            child: ListView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: _recommendedLocation.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, int index) {
                final recommend = _recommendedLocation[index];
                return Container(
                  height: 95,
                  width: 174,
                  margin: const EdgeInsets.only(
                      left: 20, right: 20, bottom: 5, top: 5),
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0xff97A0B2),
                        spreadRadius: 0,
                        blurRadius: 20,
                        offset: Offset(0, 4),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(16),
                    color: const Color(0xffF4F4F4),
                  ),
                  child: Stack(
                    children: [
                      Container(
                        width: 200,
                        height: 110,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          image: DecorationImage(
                              image: AssetImage(recommend.image),
                              fit: BoxFit.cover),
                        ),
                      ),
                      Positioned(
                        top: 120,
                        left: 35,
                        child: Center(
                          child: Text(recommend.name,
                              style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0XFF232323))),
                        ),
                      ),
                      Positioned(
                        top: 100,
                        left: 110,
                        child: Container(
                          width: 45,
                          height: 20,
                          decoration: BoxDecoration(
                            color: const Color(0XFF4D5652),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(59),
                            ),
                            border: Border.all(color: Colors.white, width: 2),
                          ),
                          child: Center(
                            child: Text(
                              recommend.rate,
                              style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0XFFFFFFFF)),
                            ),
                          ),
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
    );
  }

  void fillPopularLocation() {
    _popularLocation.addAll(
      [
        Popular(
          image: "assets/images/Alley_palace.png",
          name: "Alley Palace",
          rate: "4.1",
          description: 'Aspen is as close as one can get to'
              ' a storybook alpine town in America. The '
              'choose-your-own-adventure possibilities—skiing, hiking, dining shopping and ....',
          iD: 'Alley_Palace',
        ),
        Popular(
          image: "assets/images/coourdes_alpea.png",
          name: "Coeurdes Alpes",
          rate: "4.5",
          description: 'Coeurdes Alpes is as close as one '
              'can get to a storybook alpine town in America. The choose-your-own-adventure'
              ' possibilities—skiing, hiking, dining shopping.',
          iD: 'Coeurdes_Alpes',
        ),
      ],
    );
  }

  void fillRecommendedLocation() {
    _recommendedLocation.addAll([
      Recommended(
          image: "assets/images/explore_aspen.png",
          name: "Explore Aspen",
          rate: "4N/5D"),
      Recommended(
          image: "assets/images/luxuriou.png",
          name: "Luxurious Aspen",
          rate: "2N/3D"),
    ]);
  }
}
