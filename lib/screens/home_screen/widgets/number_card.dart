import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone_app/models/top_rated.dart';
import 'package:netflix_clone_app/widgets/colors.dart';
import 'package:netflix_clone_app/widgets/constants.dart';

class NumberCard extends StatelessWidget {
  final Result movie;

  const NumberCard({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            const SizedBox(
              height: 50,
              width: 120,
            ),
            Container(
              width: 130,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: kRadius20,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    "https://image.tmdb.org/t/p/w500${movie.posterPath}", // Use movie poster path
                  ),
                ),
              ),
            ),
          ],
        ),
        Positioned(
          top: 70,
          child: BorderedText(
            strokeWidth: 2.0,
            strokeColor: kWhitecolor,
            child: Text(
              movie.voteAverage.toStringAsFixed(1), // Display vote average or any other property
              style: const TextStyle(
                fontSize: 80,
                color: kBlackcolor,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.none,
                decorationColor: Colors.black,
              ),
            ),
          ),
        )
      ],
    );
  }
}
