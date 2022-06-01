import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie/model/movie.dart';

class DetailsPage extends StatefulWidget {
  Movie movie;
  DetailsPage({Key? key, required this.movie}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  bool isSaved = false;
  @override
  Widget build(BuildContext context) {
    var we = MediaQuery.of(context).size.width;
    var he = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          Image.network(
            widget.movie.fullImageUrl,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.only(top: he * 0.06, left: we * .04),
            child: FadeInDown(
              child: Container(
                width: 50,
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.withOpacity(0.7),
                ),
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: he * 0.47),
            child: FadeInUp(
              delay: const Duration(milliseconds: 400),
              child: Container(
                width: we,
                height: he * 0.6,
                decoration: const BoxDecoration(
                    color: Color(0xff121225),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: he * 0.045, left: 25),
                      child:FadeIn(
                        delay: const Duration(seconds:1),
                        child: Text(
                          widget.movie.title,
                          style:
                              GoogleFonts.lato(color: Colors.white, fontSize: widget.movie.title.length >= 30 ?  14: 23),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 27, top: he * 0.099),
                      child: const Text("TMDB Studio",
                          style: TextStyle(
                            color: Colors.grey,
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: he * .092, left: we * 0.4),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.star_outline,
                            color: Colors.yellow,
                          ),
                          SizedBox(
                            width: we * 0.01,
                          ),
                          Text(
                            widget.movie.vote_average.toString(),
                            style: const TextStyle(color: Colors.yellow),
                          ),
                          SizedBox(
                            width: we * 0.01,
                          ),
                          Text("(${widget.movie.vote_count})",
                              style: const TextStyle(color: Colors.yellow)),
                          SizedBox(width: we * 0.09),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: we * 0.8, top: he * 0.04),
                      child: InkWell(
                        onTap: (){
                          setState(() => isSaved = !isSaved);
                        },
                        child: Container(
                          width: 60,
                          height: 60,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  width: 1,
                                  color: Colors.white.withOpacity(0.2))),
                          child: Icon(isSaved?
                           Icons.bookmark :Icons.bookmark_outline,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(left: 25, top: he * 0.15),
                        child: Image.asset(
                          "images/icons8-imdb-an-online-database-of-information-related-to-films,-and-television-programs-96.png",
                          width: 45,
                          height: 45,
                        )),
                    Padding(
                      padding: EdgeInsets.only(left: we * 0.22, top: he * 0.15),
                      child: Text(
                        "${widget.movie.vote_average}/10",
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: we * 0.22, top: he * 0.185),
                      child: const Text("Overall Rating",
                          style: TextStyle(color: Colors.grey, fontSize: 12)),
                    ),
                    Padding(
                        padding:
                            EdgeInsets.only(left: we * 0.48, top: he * 0.15),
                        child: Image.asset(
                          "images/icons8-tomato-64.png",
                          width: 45,
                          height: 45,
                        )),
                    Padding(
                      padding:
                          EdgeInsets.only(left: we * 0.62, top: he * 0.155), //
                      child: Text(
                        "${(widget.movie.vote_average * 10).round()}%",
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(left: we * 0.62, top: he * 0.185),
                      child: const Text("Average Tomatometer",
                          style: TextStyle(color: Colors.grey, fontSize: 12)),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 25, top: he * 0.24),
                      child: Text(
                        "Cast",
                        style: GoogleFonts.lato(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ),
                    // Cast widget ....... 
                    Padding(
                      padding: EdgeInsets.only(top: he * 0.28, left: 25),
                      child: const CircleAvatar(
                        radius: 16,
                        backgroundImage: NetworkImage(
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSNOzRGW1KgfkefLAR8TIk5KkXO5wmFOesHQhA49mrGodPT8JwK"),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: he * 0.28, left: 40),
                      child: const CircleAvatar(
                        backgroundImage: NetworkImage(
                          "https://m.media-amazon.com/images/M/MV5BYWViYWU1MjQtZmYwMy00ZjUyLTkyYzgtMmZhMmUwNDU0ZTI4XkEyXkFqcGdeQXVyNDAzNDk0MTQ@._V1_.jpg",
                        ),
                        radius: 16,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: he * 0.28, left: 60),
                      child: const CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://upload.wikimedia.org/wikipedia/commons/thumb/4/4b/Benedict_Cumberbatch_SDCC_2014.jpg/1200px-Benedict_Cumberbatch_SDCC_2014.jpg"),
                        radius: 16,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: he * 0.28, left: 80),
                      child: const CircleAvatar(
                        radius: 16,
                        backgroundImage: NetworkImage(
                            "https://upload.wikimedia.org/wikipedia/commons/4/46/Johnny_Depp_%28July_2009%29_2_cropped.jpg?20210809165401"),
                      ),
                    ),
                    Padding(
                        padding:
                            EdgeInsets.only(top: he * 0.29, left: we * 0.31),
                        child: const Text(
                          "20+ cast",
                          style: TextStyle(color: Colors.grey),
                        )),
                    Padding(
                      padding: EdgeInsets.only(top: he * 0.29, left: we * 0.67),
                      child: Text(
                        "Show All on IMDb",
                        style: GoogleFonts.lato(color: Colors.yellow),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: he * 0.35, left: we * 0.05),
                      child: Text(
                        "Storyline",
                        style: GoogleFonts.lato(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: he * 0.38, left: we * 0.05),
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(
                            parent: AlwaysScrollableScrollPhysics()),
                        child: Text(
                          widget.movie.overview,
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: he * 0.43, left: we * 0.07),
                      child: FadeInDown(
                        delay: const Duration(seconds: 1),
                        from: 16,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              padding: EdgeInsets.symmetric(
                                  vertical: 22, horizontal: we * 0.37),
                              primary: const Color(0xFF733FF1)),
                          onPressed: () {},
                          child: Text("Play Now",
                              style: GoogleFonts.lato(
                                  fontSize: 13, fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
