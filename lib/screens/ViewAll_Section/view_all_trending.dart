import 'package:flutter/material.dart';

class ViewAllTrending extends StatelessWidget {
  ViewAllTrending({super.key});

  final List<Map<String, dynamic>> trendingMovies = [
    {
      "image":
          "https://beam-images.warnermediacdn.com/BEAM_LWM_DELIVERABLES/8db82f99-0c69-4a9f-b125-7e0eb1bb4dd2/53570804107a33c106ddc3e7141dc29d705270a6.jpg?host=wbd-images.prod-vod.h264.io&partner=beamcom",
      "title": "Evil Dead Rise",
    },
    {
      "image":
          "https://ew.com/thmb/oFuh76aKdmdbQsNf3zEcecCe6ZE=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/john-wick-4-062624-038ce4be0dfc43f0a8ce819d3a90951a.jpg",
      "title": "John Wick",
    },
    {
      "image":
          "https://occ-0-8407-90.1.nflxso.net/dnm/api/v6/E8vDc_W8CLv7-yMQu8KMEC7Rrr8/AAAABeMZkNnHuV8Y6pFrWEjxEZG8xvjo-JqEJzrBVbBo76pxXC9QOCBcJZZU0KjD8hONdRR6x9QAGgpUZCLr0ljFcZlBS1gjBo-Y5D6-.jpg?r=570",
      "title": "Wednesday",
    },
    {
      "image":
          "https://img1.hotstarext.com/image/upload/f_auto/sources/r1/cms/prod/1791/1611791-i-3b22c4f693bd",
      "title": "Vikram",
    },
    {
      "image":
          "https://dnm.nflximg.net/api/v6/2DuQlx0fM4wd1nzqm5BFBi6ILa8/AAAAQWk-u5af8_RU4ZF_gBEy9XbJzfWMa4LYCEP4vtt8AZiACkaLdvcvI580-OwfrTmC2p6Mmmp7__3HUZSjtsHQXL__fu65GrQxgXhw5IoyEISlbto_ZreMRAYxofVvIVUt2HNGCE8phrrcgj8ThcfkcO58.jpg?r=932",
      "title": "Cassandra",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff0E0412),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(24.0),
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
            Expanded(
              child: ListView.builder(
                itemCount: trendingMovies.length,
                itemBuilder: (context, index) {
                  final movie = trendingMovies[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 10,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Stack(
                        children: [
                          Image.network(
                            movie["image"],
                            height: 220,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) return child;
                              return Container(
                                height: 220,
                                color: Colors.grey[800],
                                child: const Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                                ),
                              );
                            },
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                height: 220,
                                color: Colors.grey[800],
                                child: const Center(
                                  child: Icon(
                                    Icons.error,
                                    color: Colors.white,
                                    size: 40,
                                  ),
                                ),
                              );
                            },
                          ),
                          Positioned(
                            bottom: 10,
                            left: 10,
                            child: Text(
                              movie["title"],
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
