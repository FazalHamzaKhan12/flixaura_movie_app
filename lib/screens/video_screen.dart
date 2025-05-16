import 'package:flixaura_movie_app/widgets/video_player.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:readmore/readmore.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({super.key});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  final List<String> genres = [
    "Action",
    "Adventure",
    "History",
    "Horror",
    "Comedy",
    "Drama",
    "Fantasy",
    "Sci-Fi",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0E0412),
      body: Stack(
        children: [
          const VideoPlayers(),
          Positioned(
            top: 310,
            left: 20,
            right: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "The Last Kingdom",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "GeneralSans",
                        fontWeight: FontWeight.w800,
                        fontSize: 18,
                      ),
                    ),
                    Row(
                      children: const [
                        Icon(
                          FontAwesomeIcons.download,
                          color: Colors.white,
                          size: 18,
                        ),
                        SizedBox(width: 20),
                        Icon(
                          FontAwesomeIcons.ellipsis,
                          color: Colors.white,
                          size: 20,
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                const Text(
                  "2023",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "GeneralSans",
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 25),
                const Text(
                  "Genre",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "GeneralSans",
                    fontWeight: FontWeight.w800,
                    fontSize: 23,
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 45,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children:
                        genres.map((genre) {
                          return Container(
                            margin: const EdgeInsets.only(right: 10),
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color(0xffB090F4),
                              ),
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.transparent,
                            ),
                            child: Center(
                              child: Text(
                                genre,
                                style: const TextStyle(
                                  color: Color(0xffB090F4),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                  ),
                ),
                const SizedBox(height: 25),
                const Text(
                  "Description",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "GeneralSans",
                    fontWeight: FontWeight.w800,
                    fontSize: 23,
                  ),
                ),
                const SizedBox(height: 10),
                SingleChildScrollView(
                  child: const ReadMoreText(
                    'The Last Kingdom is a gripping historical drama set in 9th-century England, following Uhtred of Bebbanburg — a Saxon boy raised by Vikings after his family is murdered. Torn between two worlds, Uhtred grows into a fierce warrior determined to reclaim his ancestral home. As England fractures under war and betrayal, he must choose between loyalty and destiny. With intense battles, rich storytelling, and powerful themes of identity and honor, this series is an unforgettable ride for fans of epic drama.',
                    trimLines: 4,
                    trimCollapsedText: 'Read more',
                    colorClickableText: Colors.green,
                    trimExpandedText: 'Show less',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "GeneralSans",
                      fontWeight: FontWeight.w100,
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
