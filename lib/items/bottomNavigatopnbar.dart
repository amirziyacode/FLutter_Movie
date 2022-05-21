// ignore_for_file: constant_identifier_names

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

enum BottomItems { Explore, Play, Saved, User }

class BottomNa extends StatefulWidget {
  const BottomNa({Key? key}) : super(key: key);

  @override
  _BottomNaState createState() => _BottomNaState();
}

class _BottomNaState extends State<BottomNa> {
  BottomItems selectedItems = BottomItems.Explore;
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
        children: [
          InkWell(
            onTap: () {
              setState(() {
                selectedItems = BottomItems.Explore;
              });
            },
            child: selectedItems == BottomItems.Explore
                ? isActiveWidget("Explore")
                : const Icon(
                    Icons.explore,
                    color: Colors.grey,
                  ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                selectedItems = BottomItems.Play;
              });
            },
            child: selectedItems == BottomItems.Play
                ? isActiveWidget("Player")
                : const Icon(
                    Icons.play_circle,
                    color: Colors.grey,
                  ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                selectedItems = BottomItems.Saved;
              });
            },
            child: selectedItems == BottomItems.Saved
                ? isActiveWidget("Saved")
                : const Icon(
                    Icons.bookmark_outline,
                    color: Colors.grey,
                  ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                selectedItems = BottomItems.User;
              });
            },
            child: selectedItems == BottomItems.User
                ? isActiveWidget("User")
                : const Icon(
                    Icons.person_outline,
                    color: Colors.grey,
                  ),
          )
        ],
      ),
    );
  }

  Widget isActiveWidget(String title) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FadeIn(
          delay: const Duration(milliseconds: 100),
          child: Text(
            title,
            style: const TextStyle(color: Colors.white),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.005,
        ),
        FadeInLeft(
          from: 15,
          child: const SizedBox(
              height: 3,
              width: 30,
              child: LinearProgressIndicator(
                minHeight: 10,
                value: 1,
                color: Color(0xFF733FF1),
                backgroundColor: Color(0xff202032),
              )),
        )
      ],
    );
  }
}
