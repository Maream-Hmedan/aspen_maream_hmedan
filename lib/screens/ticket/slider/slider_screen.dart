import 'package:aspen_project/screens/ticket/slider/slider_response.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
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
  List<SliderApp>? _sliders = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _loadSlider();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(

      height: 27.h,
      padding: EdgeInsets.zero,
      child: _carouselWithIndicatorView(),
    );
  }

  void _loadSlider() async {
    var url = Uri.parse(
        "http://e-commerce.albatross-solution.com/api/App/LookupMobile/GetListIntro");
    var response = await http.post(url);
    if (response.statusCode == 200) {
      SliderResponse sliderResponse = SliderResponse.fromRawJson(response.body);
      if (sliderResponse.slider != null) {
        _sliders = sliderResponse.slider ?? [];
        if (_sliders!.isEmpty) {
          _sliders = null;
        }
      }
    } else {
      _sliders = null;
    }
    if (mounted) {
      setState(() {});
    }
  }

  Widget _carouselWithIndicatorView() {
    if (_sliders == null) {
      return const Center(
        child: Text("No sliders"),
      );
    }
    if (_sliders!.isEmpty) {
      return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          return _getShimmerView();
        },
        itemCount: 10,
        shrinkWrap: true,
      ); // shimmer
    }
    return Column(
      children: [
        CarouselSlider(
          items: _sliders!
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
          children: _sliders!.asMap().entries.map((entry) {
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
