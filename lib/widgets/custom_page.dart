import 'package:flutter/material.dart';

class CustomPage extends StatelessWidget {
  final String image;
  final String title;
  final TextStyle titleStyle;
  final String text;
  final String backgroundImage;
  final TextStyle textStyle;

  const CustomPage({super.key, required this.title, required this.text, required this.backgroundImage, required this.textStyle, required this.image, required this.titleStyle});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(backgroundImage),
            fit: BoxFit.cover
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 50),
          Image.asset(
            image,
            width: 300,
            height: 250,
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Text(
                title,
                textAlign: TextAlign.center,
                style: titleStyle
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 64.0),
            child: Text(
                text,
                textAlign: TextAlign.center,
                style: textStyle
            ),
          ),
        ],
      ),
    );
  }
}