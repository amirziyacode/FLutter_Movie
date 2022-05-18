import 'package:flutter/material.dart';

class BottomNa extends StatefulWidget {
  const BottomNa({Key? key}) : super(key: key);

  @override
  _BottomNaState createState() => _BottomNaState();
}

class _BottomNaState extends State<BottomNa> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width * 0.95,
      height: MediaQuery.of(context).size.height * 0.1,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35),
          color: const Color(0xff202032)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          Icon(
            Icons.explore,
            color: Colors.grey,
          ),
          Icon(
            Icons.play_circle,
            color: Colors.grey,
          ),
          Icon(
            Icons.bookmark_outline,
            color: Colors.grey,
          ),
          Icon(
            Icons.person_outline,
            color: Colors.grey,
          )
        ],
      ),
    );
  }
}
