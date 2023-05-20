import 'package:apitmtpproject/models/apiModel.dart';

import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../providers/provider.dart';

class DetailedPage extends ConsumerWidget {
  final Result result;
  const DetailedPage({super.key, required this.result});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var imagebaseurl = "https://image.tmdb.org/t/p/w780";
    var data = ref.watch(homeFutureProvider);
    final cast = ref.watch(castprovider(result.id!));

    return Scaffold(
        extendBody: true,
        backgroundColor: Colors.black,
        body: CustomScrollView(slivers: [
          SliverAppBar(
            elevation: 0,
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 10.0, top: 8),
                child: FloatingActionButton(
                  heroTag: "2",
                  elevation: 0,
                  backgroundColor: Colors.white24,
                  onPressed: () {},
                  child: const Icon(
                    Icons.more_horiz,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
            ],
            leading: Padding(
              padding: const EdgeInsets.only(left: 10.0, top: 8),
              child: FloatingActionButton(
                heroTag: "1",
                elevation: 0,
                backgroundColor: Colors.white24,
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
            backgroundColor: Colors.transparent,
            expandedHeight: MediaQuery.of(context).size.height / 2,
            flexibleSpace: data.when(
              data: (data) {
                if (data != null) {
                  return Stack(children: [
                    Stack(
                      fit: StackFit.expand,
                      children: [
                        ShaderMask(
                          shaderCallback: (bounds) => const LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  stops: [0.6, 1],
                                  colors: [Colors.transparent, Colors.black])
                              .createShader(bounds),
                          blendMode: BlendMode.srcATop,
                          child: Image.network(
                            imagebaseurl + result.backdropPath!,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ]);
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
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 14),
                  child: Text(
                    "Preview",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: SizedBox(
                          height: 100,
                          width: 100,
                          child: Image.network(
                            imagebaseurl + result.posterPath!,
                            fit: BoxFit.cover,
                          )),
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 30,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 14.0),
                      child: Icon(
                        Icons.cloud_download,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
                  child: Row(
                    children: [
                      const Text(
                        "95% match",
                        style: TextStyle(
                            color: Colors.green,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        result.releaseDate == null
                            ? 'Release date not published'
                            : DateFormat('dd MMM yyyy')
                                .format(result.releaseDate!),
                        style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 14),
                  child: Text(
                    "Prolog",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    result.overview!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 14),
                  child: Text(
                    "Top Cast",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                cast.when(
                  data: (data) {
                    if (data != null) {
                      return SizedBox(
                        height: 150,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: data.cast!.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  data.cast![index].profilePath == null
                                      ? CircleAvatar(
                                          radius: 30,
                                          backgroundColor: Colors.grey[500],
                                          child: const Icon(
                                            Icons.person,
                                            color: Colors.white,
                                            size: 46,
                                          ),
                                        )
                                      : CircleAvatar(
                                          radius: 30,
                                          backgroundImage: NetworkImage(
                                              imagebaseurl +
                                                  data.cast![index]
                                                      .profilePath!),
                                        ),
                                  SizedBox(
                                    width: 120,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        data.cast![index].name!,
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w400),
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
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                  error: (error, stackTrace) {
                    return Text(error.toString());
                  },
                  loading: () {
                    return const Center(child: CircularProgressIndicator());
                  },
                ),
                const SizedBox(
                  height: 500,
                )
              ],
            ),
          )
        ]));
  }
}
