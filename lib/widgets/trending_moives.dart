import 'package:flixaura_movie_app/screens/ViewAll_Section/view_all_trending.dart';
import 'package:flutter/material.dart';

class TrendingMoives extends StatefulWidget {
  const TrendingMoives({super.key});

  @override
  State<TrendingMoives> createState() => _TrendingMoivesState();
}

class _TrendingMoivesState extends State<TrendingMoives> {
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                "Trending",
                style: const TextStyle(
                  color: Colors.white,
                  fontFamily: "GeneralSans",
                  fontWeight: FontWeight.w800,
                  fontSize: 25,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: GestureDetector(
                onTap:
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ViewAllTrending(),
                      ),
                    ),
                child: const Text(
                  "View All",
                  style: TextStyle(
                    color: Color.fromARGB(255, 175, 175, 175),
                    fontFamily: "GeneralSans",
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 280,
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
                            child: const Icon(
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
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
    );
  }
}
