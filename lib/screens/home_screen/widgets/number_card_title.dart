import 'package:flutter/material.dart';
import 'package:netflix_clone_app/models/top_rated.dart';
import 'package:netflix_clone_app/screens/home_screen/widgets/number_card.dart';
import 'package:netflix_clone_app/widgets/constants.dart';
import 'package:netflix_clone_app/widgets/main_numcard_titile.dart';

class NumberTitleCard extends StatelessWidget {
  final Future<TopRatedMovies> future;
  final String headlineText;

  const NumberTitleCard({
    super.key,
    required this.future,
    required this.headlineText,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<TopRatedMovies>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var movies = snapshot.data!.results.take(10).toList(); // Take top 10 movies
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MainTitle(title: headlineText),
              kHeight,
              LimitedBox(
                maxHeight: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: movies.length,
                  itemBuilder: (context, index) {
                    return NumberCard(
                      movie: movies[index], // Pass movie data
                    );
                  },
                ),
              ),
            ],
          );
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
