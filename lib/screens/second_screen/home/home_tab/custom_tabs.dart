import 'package:aspen_project/screens/second_screen/home/home_tab/tab_location.dart';
import 'package:flutter/material.dart';

class CustomTab extends StatefulWidget {
  const CustomTab({Key? key}) : super(key: key);

  @override
  State<CustomTab> createState() => _CustomTabState();
}

class _CustomTabState extends State<CustomTab> {
  List<String> items = [
    "Location",
    "Hotels",
    "Food",
    "Adventure",
    "Activity",
    "Profile",
  ];

  List<Widget> pages = [
    const TabLocationPage(),
    const Icon(
      Icons.search,
    ),
    const Icon(
      Icons.feed,
    ),
    const Icon(
      Icons.post_add,
    ),
    const Icon(
      Icons.local_activity,
    ),
    const Icon(
      Icons.settings,
    ),
    const Icon(Icons.person),
  ];
  int current = 0;
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(left: 7,top:5),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 60,
              margin: const EdgeInsets.only(left: 15),
              padding: const EdgeInsets.only(top: 9),
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: items.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          current = index;
                        });
                      },
                      child: Container(
                        width: 89,
                        height: 41,
                        decoration: BoxDecoration(
                          color: current == index
                              ? const Color(0xffF3F8FE)
                              : null,
                          borderRadius: current == index
                              ? BorderRadius.circular(32)
                              : null,
                        ),
                        child: Center(
                          child: Text(
                            items[index],
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: current == index
                                  ? const Color(0xff176FF2)
                                  : const Color(0xffB8B8B8),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            ),

            //  BODY
            SizedBox(
              width: double.infinity,
              height: 490,
              child: PageView.builder(
                itemCount: pages.length,
                controller: pageController,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return pages[current];
                },
              ),
            ),
          ],
        ),
    );
  }
}