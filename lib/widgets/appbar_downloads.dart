import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone_app/widgets/colors.dart';
import 'package:netflix_clone_app/widgets/constants.dart';



class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        kWidth, 
        Text(
          title,
          style: GoogleFonts.montserrat(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacer(),
        const Icon(
          Icons.cast,
          color:kWhitecolor,
          size: 30,
        ),
        kWidth,
        Container(
          width: 30,
          height: 25,
          color: Colors.blue,
        ),
        kWidth,
      ],
    );
  }
}
