import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone_app/models/popular_tvshows.dart';
import 'package:netflix_clone_app/widgets/constants.dart';

class NumberedTvShowsCard extends StatelessWidget {
  final Future<PopularTvShowsModel> future;
  final String headlineText;

  const NumberedTvShowsCard({
    super.key,
    required this.future,
    required this.headlineText,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PopularTvShowsModel>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var tvShows = snapshot.data!.results.take(10).toList(); 
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                headlineText,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              kHeight,
              LimitedBox(
                maxHeight: 150,  // Reduce height to avoid overflow
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: tvShows.length,
                  itemBuilder: (context, index) {
                    return Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Container(
                            width: 120,  // Reduce width for smaller cards
                            height: 160,  
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),  
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                  'https://image.tmdb.org/t/p/w500${tvShows[index].posterPath}',
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 65,  
                          left: -5,
                          child: BorderedText(
                            strokeWidth: 3.0,  
                            strokeColor: Colors.white,
                            child: Text(
                              '${index + 1}', 
                              style: const TextStyle(
                                fontSize: 80,  
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ],
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
