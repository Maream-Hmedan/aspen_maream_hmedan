import 'package:aspen_project/screens/ticket/slider/slider_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class CarouselWithIndicatorDemo extends StatefulWidget {
  const CarouselWithIndicatorDemo({super.key});

  @override
  State<StatefulWidget> createState() {
    return _CarouselWithIndicatorState();
  }
}

class _CarouselWithIndicatorState extends State<CarouselWithIndicatorDemo> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  SliderController controller = Get.put(SliderController());

  // @override
  // void initState() {
  //   super.initState();
  //   WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
  //     // _loadSlider();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 27.h,
      padding: EdgeInsets.zero,
      child: _carouselWithIndicatorView(),
    );
  }

  // void _loadSlider() async {
  //   ApiResponse? response = await HttpWrapper(
  //     context: context,
  //   ).post();
  //   if (response != null && response.body != null) {
  //     SliderResponse sliderResponse =
  //         SliderResponse.fromJson(json.decode(utf8.decode(response.body!)));
  //     if (sliderResponse.slider != null) {
  //       _sliders = sliderResponse.slider;
  //     }
  //   }
  //
  //   if (mounted) {
  //     setState(() {});
  //   }
  //   // var url = Uri.parse(
  //   //     "http://e-commerce.albatross-solution.com/api/App/LookupMobile/GetListIntro");
  //   // var response = await http.post(url);
  //   // if (response.statusCode == 200) {
  //   //   SliderResponse sliderResponse = SliderResponse.fromRawJson(response.body);
  //   //   if (sliderResponse.slider != null) {
  //   //     _sliders = sliderResponse.slider ?? [];
  //   //     if (_sliders!.isEmpty) {
  //   //       _sliders = null;
  //   //     }
  //   //   }
  //   // } else {
  //   //   _sliders = null;
  //   // }
  //   // if (mounted) {
  //   //   setState(() {});
  //   // }
  // }

  Widget _carouselWithIndicatorView() {
    return Obx(() {
      if (controller.isLoading) {
        return ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            return _getShimmerView();
          },
          itemCount: 10,
          shrinkWrap: true,
        );
      }
      if (controller.isEmpty) {
        return const Center(
          child: Text("No sliders"),
        );
      }
      if(controller.isSuccess){
        return Column(
          children: [
            CarouselSlider(
              items: controller.sliders
                  .map((e) => Container(
                decoration: BoxDecoration(color: Colors.grey.shade200),
                margin: const EdgeInsets.all(5.0),
                child: ClipRRect(
                    borderRadius:
                    const BorderRadius.all(Radius.circular(5.0)),
                    child: Image.network(e.lookupIntroImageUrl!,
                        fit: BoxFit.cover, width: 1000.0)),
              ))
                  .toList(),
              carouselController: _controller,
              options: CarouselOptions(
                  autoPlay: true,
                  enlargeCenterPage: true,
                  aspectRatio: 2.0,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  }),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: controller.sliders.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () => _controller.animateToPage(entry.key),
                  child: Container(
                    width: 12.0,
                    height: 12.0,
                    margin:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: (Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black)
                            .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                  ),
                );
              }).toList(),
            ),
          ],
        );
      }
      if (controller.isError) {
        return const Center(
          child: Text("Error Happen"),
        );
      }
      return Container();
    });


  }

  Widget _getShimmerView() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        margin: const EdgeInsets.all(16),
        width: 250,
        color: Colors.white,
      ),
    );
  }
}
