import 'package:flutter/material.dart';

class titleWidget extends StatelessWidget {
  final String title;
  const titleWidget({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(fontFamily: "RalewayBold", fontSize: 20),
          )
        ],
      ),
    );
  }
}
