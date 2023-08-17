import 'package:flutter/material.dart';

class CustomePageViewCart extends StatefulWidget {
  const CustomePageViewCart({super.key});

  @override
  State<CustomePageViewCart> createState() => _CustomePageViewCartState();
}

class _CustomePageViewCartState extends State<CustomePageViewCart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 128,
      decoration: BoxDecoration(
        color: Color(0xFFECFDF3),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
          margin: EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "App Development",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                "Develop beautiful fast mobile applications",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
            ],
          )),
    );
  }
}
