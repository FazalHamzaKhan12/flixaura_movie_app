import 'package:flutter/material.dart';

class ViewAllComedy extends StatefulWidget {
  const ViewAllComedy({super.key});

  @override
  State<ViewAllComedy> createState() => _ViewAllComedyState();
}

class _ViewAllComedyState extends State<ViewAllComedy> {
  final List<Map<String, dynamic>> comedyMovies = [
    {
      "image":
          "https://whsvikingtimes.com/wp-content/uploads/2024/05/Comicbookcom.jpg",
      "title": "IF",
    },
    {
      "image":
          "https://images.bauerhosting.com/empire/2024/04/fall-guy-2.jpg?ar=16%3A9&fit=crop&crop=top&auto=format&w=1440&q=80",
      "title": "The Fall Guy",
    },
    {
      "image":
          "https://saltlakefilmreview.com/wp-content/uploads/2024/04/img_2071-1.jpg?w=1000",
      "title": "Ghostbusters: Frozen Empire",
    },
    {
      "image":
          "https://ew.com/thmb/3weoSswXE8m9zpDlvH3Tw0vj188=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/mcdmegi_ec101_h-2000-455c822dfe904f93865819ce1023d839.jpg",
      "title": "Mean Girls",
    },
    {
      "image":
          "https://hawkhappenings.org/wp-content/uploads/2024/05/Cox-B-Movie-Review-1200x675.jpg",
      "title": "Anyone But You",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff0E0412),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(24.0),
              child: Text(
                "Comedy Moives",
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
                itemCount: comedyMovies.length,
                itemBuilder: (context, index) {
                  final moives = comedyMovies[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15.0,
                      vertical: 10,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(22),
                      child: Stack(
                        children: [
                          Image.network(
                            moives["image"],
                            height: 220,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) return child;
                              return Container(
                                height: 220,
                                color: Colors.grey[800],
                                child: Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                                ),
                              );
                            },
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                height: 220,
                                color: Colors.white,
                                child: Icon(
                                  Icons.error,
                                  color: Colors.white,
                                  size: 40,
                                ),
                              );
                            },
                          ),
                          Positioned(
                            bottom: 10,
                            left: 10,
                            child: Text(
                              moives["title"],
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
