import 'package:flixaura_movie_app/screens/ViewAll_Section/view_all_comedy.dart';
import 'package:flutter/material.dart';

class ComedyMovies extends StatelessWidget {
  ComedyMovies({super.key});

  final List<Map<String, dynamic>> comedyMovies = [
    {
      "image": "assets/images/homealone.jpg",
      "title": "Home Alone",
      "year": "1990",
      "duration": "1h 43m",
    },
    {
      "image": "assets/images/mrbean.jpg",
      "title": "Mr. Bean's Holiday",
      "year": "2007",
      "duration": "1h 30m",
    },
    {
      "image": "assets/images/hangover.jpg",
      "title": "The Hangover",
      "year": "2009",
      "duration": "1h 40m",
    },
    {
      "image": "assets/images/dumbanddumber.jpg",
      "title": "Dumb and Dumber",
      "year": "1994",
      "duration": "1h 47m",
    },
    {
      "image": "assets/images/21jumpstreet.jpg",
      "title": "21 Jump Street",
      "year": "2012",
      "duration": "1h 49m",
    },
    {
      "image": "assets/images/superbad.jpg",
      "title": "Superbad",
      "year": "2007",
      "duration": "1h 53m",
    },
    {
      "image": "assets/images/jumanji.jpg",
      "title": "Jumanji: Welcome...",
      "year": "2017",
      "duration": "1h 59m",
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
                "Comedy",
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
                      MaterialPageRoute(builder: (context) => ViewAllComedy()),
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
            itemCount: comedyMovies.length,
            itemBuilder: (context, index) {
              final movie = comedyMovies[index];
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
