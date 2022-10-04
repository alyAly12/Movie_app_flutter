import 'package:flutter/material.dart';
import 'package:movie_app/tv/presentation/screens/tv_screen.dart';

class TestsScreen extends StatelessWidget {
  const TestsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Image.asset(
                  'images/welcome.png',
                  fit: BoxFit.fitHeight,
                ),
                Center(
                  child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const TvScreen()));
                      },
                      child: Center(child:  Text('press here'.toUpperCase()))),
                )
              ],
            )));
  }
}
