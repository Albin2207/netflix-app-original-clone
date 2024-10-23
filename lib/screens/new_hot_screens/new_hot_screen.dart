import 'package:flutter/material.dart';
import 'package:netflix_clone_app/screens/new_hot_screens/widgets/coming_soon.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({super.key});

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Two tabs
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.black,
            title: const Text(
              'New & Hot',
              style: TextStyle(color: Colors.white),
            ),
            actions: [
              const Padding(
                padding: EdgeInsets.only(right: 10.0),
                child: Icon(
                  Icons.cast,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Container(
                  color: Colors.blue,
                  height: 27,
                  width: 27,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
            ],
            bottom: TabBar(
              dividerColor: Colors.black,
              isScrollable: true,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              labelColor: Colors.black,
              labelStyle:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              unselectedLabelColor: Colors.white,
              tabs: const [
                Tab(
                  text: '  🍿 Coming Soon  ',
                ),
                Tab(
                  text: "  🔥 Everyone's watching  ",
                ),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              // Coming Soon Tab
              SingleChildScrollView(
                child: Column(
                  children: [
                    ComingSoonMovieWidget(
                      imageUrl: 'https://miro.medium.com/v2/resize:fit:1024/1*P_YU8dGinbCy6GHlgq5OQA.jpeg',
                      overview: 'Movie 1 Overview',
                      logoUrl: 'https://s3.amazonaws.com/www-inside-design/uploads/2017/10/strangerthings_feature-983x740.jpg',
                      month: "Jun",
                      day: "19",
                    ),
                    SizedBox(height: 20),
                    ComingSoonMovieWidget(
                      imageUrl: 'https://image.tmdb.org/t/p/original/czembW0Rk1Ke7lCJGahbOhdCuhV.jpg',
                      overview: 'Movie 2 Overview',
                      logoUrl: 'https://image.tmdb.org/t/p/original/hMXA6XiQoqKfqHk3xEKX5WlND4U.jpg',
                      month: "Mar",
                      day: "07",
                    ),
                    // Repeat for 10 items
                    SizedBox(height: 20),
                    ComingSoonMovieWidget(
                      imageUrl: 'https://image.tmdb.org/t/p/original/22dj38IckjzEEUZwN1tPU5VJ1qq.jpg',
                      overview: 'Movie 3 Overview',
                      logoUrl: 'https://image.tmdb.org/t/p/original/gq5Wi7i4SF3lo4HHkJasDV95xI9.jpg',
                      month: "Apr",
                      day: "12",
                    ),
                    SizedBox(height: 20),
                    ComingSoonMovieWidget(
                      imageUrl: 'https://image.tmdb.org/t/p/original/7SAp9DBEJNA3gXuQtum3u2SffQa.jpg',
                      overview: 'Movie 4 Overview',
                      logoUrl: 'https://image.tmdb.org/t/p/original/7D8sLZjiNzEfMwhjZIzkLc7Kuue.jpg',
                      month: "May",
                      day: "5",
                    ),
                    SizedBox(height: 20),
                    ComingSoonMovieWidget(
                      imageUrl: 'https://image.tmdb.org/t/p/original/oGHr8yUOXtVK0mGoZURZqqbwXXj.jpg',
                      overview: 'Movie 5 Overview',
                      logoUrl: 'https://image.tmdb.org/t/p/original/s9DOGlKfXWlnxAdOJHQzP3aRqt0.jpg',
                      month: "May",
                      day: "12",
                    ),
                    ComingSoonMovieWidget(
                      imageUrl: 'https://image.tmdb.org/t/p/original/apQL85BMRgkBWQq6pBXKOLfCyaV.jpg',
                      overview: 'Movie 6 Overview',
                      logoUrl: 'https://image.tmdb.org/t/p/original/7REKNkOggGOJjCr4CtAjanpNJAp.jpg',
                      month: "Aug",
                      day: "12",
                    ),
                    ComingSoonMovieWidget(
                      imageUrl: 'https://image.tmdb.org/t/p/original/p6AbOJvMQhBmffd0PIv0u8ghWeY.jpg',
                      overview: 'Movie 7 Overview',
                      logoUrl: 'https://image.tmdb.org/t/p/original/yrrroLEH6YQymPuHU1ucRFDOnkj.jpg',
                      month: "Aug",
                      day: "24",
                    ),
                    ComingSoonMovieWidget(
                      imageUrl: 'https://image.tmdb.org/t/p/original/z1p34vh7dEOnLDmyCrlUVLuoDzd.jpg',
                      overview: 'Movie 8 Overview',
                      logoUrl: 'https://image.tmdb.org/t/p/original/9L1SCXQ9ERqOY4elzqxv3Xz0SsM.jpg',
                      month: "Oct",
                      day: "17",
                    ),
                    ComingSoonMovieWidget(
                      imageUrl: 'https://image.tmdb.org/t/p/original/NNxYkU70HPurnNCSiCjYAmacwm.jpg',
                      overview: 'Movie 9 Overview',
                      logoUrl: 'https://image.tmdb.org/t/p/original/tyuBWhADudiwYY5po8YLrJmI46R.jpg',
                      month: "Dec",
                      day: "12",
                    ),
                    ComingSoonMovieWidget(
                      imageUrl: 'https://image.tmdb.org/t/p/original/zShZtXl2sMMCEodueSJM3cENNR8.jpg',
                      overview: 'Movie 10 Overview',
                      logoUrl: 'https://image.tmdb.org/t/p/original/2QAgU73vSh2QV9NBdjNVnTL1h8A.jpg',
                      month: "dec",
                      day: "19",
                    ),
                  ],
                ),
              ),
              
              // Everyone's Watching Tab
              SingleChildScrollView(
                child: Column(
                  children: [
                    ComingSoonMovieWidget(
                      imageUrl: 'https://i.etsystatic.com/18242346/r/il/fd61f8/2933715225/il_570xN.2933715225_a913.jpg',
                      overview: 'Movie A Overview',
                      logoUrl: 'https://i.etsystatic.com/18242346/r/il/fd61f8/2933715225/il_570xN.2933715225_a913.jpg',
                      month: "",
                      day: "",
                    ),
                     Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'WandaVision is a Marvel TV series blending classic sitcom elements with superhero drama. The story follows Wanda Maximoff and Vision as they navigate suburban life, uncovering hidden truths about their reality. As the series progresses, the facade of their perfect life begins to crack, revealing a deeper mystery tied to their past and future. With a unique mix of comedy, drama, and action, "WandaVision" explores themes of grief, love, and identity.',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    SizedBox(height: 20),
                    ComingSoonMovieWidget(
                      imageUrl: 'https://media.karousell.com/media/photos/products/2022/10/10/avatar_movie_posters_1665376838_02d18abd_progressive',
                      overview: 'Movie B Overview',
                      logoUrl: 'https://media.karousell.com/media/photos/products/2022/10/10/avatar_movie_posters_1665376838_02d18abd_progressive',
                      month: "",
                      day: "",
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'Avatar: The Way of Water is the sequel to James Camerons epic sci-fi film Avatar.Set over a decade after the events of the first film, it explores the underwater world of Pandora and follows the continued adventures of Jake Sully and Neytiri as they face new challenges to protect their family and home. The film showcases groundbreaking visual effects and explores themes of family, environmentalism, and cultural survival. It further expands on the rich, immersive world of Pandora with stunning aquatic visuals and compelling storytelling.',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    SizedBox(height: 20),
                    ComingSoonMovieWidget(
                      imageUrl: 'https://creativereview.imgix.net/content/uploads/2023/12/Oppenheimer.jpg?auto=compress,format&q=60&w=1263&h=2000',
                      overview: 'Movie C Overview',
                      logoUrl: 'https://creativereview.imgix.net/content/uploads/2023/12/Oppenheimer.jpg?auto=compress,format&q=60&w=1263&h=2000',
                      month: "",
                      day: "",
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'Oppenheimer is a biographical film directed by Christopher Nolan, focusing on the life of J. Robert Oppenheimer, the physicist often referred to as the "father of the atomic bomb." The film delves into Oppenheimers role in the Manhattan Project and the moral and personal struggles he faced as he helped develop the first nuclear weapons. With its intense storytelling and historical depth, the film explores themes of ambition, responsibility, and the profound impact of scientific discovery. It offers a gripping portrayal of one of the 20th century’s most influential and controversial figures.',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    SizedBox(height: 20),
                    ComingSoonMovieWidget(
                      imageUrl: 'https://images7.alphacoders.com/294/294072.jpg',
                      overview: 'Movie C Overview',
                      logoUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRwRGOxUEs6EgOmy3YEBVxwQUO36cPYDb7zyw&s',
                      month: "",
                      day: "",
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'Breaking Bad is a critically acclaimed TV series that follows Walter White, a high school chemistry teacher turned methamphetamine manufacturer. After being diagnosed with terminal cancer, Walter partners with former student Jesse Pinkman to secure his familys financial future by producing and selling high-quality blue meth. The show delves into Walters transformation from a mild-mannered educator to a ruthless drug lord, exploring themes of morality, power, and consequence. With its gripping narrative and complex characters, "Breaking Bad" is renowned for its intense drama and storytelling.',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    SizedBox(height: 20),
                    ComingSoonMovieWidget(
                      imageUrl: 'https://static.hbo.com/game-of-thrones-1-1920x1080.jpg',
                      overview: 'Movie C Overview',
                      logoUrl: 'https://static.hbo.com/game-of-thrones-1-1920x1080.jpg',
                      month: "",
                      day: "",
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'Game of Thrones is a fantasy television series based on the novels by George R.R. Martin. It follows the power struggles among noble families as they vie for control of the Iron Throne and the Seven Kingdoms of Westeros. Set in a world filled with political intrigue, epic battles, and mythical creatures, the series explores themes of loyalty, betrayal, and ambition. Known for its complex characters and unexpected twists, Game of Thrones captivated audiences with its rich storytelling and dramatic visuals.',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    SizedBox(height: 20),
                    ComingSoonMovieWidget(
                      imageUrl: 'https://assets-in.bmscdn.com/iedb/movies/images/mobile/thumbnail/xlarge/aavesham-et00386326-1707203790.jpg',
                      overview: 'Movie C Overview',
                      logoUrl: 'https://assets-in.bmscdn.com/iedb/movies/images/mobile/thumbnail/xlarge/aavesham-et00386326-1707203790.jpg',
                      month: "",
                      day: "",
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'Aavesham is a Malayalam thriller film that delves into the life of a man entangled in a web of conspiracy and danger. The story revolves around his struggle to uncover the truth while facing numerous challenges and threats. With its gripping narrative and suspenseful twists, Aavesham keeps the audience on edge as it explores themes of mystery and justice. The film is known for its intense performances and engaging storyline.',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    SizedBox(height: 20),
                    ComingSoonMovieWidget(
                      imageUrl: 'https://dnm.nflximg.net/api/v6/2DuQlx0fM4wd1nzqm5BFBi6ILa8/AAAAQeIeKt7LlqIJPKrT4aQijclj7K43xRSU3dQXNESNdNbnnJbT6LLWVRT9srUUbHbOo-iOH-8v3o16pUDMQ6tCgNGlkvfwvDOprROIZpQ2rgHtop9rHvbYlvzavMmUSGBCXjynJ80dn4nqZzZmzIUJMQpS.jpg?r=943',
                      overview: 'Movie C Overview',
                      logoUrl: 'https://dnm.nflximg.net/api/v6/2DuQlx0fM4wd1nzqm5BFBi6ILa8/AAAAQeIeKt7LlqIJPKrT4aQijclj7K43xRSU3dQXNESNdNbnnJbT6LLWVRT9srUUbHbOo-iOH-8v3o16pUDMQ6tCgNGlkvfwvDOprROIZpQ2rgHtop9rHvbYlvzavMmUSGBCXjynJ80dn4nqZzZmzIUJMQpS.jpg?r=943',
                      month: "",
                      day: "",
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        '1899 is a suspenseful Netflix series set aboard a migrant ship traveling from Europe to America. The show follows a diverse group of passengers who encounter mysterious and unsettling events during their voyage. As the journey unfolds, secrets and supernatural occurrences emerge, unraveling a complex and eerie narrative. With its atmospheric setting and intricate plot, 1899 blends historical drama with psychological thriller elements to captivate viewers.',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    SizedBox(height: 20),
                    ComingSoonMovieWidget(
                      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQADbQfGfusboewd_YXI9i4mfzZ5qnkTDrx_w&s',
                      overview: 'Movie C Overview',
                      logoUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQADbQfGfusboewd_YXI9i4mfzZ5qnkTDrx_w&s',
                      month: "",
                      day: "",
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'Stranger Things is a popular sci-fi series set in the 1980s that follows a group of kids in the small town of Hawkins, Indiana, as they encounter mysterious and supernatural events. The story begins with the disappearance of a young boy and leads to the discovery of a secret government experiment and a parallel dimension known as the Upside Down. Blending elements of horror, mystery, and nostalgia, the show explores themes of friendship, bravery, and the unknown. With its engaging storyline and nostalgic references, Stranger Things has captivated audiences of all ages.',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    SizedBox(height: 20),
                    ComingSoonMovieWidget(
                      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSW-c4vZWEG9TECKZtiiOFWd2LmxvEzsFcRew&s',
                      overview: 'Movie C Overview',
                      logoUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSW-c4vZWEG9TECKZtiiOFWd2LmxvEzsFcRew&s',
                      month: "",
                      day: "",
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'Dark is a German sci-fi thriller series that centers on the mysterious disappearances of children in a small town called Winden. The show delves into the town’s intricate web of secrets, revealing a complex narrative involving time travel, interconnected families, and a cyclical pattern of events spanning several generations. With its atmospheric tension and intricate storytelling, Dark explores themes of fate, family, and the impact of time on human lives. The series is known for its dark, enigmatic tone and mind-bending plot twists.',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    SizedBox(height: 20),
                    ComingSoonMovieWidget(
                      imageUrl: 'https://dnm.nflximg.net/api/v6/2DuQlx0fM4wd1nzqm5BFBi6ILa8/AAAAQR1Z6M90xEk-7pbVcXQbu669mhe4snqWJ0jfWBrmD6O4-QwZ39mxKuo8PfEGQa2R6Qsq5G1Dtaq6R01hTfBrvrjOeNt4E_9r_bj0N2OTMfzphJxYn44prjPGMf8nzdPLcTJ8xPHICSnztBZWG5-TTtUF.jpg?r=81b',
                      overview: 'Movie C Overview',
                      logoUrl: 'https://dnm.nflximg.net/api/v6/2DuQlx0fM4wd1nzqm5BFBi6ILa8/AAAAQR1Z6M90xEk-7pbVcXQbu669mhe4snqWJ0jfWBrmD6O4-QwZ39mxKuo8PfEGQa2R6Qsq5G1Dtaq6R01hTfBrvrjOeNt4E_9r_bj0N2OTMfzphJxYn44prjPGMf8nzdPLcTJ8xPHICSnztBZWG5-TTtUF.jpg?r=81b',
                      month: "",
                      day: "",
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'Eric is a drama film featuring Benedict Cumberbatch in a leading role. The story follows Eric, a complex character whose life is marked by personal and professional struggles. Cumberbatch delivers a compelling performance as Eric navigates a series of emotional and challenging situations, revealing deep layers of his character. The film is known for its powerful storytelling and Cumberbatch’s standout portrayal, exploring themes of resilience and self-discovery.',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
