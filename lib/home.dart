import 'dart:ui';
import 'package:animate_do/animate_do.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:movie/items/appbar.dart';
import 'package:movie/model/movie_service.dart';
import 'items/bottomNavigatopnbar.dart';
import 'model/movie.dart';
import 'model/movies_exception.dart';

final moviesFutureProvider =
    FutureProvider.autoDispose<List<Movie>>((ref) async {
  ref.maintainState = true;
  final moveiService = ref.read(movieServiceProvider);
  final movies = await moveiService.getMovies();
  return movies;
});

class HomePage extends ConsumerWidget {
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var we = MediaQuery.of(context).size.width;
    var he = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: const Color(0xff121225),
        appBar: AppBar(
          backgroundColor: const Color(0xff121225),
          elevation: 0,
          actions: [AppbarCustom()],
        ),
        body: ref.watch(moviesFutureProvider).when(
            data: (movies) {
              return RefreshIndicator(
                onRefresh: () async {
                  return ref.refresh(moviesFutureProvider);
                },
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                  child: SizedBox(
                    width: we,
                    height: he,
                    child: Column(
                      children: [
                        SizedBox(
                          height: he * 0.03,
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: we * 0.38),
                          child: FadeInLeft(
                            delay: const Duration(milliseconds: 550),
                            child: Text("Explore new \nrelease movies..",
                                style: GoogleFonts.lato(
                                    color: Colors.white, fontSize: 30)),
                          ),
                        ),
                        SizedBox(
                          height: he * 0.04,
                        ),
                        SizedBox(
                          // width: we * 0.9,
                          height: he * 0.35,
                          child: Stack(
                            children: [
                              Swiper(
                                physics: const BouncingScrollPhysics(),
                                  itemCount: movies.length,
                                  scrollDirection: Axis.horizontal,
                                  viewportFraction: 0.8,
                                  scale: 0.85,
                                  layout: SwiperLayout.DEFAULT,
                                  itemBuilder: (c, i) {
                                    return BounceInDown(
                                      child: Card(
                                        color: const Color(0xff202032),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(32)),
                                        child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(40),
                                                image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: NetworkImage(
                                                        movies[i].fullImageUrl))),
                                            child: Center(
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                    top: he * 0.133),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(32),
                                                  child: ClipPath(
                                                    clipper: RPSCustomPainter(),
                                                    child: BackdropFilter(
                                                      filter: ImageFilter.blur(
                                                          sigmaX: 10, sigmaY: 10),
                                                      child: Container(
                                                        width: we * 0.8,
                                                        // alignment: Alignment.center,
                                                        height: 170,
                                                        decoration: BoxDecoration(
                                                            color: Colors.black
                                                                .withOpacity(0.3),
                                                            borderRadius:
                                                                const BorderRadius
                                                                        .all(
                                                                    Radius
                                                                        .circular(
                                                                            20))),
                                                        child: Stack(
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      left: 20,
                                                                      top: 50),
                                                              child: Row(
                                                                children: [
                                                                  Expanded(
                                                                    child: Text(
                                                                        movies[i]
                                                                            .title,
                                                                        style: GoogleFonts.lato(
                                                                            fontSize: movies[i].title.length >= 21
                                                                                ? 13
                                                                                : 18,
                                                                            fontWeight: FontWeight
                                                                                .bold,
                                                                            color:
                                                                                Colors.white)),
                                                                  ),
                                                                  Expanded(
                                                                    child:
                                                                        SizedBox(
                                                                      width: we *
                                                                          0.25,
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    movies[i]
                                                                        .vote_average
                                                                        .toString(),
                                                                    style: const TextStyle(
                                                                        color: Colors
                                                                            .yellow),
                                                                  ),
                                                                  const Icon(
                                                                    Icons
                                                                        .star_outline,
                                                                    color: Colors
                                                                        .yellow,
                                                                  ),
                                                                  SizedBox(
                                                                      width: we *
                                                                          0.09)
                                                                ],
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: he * 0.02,
                                                            ),
                                                            Container(
                                                              width: 55,
                                                              height: 55,
                                                              margin:
                                                                  EdgeInsets.only(
                                                                      top: he *
                                                                          0.12,
                                                                      left: we *
                                                                          .6),
                                                              decoration: const BoxDecoration(
                                                                  color: Color(
                                                                      0xFF733FF1),
                                                                  shape: BoxShape
                                                                      .circle),
                                                              child: const Icon(
                                                                Icons.play_arrow,
                                                                color:
                                                                    Colors.white,
                                                                size: 30,
                                                              ),
                                                            ),
                                                            const Padding(
                                                              padding:
                                                                  EdgeInsets.only(
                                                                      top: 120,
                                                                      left: 20),
                                                              child: CircleAvatar(
                                                                radius: 16,
                                                                backgroundImage:
                                                                    NetworkImage(
                                                                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSNOzRGW1KgfkefLAR8TIk5KkXO5wmFOesHQhA49mrGodPT8JwK"),
                                                              ),
                                                            ),
                                                            const Padding(
                                                              padding:
                                                                  EdgeInsets.only(
                                                                      top: 120,
                                                                      left: 40),
                                                              child: CircleAvatar(
                                                                backgroundImage:
                                                                    NetworkImage(
                                                                  "https://m.media-amazon.com/images/M/MV5BYWViYWU1MjQtZmYwMy00ZjUyLTkyYzgtMmZhMmUwNDU0ZTI4XkEyXkFqcGdeQXVyNDAzNDk0MTQ@._V1_.jpg",
                                                                ),
                                                                radius: 16,
                                                              ),
                                                            ),
                                                            const Padding(
                                                              padding:
                                                                  EdgeInsets.only(
                                                                      top: 120,
                                                                      left: 60),
                                                              child: CircleAvatar(
                                                                backgroundImage:
                                                                    NetworkImage(
                                                                        "https://upload.wikimedia.org/wikipedia/commons/thumb/4/4b/Benedict_Cumberbatch_SDCC_2014.jpg/1200px-Benedict_Cumberbatch_SDCC_2014.jpg"),
                                                                radius: 16,
                                                              ),
                                                            ),
                                                            const Padding(
                                                              padding:
                                                                  EdgeInsets.only(
                                                                      top: 120,
                                                                      left: 80),
                                                              child: CircleAvatar(
                                                                radius: 16,
                                                                backgroundImage:
                                                                    NetworkImage(
                                                                        "https://upload.wikimedia.org/wikipedia/commons/4/46/Johnny_Depp_%28July_2009%29_2_cropped.jpg?20210809165401"),
                                                              ),
                                                            ),
                                                            const Padding(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                        top: 130,
                                                                        left:
                                                                            120),
                                                                child: Text(
                                                                  "20 + cast",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .grey),
                                                                )),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            )),
                                      ),
                                    );
                                  }),
                            ],
                          ),
                        ),
                        Expanded(
                          child: SizedBox(
                            height: he * .1,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: we * 0.4),
                          child: Text("Continue Watching",
                              style: GoogleFonts.lato(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ),
                        SizedBox(
                          height: he * 0.02,
                        ),
                        SizedBox(
                          width: we * 1,
                          height: he * 0.12,
                          child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (c, i) {
                              return FadeInRight(
                                delay: const Duration(milliseconds: 700),
                                child: Container(
                                  margin: const EdgeInsets.only(left: 30),
                                  width: we * 0.63,
                                  height: he * 0.3,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: const Color(0xff202032)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 80,
                                        height: 80,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: Image.network(
                                            movies[i + 9].fullImageUrl),
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(movies[i + 9].title,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: movies[i + 6]
                                                              .title
                                                              .length >=
                                                          19
                                                      ? 10
                                                      : 13)),
                                          const SizedBox(
                                            height: 12,
                                          ),
                                          Text(movies[i].original_language,
                                              style: const TextStyle(
                                                  color: Colors.grey)),
                                        ],
                                      ),
                                      Expanded(
                                        child: SizedBox(
                                          width: we * 0.06,
                                        ),
                                      ),
                                      Container(
                                        width: 50,
                                        height: 50,
                                        decoration: const BoxDecoration(
                                            color: Color(0xFF733FF1),
                                            shape: BoxShape.circle),
                                        child: const Icon(
                                          Icons.play_arrow,
                                          color: Colors.white,
                                          size: 30,
                                        ),
                                      ),
                                      SizedBox(
                                        width: we * 0.02,
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                            scrollDirection: Axis.horizontal,
                            itemCount: 5,
                          ),
                        ),
                        SizedBox(
                          height: he * 0.02,
                        ),
                        const BottomNa(),
                        SizedBox(height: MediaQuery.of(context).size.height >= 845 ? he * 0.12: he * 0.15 )
                      ],
                    ),
                  ),
                ),
              );
            },
            error: (e, s) {
              if (e is MoviesException) {
                return _ErrorBody(message: "${e.message}",);
              }
              return const _ErrorBody(message: "Oops, something unexpected happened");
            },
            loading: () => const Center(
                  child: SizedBox(
                    width: 80,
                    height: 80,
                    child: LoadingIndicator(
                      indicatorType: Indicator.ballSpinFadeLoader,
                      colors: [Color(0xFF733FF1)],
                    ),
                  ),
                )));
  }
}

class RPSCustomPainter extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    Path path0 = Path();
    path0.moveTo(size.width * 0.0225300, size.height * 0.9927200);
    path0.lineTo(size.width * 0.9885300, size.height * 0.9927200);
    path0.quadraticBezierTo(size.width * 1.0039400, size.height * 0.3432200,
        size.width * 0.9680500, size.height * 0.3304600);
    path0.cubicTo(
        size.width * 0.9395700,
        size.height * 0.2547200,
        size.width * 0.0802200,
        size.height * -0.0065400,
        size.width * 0.0452700,
        size.height * 0.2127000);
    path0.quadraticBezierTo(size.width * 0.0080900, size.height * 0.3246600,
        size.width * 0.0225300, size.height * 0.9927200);
    path0.close();

    return path0;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}

class _ErrorBody extends ConsumerWidget {
  const _ErrorBody({
    Key? key,
    required this.message,
  }) : super(key: key);

  final String message;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(message),
          ElevatedButton(
            onPressed: () => ref.refresh(moviesFutureProvider),
            child: const Text("Try again",style: TextStyle(color: Colors.white),),
          ),
        ],
      ),
    );
  }
}
