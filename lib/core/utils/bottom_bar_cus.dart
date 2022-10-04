import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:movie_app/movie/presentation/screens/movie_screen.dart';

import '../../tv/presentation/screens/tv_screen.dart';



class CustomBar extends StatelessWidget {
  const CustomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return GNav(
      tabs: [
        GButton(
          icon: Icons.tv_rounded,
          text: 'TV',
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => const TvScreen()));
          }
        ),

        GButton(
          icon: Icons.movie_filter_outlined,
          text: 'movies',
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => const MovieScreen()));
          } ,
        ),
      ],
    );
  }
}
