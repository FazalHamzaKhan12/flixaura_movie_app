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
    {
      "id": 3,
      "image_path": "assets/images/wednesday.jpg",
      "title": "Wednesday",
    },
  ];

  final List<Map<String, dynamic>> trendingMovies = [
    {
      "image": "assets/images/evil.jpg",
      "title": "Evil Dead Rise",
      "year": "2023",
      "duration": "1h 37m",
    },
    {
      "image": "assets/images/johnwick.jpg",
      "title": "John Wick",
      "year": "2023",
      "duration": "2hr 50m",
    },
    {
      "image": "assets/images/wednesdayl.jpg",
      "title": "Wednesday",
      "year": "2025",
      "duration": "2 Seasons",
    },
    {
      "image": "assets/images/vikram.jpg",
      "title": "Vikram",
      "year": "2022",
      "duration": "2h 54m",
    },
    {
      "image": "assets/images/animal.jpg",
      "title": "Animal",
      "year": "2025",
      "duration": "3h 21m",
    },
  ];

  final List<Map<String, dynamic>> scifiMovies = [
    {
      "image": "assets/images/MortalEngines.jpg",
      "title": "Mortal Engines",
      "year": "2018",
      "duration": "2h 8m",
    },
    {
      "image": "assets/images/UltramanRising.jpg",
      "title": "Ultraman: Rising",
      "year": "2024",
      "duration": "1h 57m",
    },
    {
      "image": "assets/images/interstellar.jpg",
      "title": "Interstellar",
      "year": "2014",
      "duration": "2h 49m",
    },
    {
      "image": "assets/images/themartian.jpg",
      "title": "The Martian",
      "year": "2015",
      "duration": "2h 24m",
    },
    {
      "image": "assets/images/Dune.jpg",
      "title": "Dune",
      "year": "2021",
      "duration": "2h 35m",
    },
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0E0412),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
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
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.0),
                    child: Text(
                      "Trending",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "GeneralSans",
                        fontWeight: FontWeight.w800,
                        fontSize: 25,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.0),
                    child: GestureDetector(
                      onTap: () {},
                      child: Text(
                        "View All",
                        style: TextStyle(
                          color: const Color.fromARGB(255, 175, 175, 175),
                          fontFamily: "GeneralSans",
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Column(
                children: [
                  SizedBox(
                    height: 280, // set height for horizontal row
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: trendingMovies.length,
                      itemBuilder: (context, index) {
                        final movie = trendingMovies[index];
                        return Container(
                          width: 190,
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            color: const Color(0xff0E0412),
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(16),
                                    child: Image.asset(
                                      movie["image"],
                                      height: 220,
                                      width: 190,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Positioned(
                                    top: 5,
                                    right: 5,
                                    child: CircleAvatar(
                                      radius: 15,
                                      backgroundColor: Colors.white24,
                                      child: Icon(
                                        size: 20,
                                        Icons.favorite,
                                        color: Colors.purpleAccent,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 4,
                                ),
                                child: Text(
                                  movie["title"],
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      movie["year"],
                                      style: const TextStyle(
                                        color: Colors.white54,
                                        fontSize: 12,
                                      ),
                                    ),
                                    Text(
                                      movie["duration"],
                                      style: const TextStyle(
                                        color: Colors.white54,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.0),
                        child: Text(
                          "Sci-Fi",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "GeneralSans",
                            fontWeight: FontWeight.w800,
                            fontSize: 25,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.0),
                        child: GestureDetector(
                          onTap: () {},
                          child: Text(
                            "View All",
                            style: TextStyle(
                              color: const Color.fromARGB(255, 175, 175, 175),
                              fontFamily: "GeneralSans",
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    height: 280, // set height for horizontal row
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: trendingMovies.length,
                      itemBuilder: (context, index) {
                        final movie = scifiMovies[index];
                        return Container(
                          width: 190,
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            color: const Color(0xff0E0412),
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(16),
                                    child: Image.asset(
                                      movie["image"],
                                      height: 220,
                                      width: 190,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Positioned(
                                    top: 5,
                                    right: 5,
                                    child: CircleAvatar(
                                      radius: 15,
                                      backgroundColor: Colors.white24,
                                      child: Icon(
                                        size: 20,
                                        Icons.favorite,
                                        color: Colors.purpleAccent,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 4,
                                ),
                                child: Text(
                                  movie["title"],
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      movie["year"],
                                      style: const TextStyle(
                                        color: Colors.white54,
                                        fontSize: 12,
                                      ),
                                    ),
                                    Text(
                                      movie["duration"],
                                      style: const TextStyle(
                                        color: Colors.white54,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
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
      ),
    );
  }
}
