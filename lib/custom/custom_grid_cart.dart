import 'package:flutter/material.dart';

class CustomGridCart extends StatefulWidget {
  final IconData icon;
  final String title;
  final Color color;
  const CustomGridCart({
    super.key,
    required this.icon,
    required this.title,
    required this.color,
  });

  @override
  State<CustomGridCart> createState() => _CustomGridCartState();
}

class _CustomGridCartState extends State<CustomGridCart> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 56,
        width: 151,
        decoration: BoxDecoration(
          color: widget.color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Icon(
                widget.icon,
                size: 21,
                color: const Color.fromARGB(255, 230, 190, 190),
              ),
            ),
            Text(widget.title,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500))
          ],
        ));
  }
}
