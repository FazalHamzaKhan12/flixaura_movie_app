import 'package:flixaura_movie_app/screens/video_screen.dart';
import 'package:flixaura_movie_app/widgets/comedy_movies.dart';
import 'package:flixaura_movie_app/widgets/sci_fi_moives.dart';
import 'package:flixaura_movie_app/widgets/slider_home.dart';
import 'package:flixaura_movie_app/widgets/trending_moives.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                            color: const Color(0xffF4CE9B).withOpacity(0.4),
                            spreadRadius: 1,
                            blurRadius: 15,
                          ),
                        ],
                      ),
                      child: const CircleAvatar(
                        radius: 25,
                        backgroundImage: NetworkImage(
                          'https://i.pinimg.com/736x/ee/12/86/ee1286cee9b3f34a53fe5999c36e55d3.jpg',
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
                    SizedBox(width: 220),
                    InkWell(
                      onTap:
                          () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => VideoScreen(),
                            ),
                          ),
                      child: Icon(
                        FontAwesomeIcons.playCircle,
                        color: Colors.white,
                        size: 34,
                      ),
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
              // Here Slider For Movies
              SliderHome(),
              SizedBox(height: 20),
              TrendingMoives(),
              SizedBox(height: 20),
              SciFiMoives(),
              SizedBox(height: 20),
              ComedyMovies(),
            ],
          ),
        ),
      ),
    );
  }
}
