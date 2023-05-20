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

    var imagebaseurl = "https://image.tmdb.org/t/p";
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.transparent,
            expandedHeight: MediaQuery.of(context).size.height / 2,
            flexibleSpace: data.when(
              data: (data) {
                if (data[0] != null) {
                  return Stack(
                    children: [
                      CarouselSlider.builder(
                        options: CarouselOptions(
                            height: MediaQuery.of(context).size.height / 1.8,
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
                                    top: 260,
                                    left: 0,
                                    right: 0,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 350,
                                          child: Text(
                                            textAlign: TextAlign.center,
                                            data[0]!.results[index].title!,
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 30,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            maxLines: 3,
                                            textAlign: TextAlign.center,
                                            data[0]!.results[index].overview!,
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
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
                  return const Text(
                    'Oops...,Somthing went wrong!!!',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
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
                const ListTile(
                  title: Text(
                    "you might also like",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w500),
                  ),
                  subtitle: Text(
                    "updated after each viewing and rating",
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                  trailing: CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 66, 62, 62),
                    child: Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 25,
                      color: Color.fromARGB(255, 205, 199, 199),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                data.when(
                  data: (data) {
                    if (data[1] != null) {
                      return SizedBox(
                        height: 200,
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
                                margin: const EdgeInsets.all(5),
                                padding: const EdgeInsets.all(3),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.network(
                                      '$imagebaseurl/w780${data[1]!.results[index].posterPath!}'),
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
                const Padding(
                  padding: EdgeInsets.only(top: 8.0, left: 20, bottom: 8),
                  child: Text(
                    "Most popular movie",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                data.when(
                  data: (data) {
                    if (data[2] != null) {
                      return SizedBox(
                        height: 250,
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
                                    width: 150,
                                    height: 200,
                                    margin: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Image.network(
                                        '$imagebaseurl/w780${data[2]!.results[index].posterPath!}',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 150,
                                    child: Text(
                                      '${data[2]!.results[index].name}',
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontSize: 16,
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
                const Padding(
                  padding: EdgeInsets.only(top: 8.0, bottom: 8, left: 20),
                  child: Text(
                    "Cast",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                data.when(
                  data: (data) {
                    if (data[3] != null) {
                      return SizedBox(
                        height: 250,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          physics: const ClampingScrollPhysics(),
                          itemCount: data[2]?.results.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Container(
                                  width: 150,
                                  height: 200,
                                  margin: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.network(
                                      '$imagebaseurl/w780${data[3]!.results[index].profilePath}',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 150,
                                  child: Text(
                                    '${data[3]!.results[index].name}',
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 16,
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
                const SizedBox(
                  height: 100,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
