import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0E0412),
      body: Stack(
        children: [
          Positioned(
            top: 45,
            left: 24,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xffF4CE9B).withOpacity(0.6), // Glow color
                        spreadRadius: 2,
                        blurRadius: 23,
                      ),
                    ],
                  ),
                  child: CircleAvatar(
                    radius: 26,
                    backgroundImage: NetworkImage(
                      'https://images.pexels.com/photos/1697912/pexels-photo-1697912.jpeg?cs=srgb&dl=pexels-javon-swaby-197616-1697912.jpg&fm=jpg',
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 0.0),
                      child: Text(
                        "Welcome!",
                        style: TextStyle(
                          color: Color(0xffF5F5F5),
                          fontFamily: "GeneralSans",
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: Text(
                        "Moive Magic Awaits",
                        style: TextStyle(
                          color: Color(0xffE1E1E1),
                          fontFamily: "GeneralSans",
                          fontWeight: FontWeight.w300,
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: 130,
            left: 24,
            child: Column(
              children: [
                Text(
                  "Now Showing",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "GeneralSans",
                    fontWeight: FontWeight.w800,
                    fontSize: 25,
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
