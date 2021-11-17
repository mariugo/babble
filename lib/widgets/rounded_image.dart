import 'dart:io';
import 'package:flutter/material.dart';

class RoundedImageNetwork extends StatelessWidget {
  const RoundedImageNetwork({
    Key? key,
    required this.imagePath,
    required this.size,
  }) : super(key: key);

  final String imagePath;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(size),
        ),
        color: Colors.black,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
            imagePath,
          ),
        ),
      ),
    );
  }
}

class RoundedImageFile extends StatelessWidget {
  const RoundedImageFile({
    Key? key,
    required this.image,
    required this.size,
  }) : super(key: key);
  final File image;
  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(size)),
        child: Image.file(
          image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
