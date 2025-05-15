import 'package:flixaura_movie_app/screens/ViewAll_Section/view_all_scifi.dart';
import 'package:flutter/material.dart';

class SciFiMoives extends StatelessWidget {
  SciFiMoives({super.key});

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
      "image": "assets/images/dune.jpg",
      "title": "Dune",
      "year": "2021",
      "duration": "2h 35m",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Padding(
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
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: GestureDetector(
                onTap:
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ViewAllScifi()),
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
            itemCount: scifiMovies.length,
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
