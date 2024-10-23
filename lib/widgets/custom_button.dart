import 'package:flutter/material.dart';
import 'package:netflix_clone_app/widgets/colors.dart';




class CustomeButtonWidget extends StatelessWidget {
  const CustomeButtonWidget({
    required this.icon,
    required this.title,
    
    super.key,  this.iconsize=25,  this.fontSize=16,
  });
  final IconData icon;
  final String title;
  final double iconsize;
  final double fontSize;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: kWhitecolor,
          size: iconsize,
        ),
        Text(
          title,
          style:  TextStyle(
            fontSize:fontSize ,
            color: kWhitecolor,
          ),
        ),
      ],
    );
  }
}
