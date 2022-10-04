

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/core/utils/bottom_bar_cus.dart';
import 'package:movie_app/tv/presentation/components/on_air_component.dart';
import 'package:movie_app/tv/presentation/components/popular_tv_component.dart';
import 'package:movie_app/tv/presentation/components/top_rated_tv_component.dart';
import 'package:movie_app/tv/presentation/controller/tv_bloc.dart';


import '../../../core/services/services_locator.dart';
import '../../../core/utils/app_strings.dart';

class TvScreen extends StatelessWidget {
  const TvScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<TvBloc>()
        ..add(GetOnAirTvEvent())
        ..add(GetTopRatedTvEvent())
        ..add(GetPopularTvEvent()),
      child: Scaffold(
        bottomNavigationBar: const CustomBar(),
        body: SingleChildScrollView(
          key: const Key('Tv scrollView'),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const OnAirComponent(),
              Container(
                margin: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppStrings.popular,
                      style: GoogleFonts.poppins(
                        fontSize: 19,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.15,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        /// TODO : NAVIGATION TO POPULAR SCREEN
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: const [
                            Text(
                              AppStrings.seeMore,
                              style: TextStyle(color: Colors.white),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 16.0,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const PopularTvComponent(),
              Container(
                margin: const EdgeInsets.fromLTRB(
                  16.0,
                  24.0,
                  16.0,
                  8.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppStrings.topRated,
                      style: GoogleFonts.poppins(
                        fontSize: 19,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.15,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        /// TODO : NAVIGATION TO Top Rated Movies Screen
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: const [
                            Text(
                              AppStrings.seeMore,
                              style: TextStyle(color: Colors.white),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 16.0,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const TopRatedTvComponent(),
              const SizedBox(height: 50.0),
            ],
          ),
        ),
      ),
    );
  }

  // _navBar(BuildContext context) {
  //   return GNav(tabs: [
  //
  //         GButton(
  //           icon: Icons.tv,
  //           text: 'TV',
  //           onPressed: (){
  //             Navigator.push(context, MaterialPageRoute(builder: (context)=>TvScreen()));
  //           },
  //         ),
  //         GButton(
  //           icon: Icons.movie,
  //           text: 'Movies',
  //           onPressed: (){
  //             Navigator.push(context, MaterialPageRoute(builder: (context)=>MovieScreen()));
  //           },
  //         ),
  //
  //   ]);
  // }
}
