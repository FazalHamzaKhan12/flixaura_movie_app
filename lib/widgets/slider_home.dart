import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart' as carousel;
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SliderHome extends StatefulWidget {
  const SliderHome({super.key});

  @override
  State<SliderHome> createState() => _SliderHomeState();
}

class _SliderHomeState extends State<SliderHome> {
  int currentIndex = 0; // ✅ Added missing currentIndex

  final List<Map<String, dynamic>> movies = [
    {
      "id": 1,
      "image_path": "assets/images/TheLastKingdom.jpeg",
      "title": "The Last Kingdom",
    },
    {
      "id": 2,
      "image_path": "assets/images/TheLastAirbender.jpeg",
      "title": "The Last Airbender",
    },
    {
      "id": 3,
      "image_path": "assets/images/wednesday.jpg",
      "title": "Wednesday",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      // ✅ Wrap widgets inside Column
      children: [
        const SizedBox(height: 10),
        carousel.CarouselSlider(
          items:
              movies.map((item) {
                return Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        item["image_path"],
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      left: 15,
                      child: Text(
                        item["title"],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: "GeneralSans",
                        ),
                      ),
                    ),
                  ],
                );
              }).toList(),
          options: carousel.CarouselOptions(
            height: 200,
            scrollPhysics: const BouncingScrollPhysics(),
            autoPlay: true,
            aspectRatio: 16 / 9,
            viewportFraction: 0.9,
            enlargeCenterPage: true,
            onPageChanged: (index, reason) {
              setState(() {
                currentIndex = index;
              });
            },
          ),
        ),
        const SizedBox(height: 10),
        Center(
          child: AnimatedSmoothIndicator(
            activeIndex: currentIndex,
            count: movies.length,
            effect: const WormEffect(
              activeDotColor: Colors.white,
              dotColor: Colors.white30,
              dotHeight: 8,
              dotWidth: 8,
            ),
          ),
        ),
      ],
    );
  }
}
