import 'package:flutter/material.dart';

class ViewAllScifi extends StatefulWidget {
  const ViewAllScifi({super.key});

  @override
  State<ViewAllScifi> createState() => _ViewAllScifiState();
}

class _ViewAllScifiState extends State<ViewAllScifi> {
  final List<Map<String, dynamic>> scifiMovies = [
    {
      "image":
          "https://www.slamedia.org/wp-content/uploads/2014/11/interstellar-feat.jpeg",
      "title": "Interstellar",
    },
    {
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQhQcF5pSaAuo-CZiw-Ezj-5F7dpkbt6AEGEg&s",
      "title": "The Martian",
    },
    {
      "image":
          "https://static1.srcdn.com/wordpress/wp-content/uploads/2019/12/Inception.jpg",
      "title": "Inception",
    },
    {
      "image":
          "https://www.baltimoremagazine.com/wp-content/uploads/2019/12/blade-runner-2049-1.jpg",
      "title": "Blade Runner 2049",
    },
    {
      "image":
          "https://platform.vox.com/wp-content/uploads/sites/2/chorus/uploads/chorus_asset/file/25309598/rev_1_DUN2_T3_0084r_High_Res_JPEG.jpeg?quality=90&strip=all&crop=10.44921875%2C0%2C79.1015625%2C100&w=2400",
      "title": "Dune",
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
                "Sc-Fi Moives",
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
                itemCount: scifiMovies.length,
                itemBuilder: (context, index) {
                  final moive = scifiMovies[index];
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Stack(
                        children: [
                          Image.network(
                            moive["image"],
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
                                child: Center(
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
                              moive["title"],
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
