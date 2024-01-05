import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SelectedLocationWidget extends StatefulWidget {
  const SelectedLocationWidget({Key? key}) : super(key: key);

  @override
  State<SelectedLocationWidget> createState() => _SelectedLocationWidgetState();
}

class _SelectedLocationWidgetState extends State<SelectedLocationWidget> {
  bool isExpanded = false;

  String selectedValue = 'Aspen,USA';

  //list that will be expanded
  List<String> locationList = [
    'Aspen,USA',
    'Jordan,Amman',
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
            width: 50.w,
            height: 17.h,
        ),
        Positioned(
          top: 39,
          // left: 57,
          right: 20,
          child: Container(
            margin: const EdgeInsets.all(5),
            width: 140,
            height: 16,
            child: InkWell(
              onTap: () {
                FocusScope.of(context).unfocus();
                isExpanded = !isExpanded;
                setState(() {});
              },
              child: Row(
                children: [
                  const Icon(
                    Icons.location_on,
                    color: Color(0xff0858D0),
                    size: 16,
                  ),
                  Text(
                    selectedValue,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      height: 1.2575,
                      color: Color(0xff5f5f5f),
                    ),
                  ),
                  Icon(
                      isExpanded
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                      color: isExpanded
                          ? Colors.grey
                          : const Color(0xff0858D0),
                      size: 16)
                ],
              ),
            ),
          ),
        ),
        if (isExpanded)
          Positioned(
            top: 65,
            left: 40,
            right: 15,
            child: Container(
              width: 95,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(7),
                border: Border.all(color: Colors.grey.shade300, width: 2),
              ),
              child: ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                physics: const BouncingScrollPhysics(),
                children: locationList
                    .map(
                      (e) => InkWell(
                        onTap: () {
                          isExpanded = false;
                          selectedValue = e;
                          setState(() {});
                        },
                        child: Container(
                          height: 25,
                          width: 100,
                          decoration: BoxDecoration(
                            color: selectedValue == e
                                ? Colors.white
                                : Colors.grey.shade200,
                          ),
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                e.toString(),
                                style: TextStyle(
                                    fontSize: 14,
                                    color: selectedValue == e
                                        ? Colors.black
                                        : Colors.black),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              if (selectedValue == e)
                                const Icon(Icons.check,
                                  color: Color(0xff0858D0),
                                  size: 16,),
                            ],
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
      ],
    );
  }
}
