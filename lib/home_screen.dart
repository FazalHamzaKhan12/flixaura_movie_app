import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart' as carousel;
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
    {"id": 3, "image_path": "assets/images/wednesday.jpg", "title": "Wedne"},
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0E0412),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Row with Avatar and Welcome
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 16,
              ),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xffF4CE9B).withOpacity(0.6),
                          spreadRadius: 2,
                          blurRadius: 23,
                        ),
                      ],
                    ),
                    child: const CircleAvatar(
                      radius: 26,
                      backgroundImage: NetworkImage(
                        'https://images.pexels.com/photos/1697912/pexels-photo-1697912.jpeg?cs=srgb&dl=pexels-javon-swaby-197616-1697912.jpg&fm=jpg',
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Welcome!",
                        style: TextStyle(
                          color: Color(0xffF5F5F5),
                          fontFamily: "GeneralSans",
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        "Movie Magic Awaits",
                        style: TextStyle(
                          color: Color(0xffE1E1E1),
                          fontFamily: "GeneralSans",
                          fontWeight: FontWeight.w300,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                "Now Showing",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "GeneralSans",
                  fontWeight: FontWeight.w800,
                  fontSize: 25,
                ),
              ),
            ),
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
            SizedBox(height: 10),
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
        ),
      ),
    );
  }
}
