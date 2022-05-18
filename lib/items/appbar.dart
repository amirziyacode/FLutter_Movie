import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class AppbarCustom extends StatelessWidget {
  const AppbarCustom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var we = MediaQuery.of(context).size.width;

    return Row(
      children: [
        SizedBox(
          width: we * 0.02,
        ),
        FadeInDown(
          delay: const Duration(milliseconds: 300),
          child: Container(
            width: 50,
            height: 50,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border:
                    Border.all(width: 1, color: Colors.white.withOpacity(0.2))),
            child: const Icon(
              Icons.apps,
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(
          width: we * 0.7,
        ),
        FadeInDown(
          delay: const Duration(milliseconds: 500),
          child: Container(
            width: 50,
            height: 50,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border:
                    Border.all(width: 1, color: Colors.white.withOpacity(0.2))),
            child: const Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(
          width: we * 0.02,
        )
      ],
    );
  }
}
