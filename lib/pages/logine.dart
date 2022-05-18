import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie/home.dart';
import 'package:page_transition/page_transition.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var we = MediaQuery.of(context).size.width;
    var he = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xff121225),
      appBar: AppBar(
        backgroundColor: const Color(0xff121225),
        elevation: 0,
        title: Text(
          "Aplay",
          style: GoogleFonts.lato(color: Colors.white, fontSize: 25),
        ),
        centerTitle: true,
      ),
      body: SizedBox(
        width: we,
        height: he,
        child: Column(
          children: [
            Image.asset("images/youtube.png"),
            SizedBox(
              height: he * 0.03,
            ),
            Padding(
              padding: EdgeInsets.only(right: we * 0.25),
              child: Text(
                  " One video\n streaming for daily\n life entertainment",
                  style: GoogleFonts.lato(color: Colors.white, fontSize: 30)),
            ),
            SizedBox(
              height: he * 0.03,
            ),
            Padding(
              padding: EdgeInsets.only(right: we * 0.3),
              child: const Text(
                "One video player for play all kind\nof video on offiline or online",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
            SizedBox(
              height: he * 0.07,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10, left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 70),
                        primary: const Color(0xFF733FF1)),
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          PageTransition(
                              child: HomePage(),
                              type: PageTransitionType.fade));
                    },
                    child: Text("Login",
                        style: GoogleFonts.lato(
                            fontSize: 13, fontWeight: FontWeight.bold)),
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            width: 1, color: Colors.white.withOpacity(0.2))),
                    child: const FaIcon(
                      FontAwesomeIcons.facebook,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            width: 1, color: Colors.white.withOpacity(0.2))),
                    child: const FaIcon(
                      FontAwesomeIcons.google,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
