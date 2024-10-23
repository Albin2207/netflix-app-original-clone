import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:netflix_clone_app/widgets/appbar_downloads.dart';
import 'package:netflix_clone_app/widgets/colors.dart';
import 'package:netflix_clone_app/widgets/constants.dart';

class ScreenDownloads extends StatefulWidget {
  const ScreenDownloads({super.key});

  @override
  _ScreenDownloadsState createState() => _ScreenDownloadsState();
}

class _ScreenDownloadsState extends State<ScreenDownloads> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    // Simulate loading delay
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBarWidget(
          title: 'Downloads',
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            // Main content
            ListView.separated(
              padding: const EdgeInsets.all(10),
              itemBuilder: (ctx, index) => _widgetList[index],
              separatorBuilder: (ctx, index) => const SizedBox(height: 25),
              itemCount: _widgetList.length,
            ),
            // Loading indicator
            if (_isLoading)
              Center(
                child: CircularProgressIndicator(),
              ),
          ],
        ),
      ),
    );
  }

  final List<Widget> _widgetList = [
    const _SmartsDownloads(),
    Section2(),
    const Section3(),
  ];
}

class Section2 extends StatelessWidget {
  Section2({super.key});

  final List<String> imageUrls = [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTQji7VeicQwHSRawVGCcD5n_L6s1d0nAR6Mw&s',
    'https://ew.com/thmb/2nzZnTK6v-gy7avcYbvw0F17cbQ=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/endgame-poster-2000-513c47c947ae462da2bb7941c7bbc14f.jpg',
    'https://www.myvue.com/-/jssmedia/vuecinemas/img/import/7e5fc7a1-351f-403a-8573-0ac6f81dcfa4_kingdom-of-the-planet-of-the-apes_posters_kingdomapes_teaser_1s.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        const Text(
          'Introducing Downloads for you',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: kWhitecolor, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        kHeight,
        const Text(
          'We will download a personalized selection of\nmovies and shows for you. There is\nalways something to watch on your\ndevice.',
          textAlign: TextAlign.center,
          style: TextStyle(color: kgreycolor, fontSize: 16),
        ),
        kHeight,
        SizedBox(
          width: size.width,
          height: size.width,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Center(
                child: CircleAvatar(
                  backgroundColor: kgreycolor,
                  radius: size.width * 0.38,
                ),
              ),
              DownloadsImageWidgets(
                imageUrls: imageUrls[0],
                margin: const EdgeInsets.only(left: 150),
                angle: 25,
                size: Size(size.width * 0.58, size.width * 0.56),
                borderRadius: 10,
              ),
              DownloadsImageWidgets(
                imageUrls: imageUrls[1],
                margin: const EdgeInsets.only(right: 150),
                angle: -25,
                size: Size(size.width * 0.58, size.width * 0.56),
                borderRadius: 20,
              ),
              DownloadsImageWidgets(
                imageUrls: imageUrls[2],
                margin: const EdgeInsets.only(bottom: 5),
                size: Size(size.width * 0.46, size.width * 0.6),
                borderRadius: 10,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class Section3 extends StatelessWidget {
  const Section3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: MaterialButton(
            color: kButtoncolorbluethink,
            onPressed: () {},
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Text(
                'Set up',
                style: TextStyle(
                    color: kWhitecolor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        kHeight,
        MaterialButton(
          color: kButtoncolorwhite,
          onPressed: () {},
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              'See what you can download',
              style: TextStyle(
                  color: kBlackcolor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}

class _SmartsDownloads extends StatelessWidget {
  const _SmartsDownloads();

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        kWidth,
        Icon(
          Icons.settings,
          color: kWhitecolor,
        ),
        Text('Smart Downloads'),
      ],
    );
  }
}

class DownloadsImageWidgets extends StatelessWidget {
  const DownloadsImageWidgets({
    super.key,
    required this.imageUrls,
    this.angle = 0,
    required this.margin,
    required this.size,
    required this.borderRadius,
  });

  final String imageUrls;
  final double angle;
  final EdgeInsets margin;
  final Size size;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: Transform.rotate(
          angle: angle * pi / 180,
          child: Container(
            width: size.width,
            height: size.height,
            decoration: BoxDecoration(
              color: Colors.grey[300], // Placeholder color
              image: DecorationImage(
                image: NetworkImage(imageUrls),
                fit: BoxFit.cover,
                onError: (error, stackTrace) {
                  // Handle image load error
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
