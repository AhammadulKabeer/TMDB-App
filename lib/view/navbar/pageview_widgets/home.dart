import 'package:apitmtpproject/constants/size.dart';
import 'package:apitmtpproject/providers/provider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../detailed_page/detailed_page.dart';

class HomePageview extends ConsumerWidget {
  const HomePageview({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var data = ref.watch(homeFutureProvider);
    double maxWidth = MediaQuery.of(context).size.width;
    double maxHeight = MediaQuery.of(context).size.height;
    var imagebaseurl = "https://image.tmdb.org/t/p";
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.transparent,
            expandedHeight: maxHeight / 2,
            flexibleSpace: data.when(
              data: (data) {
                if (data[0] != null) {
                  return Stack(
                    children: [
                      CarouselSlider.builder(
                        options: CarouselOptions(
                            height: maxHeight / 1.8,
                            autoPlayAnimationDuration:
                                const Duration(seconds: 2),
                            autoPlay: true,
                            autoPlayCurve: Curves.fastOutSlowIn,
                            viewportFraction: 1),
                        itemCount: data[0]!.results.length,
                        itemBuilder: (context, index, int) => FlexibleSpaceBar(
                          background: GestureDetector(
                            onDoubleTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => DetailedPage(
                                  result: data[0]!.results[index],
                                ),
                              ));
                            },
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                ShaderMask(
                                  shaderCallback: (bounds) =>
                                      const LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          stops: [
                                        0.6,
                                        1
                                      ],
                                          colors: [
                                        Colors.transparent,
                                        Colors.black
                                      ]).createShader(bounds),
                                  blendMode: BlendMode.srcATop,
                                  child: Image.network(
                                    "$imagebaseurl/w780${data[0]!.results[index].backdropPath}",
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Positioned(
                                    top:
                                        maxHeight * (260 / Sizex.currentHeight),
                                    left: 0,
                                    right: 0,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: maxWidth *
                                              (350 / Sizex.currentWidth),
                                          child: Text(
                                            textAlign: TextAlign.center,
                                            data[0]!.results[index].title!,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: maxWidth *
                                                    (30 / Sizex.currentWidth),
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                        SizedBox(
                                          height: maxHeight *
                                              (5 / Sizex.currentHeight),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text(
                                            maxLines: 3,
                                            textAlign: TextAlign.center,
                                            data[0]!.results[index].overview!,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: maxWidth *
                                                    (20 / Sizex.currentWidth),
                                                fontWeight: FontWeight.w300),
                                          ),
                                        ),
                                      ],
                                    ))
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                } else {
                  return Text(
                    'Oops...,Somthing went wrong!!!',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: maxWidth * (20 / Sizex.currentWidth),
                    ),
                  );
                }
              },
              error: (error, stackTrace) => Center(
                child: Text(error.toString()),
              ),
              loading: () {
                return const Center(child: CircularProgressIndicator());
              },
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  title: Text(
                    "you might also like",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: maxWidth * (25 / Sizex.currentWidth),
                        fontWeight: FontWeight.w500),
                  ),
                  subtitle: Text(
                    "updated after each viewing and rating",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: maxWidth * (16 / Sizex.currentWidth)),
                  ),
                  trailing: CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 66, 62, 62),
                    child: Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: maxWidth * (25 / Sizex.currentWidth),
                      color: Color.fromARGB(255, 205, 199, 199),
                    ),
                  ),
                ),
                SizedBox(
                  height: maxHeight * (10 / Sizex.currentHeight),
                ),
                data.when(
                  data: (data) {
                    if (data[1] != null) {
                      return SizedBox(
                        height: maxHeight * (200 / Sizex.currentHeight),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          physics: const ClampingScrollPhysics(),
                          itemCount: data[1]!.results.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => DetailedPage(
                                    result: data[1]!.results[index],
                                  ),
                                ));
                              },
                              child: Container(
                                width: maxWidth * (150 / Sizex.currentWidth),
                                height: maxHeight * (200 / Sizex.currentHeight),
                                margin: EdgeInsets.all(
                                    maxWidth * (5 / Sizex.currentWidth)),
                                padding: EdgeInsets.all(
                                    maxWidth * (3 / Sizex.currentWidth)),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      maxWidth * (20 / Sizex.currentWidth)),
                                  color: Colors.white,
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                      maxWidth * (15 / Sizex.currentWidth)),
                                  child: Image.network(
                                    '$imagebaseurl/w780${data[1]!.results[index].posterPath!}',
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    } else {
                      return const Center(
                        child: Text(
                          'Api fetching nadannilla',
                          style: TextStyle(color: Colors.amber),
                        ),
                      );
                    }
                  },
                  error: (error, stackTrace) => Text(error.toString()),
                  loading: () {
                    return const Center(child: CircularProgressIndicator());
                  },
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: maxHeight * (8 / Sizex.currentHeight),
                      left: maxWidth * (20 / Sizex.currentWidth),
                      bottom: maxHeight * (8 / Sizex.currentHeight)),
                  child: Text(
                    "Most popular movie",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: maxWidth * (25 / Sizex.currentWidth),
                        fontWeight: FontWeight.w500),
                  ),
                ),
                data.when(
                  data: (data) {
                    if (data[2] != null) {
                      return SizedBox(
                        height: maxHeight * (250 / Sizex.currentHeight),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          physics: const ClampingScrollPhysics(),
                          itemCount: data[2]!.results.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => DetailedPage(
                                    result: data[2]!.results[index],
                                  ),
                                ));
                              },
                              child: Column(
                                children: [
                                  Container(
                                    width:
                                        maxWidth * (150 / Sizex.currentWidth),
                                    height:
                                        maxHeight * (200 / Sizex.currentHeight),
                                    margin: EdgeInsets.all(
                                        maxWidth * (5 / Sizex.currentWidth)),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          maxWidth * (20 / Sizex.currentWidth)),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(
                                          maxWidth * (15 / Sizex.currentWidth)),
                                      child: Image.network(
                                        '$imagebaseurl/w780${data[2]!.results[index].posterPath!}',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width:
                                        maxWidth * (150 / Sizex.currentWidth),
                                    child: Text(
                                      '${data[2]!.results[index].name}',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: maxWidth *
                                            (16 / Sizex.currentWidth),
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      );
                    } else {
                      return const Center(
                        child: Text(
                          'Api fetching nadannilla',
                          style: TextStyle(color: Colors.amber),
                        ),
                      );
                    }
                  },
                  error: (error, stackTrace) => Text(error.toString()),
                  loading: () {
                    return const Center(child: CircularProgressIndicator());
                  },
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: maxHeight * (8 / Sizex.currentHeight),
                      bottom: maxHeight * (8 / Sizex.currentHeight),
                      left: maxWidth * (20 / Sizex.currentWidth)),
                  child: Text(
                    "Cast",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: maxWidth * (25 / Sizex.currentWidth),
                        fontWeight: FontWeight.w500),
                  ),
                ),
                data.when(
                  data: (data) {
                    if (data[3] != null) {
                      return SizedBox(
                        height: maxHeight * (250 / Sizex.currentHeight),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          physics: const ClampingScrollPhysics(),
                          itemCount: data[2]?.results.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Container(
                                  width: maxWidth * (150 / Sizex.currentWidth),
                                  height:
                                      maxHeight * (200 / Sizex.currentHeight),
                                  margin: EdgeInsets.all(
                                      maxWidth * (5 / Sizex.currentWidth)),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        maxWidth * (20 / Sizex.currentWidth)),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                        maxWidth * (15 / Sizex.currentWidth)),
                                    child: Image.network(
                                      '$imagebaseurl/w780${data[3]!.results[index].profilePath}',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: maxWidth * (150 / Sizex.currentWidth),
                                  child: Text(
                                    '${data[3]!.results[index].name}',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize:
                                          maxWidth * (16 / Sizex.currentWidth),
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                )
                              ],
                            );
                          },
                        ),
                      );
                    } else {
                      return const Center(
                        child: Text(
                          'Api fetching nadannilla',
                          style: TextStyle(color: Colors.amber),
                        ),
                      );
                    }
                  },
                  error: (error, stackTrace) => Text(error.toString()),
                  loading: () {
                    return const Center(child: CircularProgressIndicator());
                  },
                ),
                SizedBox(
                  height: maxHeight * (100 / Sizex.currentHeight),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
