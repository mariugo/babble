import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton(
      {Key? key,
      required this.name,
      required this.height,
      required this.width,
      required this.onPressed})
      : super(key: key);

  final String name;
  final double height;
  final double width;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(height * 0.25),
        color: const Color.fromRGBO(0, 82, 218, 1.0),
      ),
      child: TextButton(
        onPressed: () => onPressed(),
        child: Text(
          name,
          style:
              const TextStyle(fontSize: 22, color: Colors.white, height: 1.5),
        ),
      ),
    );
  }
}
