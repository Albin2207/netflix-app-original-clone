import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix_clone_app/models/movie_model.dart';
import 'package:netflix_clone_app/models/popular_movie.dart';
import 'package:netflix_clone_app/models/popular_tvshows.dart';
import 'package:netflix_clone_app/models/top_rated.dart';
import 'package:netflix_clone_app/models/tv_series_model.dart';
import 'package:netflix_clone_app/screens/home_screen/widgets/number_card_title.dart';
import 'package:netflix_clone_app/screens/home_screen/widgets/popular_shows_card.dart';
import 'package:netflix_clone_app/screens/search_screen.dart';
import 'package:netflix_clone_app/services/api_services.dart';
import 'package:netflix_clone_app/widgets/custom_carousel.dart';
import 'package:netflix_clone_app/widgets/upcoming_movie_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ApiServices apiServices = ApiServices();

  late Future<MovieModel> upcomingFuture;
  late Future<MovieModel> nowPlaying;
  late Future<TvSeriesModel> topRatedShows;
  late Future<PopularMovieModel> popularMovieModel;
  late Future<TopRatedMovies> topRatedMovies;
  late Future<PopularTvShowsModel> popularTvShowsModel;

  // ValueNotifier to track app bar visibility
  ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

  @override
  void initState() {
    upcomingFuture = apiServices.getUpcomingMovies();
    nowPlaying = apiServices.getNowPlayingMovies();
    topRatedShows = apiServices.getTopRatedSeries();
    popularMovieModel = apiServices.getpopularMovieModel();
    topRatedMovies = apiServices.gettopRatedMovies();
    popularTvShowsModel = apiServices.getpopularTvShowModels();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: scrollNotifier,
        builder: (BuildContext context, bool value, _) {
          return NotificationListener<UserScrollNotification>(
            onNotification: (UserScrollNotification notification) {
              final ScrollDirection direction = notification.direction;
              if (direction == ScrollDirection.reverse) {
                scrollNotifier.value = false; // Hide app bar on scroll down
              } else if (direction == ScrollDirection.forward) {
                scrollNotifier.value = true; // Show app bar on scroll up
              }
              return true;
            },
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      FutureBuilder<TvSeriesModel>(
                        future: topRatedShows,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return Stack(
                              children: [
                                CustomCarouselSlider(data: snapshot.data!),
                                Positioned(
                                  bottom: -21,
                                  right: 0,
                                  left: 0,
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Flexible(
                                          child: CustomButtonWidget(
                                            icon: Icons.add,
                                            title: 'My List',
                                          ),
                                        ),
                                        Flexible(
                                          child: playbutton(),
                                        ),
                                        Flexible(
                                          child: CustomButtonWidget(
                                            icon: Icons.info_outlined,
                                            title: 'Info',
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            );
                          }
                          return const SizedBox();
                        },
                      ),
                      const SizedBox(height: 30),
                      SizedBox(
                        height: 220,
                        child: UpcomingMovieCard(
                          future: nowPlaying,
                          headlineText: 'Now Playing',
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        height: 220,
                        child: UpcomingMovieCard(
                          future: upcomingFuture,
                          headlineText: 'Upcoming Movies',
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        height: 220,
                        child: NumberedTvShowsCard(
                          future: popularTvShowsModel,
                          headlineText: 'Popular TV Shows',
                        ),
                      ),
                      SizedBox(
                        height: 220,
                        child: UpcomingMovieCard(
                          future: popularMovieModel,
                          headlineText: 'Popular Movies',
                        ),
                      ),
                      SizedBox(
                        height: 270,
                        child: NumberTitleCard(
                          future: topRatedMovies,
                          headlineText: 'Top Rated',
                        ),
                      ),
                    ],
                  ),
                ),
                // AppBar that will appear and disappear on scroll
                scrollNotifier.value
                    ? AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        width: double.infinity,
                        height: 100,
                        color: Colors.black.withOpacity(0.3),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  'assets/logo.png',
                                  width: 120,
                                  height: 61,
                                ),
                                const Spacer(),
                                Padding(
                                  padding: const EdgeInsets.only(right: 20.0),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => const SearchScreen(),
                                        ),
                                      );
                                    },
                                    child: const Icon(
                                      Icons.search,
                                      size: 30,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(6),
                                  child: InkWell(
                                    onTap: () {},
                                    child: Container(
                                      color: Colors.blue,
                                      height: 27,
                                      width: 27,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 20),
                              ],
                            ),
                            const SizedBox(height: 10),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('TV Shows', style: TextStyle(color: Colors.white)),
                                Text('Movies', style: TextStyle(color: Colors.white)),
                                Text('Categories', style: TextStyle(color: Colors.white),),
                              ],
                            ),
                          ],
                        ),
                      )
                    : const SizedBox.shrink(),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget CustomButtonWidget({required IconData icon, required String title}) {
    return Container(
      height: 60, // Increase height to fit both icon and text
      width: 80, // Adjust width to accommodate both elements
      decoration: BoxDecoration(
        color: Colors.transparent, // Transparent background
        borderRadius: BorderRadius.circular(0),
      ),
      child: TextButton(
        onPressed: () {},
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all<Color>(Colors.transparent),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
            ),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Center the icon and text
          children: [
            Icon(
              icon,
              size: 19,
              color: Colors.white, // Icon color
            ),
            const SizedBox(height: 5), // Space between icon and text
            Text(
              title,
              style: const TextStyle(fontSize: 14, color: Colors.white), // Adjusted text size for better fit
              textAlign: TextAlign.center, // Align text to center
            ),
          ],
        ),
      ),
    );
  }

  Container playbutton() {
    return Container(
      height: 40, // Adjust height if necessary
      width: 110, // Adjust width to fit the text and icon
      decoration: BoxDecoration(
        color: Colors.transparent, // Keep it transparent
        borderRadius: BorderRadius.circular(0),
      ),
      child: TextButton.icon(
        onPressed: () {},
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all<Color>(Colors.transparent), // Transparent background
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
            ),
          ),
        ),
        icon: const Icon(
          Icons.play_circle_fill,
          size: 19, // Icon size
          color: Colors.white, // Icon color
        ),
        label: const Text(
          'Play',
          style: TextStyle(fontSize: 16, color: Colors.white), // Adjust text size and color
        ),
      ),
    );
  }
}
