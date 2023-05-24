import 'package:apitmtpproject/controllers/addprofile.dart';
import 'package:apitmtpproject/models/apiModel.dart';
import 'package:apitmtpproject/models/searchmoviemodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constants/size.dart';
import '../../../providers/provider.dart';
import '../nav_bar.dart';

class SearchPage extends ConsumerWidget {
  const SearchPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var imagebaseurl = "https://image.tmdb.org/t/p";
    var data = ref.watch(homeFutureProvider);
    double maxWidth = MediaQuery.of(context).size.width;
    double maxHeight = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: EdgeInsets.all(
              maxWidth * (8 / Sizex.currentWidth),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 28, bottom: 15),
                  child: TextField(
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: maxWidth * (20 / Sizex.currentWidth),
                          fontWeight: FontWeight.w500),
                      controller: ref.watch(textProvider),
                      decoration: InputDecoration(
                          prefixIcon: IconButton(
                            onPressed: () {
                              ref.read(textProvider.notifier).state.text = "";
                              // Navigator.of(context).push(MaterialPageRoute(
                              //   builder: (context) => HomePage(),
                              // ));
                              // ref.read(bottomprovider.notifier).state = 1;
                              ref.watch(pageProvider).animateToPage(1,
                                  duration: Duration(milliseconds: 50),
                                  curve: Curves.bounceIn);
                            },
                            icon: Icon(
                              Icons.arrow_circle_left,
                              color: Colors.white,
                              size: maxWidth * (30 / Sizex.currentWidth),
                            ),
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              if (ref.watch(textProvider).text != '') {
                                ref.watch(searchprovider(
                                    ref.watch(textProvider).text));
                              }
                            },
                            icon: const Icon(
                              Icons.search_rounded,
                              color: Colors.white,
                            ),
                          ),
                          hintText: "Movies, Tv shows and others",
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: maxWidth * (20 / Sizex.currentWidth),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  maxWidth * (20 / Sizex.currentWidth)),
                              borderSide: BorderSide(
                                  color: Colors.grey,
                                  width: maxWidth * (2 / Sizex.currentWidth))),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  maxWidth * (20 / Sizex.currentWidth)),
                              borderSide: BorderSide(
                                  color: Colors.grey,
                                  width:
                                      maxWidth * (2 / Sizex.currentWidth))))),
                ),
                ref.watch(textProvider).text == ''
                    ? buildInitialSetup(data, imagebaseurl, context)
                    : ref
                        .watch(searchprovider(ref.watch(textProvider).text))
                        .when(
                          data: (data) => data != null
                              ? ListView.builder(
                                  // controller: listscroll,
                                  shrinkWrap: true,
                                  physics: const ClampingScrollPhysics(),
                                  itemCount: data.results!.length,
                                  itemBuilder: (context, index) {
                                    return Stack(
                                      children: [
                                        ListTile(
                                          title: Row(
                                            children: [
                                              data.results![index].posterPath !=
                                                      null
                                                  ? SizedBox(
                                                      width: maxWidth *
                                                          (100 /
                                                              Sizex
                                                                  .currentWidth),
                                                      child: Image.network(
                                                        '$imagebaseurl/w780${data.results![index].posterPath!}',
                                                        fit: BoxFit.cover,
                                                      ),
                                                    )
                                                  : Container(
                                                      color: Colors.grey,
                                                      width: maxWidth *
                                                          (100 /
                                                              Sizex
                                                                  .currentWidth),
                                                      child: const Icon(
                                                          Icons.person),
                                                    ),
                                              SizedBox(
                                                  width: maxWidth *
                                                      (15 /
                                                          Sizex.currentWidth)),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  data.results![index].title !=
                                                          null
                                                      ? SizedBox(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width -
                                                              165,
                                                          child: Padding(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    vertical:
                                                                        maxWidth *
                                                                            (8 /
                                                                                Sizex.currentWidth)),
                                                            child: Text(
                                                              data
                                                                  .results![
                                                                      index]
                                                                  .title!,
                                                              style: TextStyle(
                                                                  fontSize: maxWidth *
                                                                      (20 /
                                                                          Sizex
                                                                              .currentWidth),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                          ),
                                                        )
                                                      : SizedBox(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width -
                                                              165,
                                                          child: Padding(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    vertical:
                                                                        maxWidth *
                                                                            (8 /
                                                                                Sizex.currentWidth)),
                                                            child: Text(
                                                              "No title",
                                                              style: TextStyle(
                                                                  fontSize: maxWidth *
                                                                      (20 /
                                                                          Sizex
                                                                              .currentWidth),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                          ),
                                                        ),
                                                  if (data.results![index]
                                                          .overview !=
                                                      null)
                                                    SizedBox(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width -
                                                              165,
                                                      child: Text(
                                                        data.results![index]
                                                            .overview!,
                                                        maxLines: 4,
                                                        style: const TextStyle(
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                )
                              : const Center(
                                  child: CircularProgressIndicator(
                                  color: Colors.amber,
                                )),
                          error: (error, stackTrace) => Center(
                            child: Text(
                              'Oops, Somthing Went Wrong : $error',
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                          loading: () =>
                              buildInitialSetup(data, imagebaseurl, context),
                        ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column buildInitialSetup(AsyncValue<List<ApiModel?>> data,
      String imagebaseurl, BuildContext context) {
    double maxWidth = MediaQuery.of(context).size.width;
    double maxHeight = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(maxWidth * (8 / Sizex.currentWidth)),
          child: Row(
            children: [
              Text(
                "Reccomended Movie",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: maxWidth * (25 / Sizex.currentWidth)),
              ),
              Spacer(),
              CircleAvatar(
                backgroundColor: Colors.white24,
                child: Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: maxHeight * (250 / Sizex.currentHeight),
                  color: Colors.grey,
                ),
              )
            ],
          ),
        ),
        data.when(
          data: (data) {
            if (data[2] != null) {
              return SizedBox(
                height: maxHeight * (260 / Sizex.currentHeight),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemCount: data[2]!.results.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {},
                      child: Column(
                        children: [
                          data[2]!.results[index].posterPath!.isNotEmpty
                              ? Container(
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
                                      '$imagebaseurl/w780${data[2]!.results[index].posterPath!}',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                )
                              : Container(
                                  width: maxWidth * (150 / Sizex.currentWidth),
                                  height:
                                      maxHeight * (200 / Sizex.currentHeight),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          maxWidth * (15 / Sizex.currentWidth)),
                                      color: Color(0xFF9E9E9E)),
                                  child: Icon(
                                    Icons.person,
                                    size: maxWidth * (50 / Sizex.currentWidth),
                                    color: Colors.white24,
                                  ),
                                ),
                          data[2]!.results[index].name!.isNotEmpty
                              ? SizedBox(
                                  width: maxWidth * (160 / Sizex.currentWidth),
                                  height: 30,
                                  child: Text(
                                    '${data[2]!.results[index].name}',
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      // fontSize:
                                      //     maxWidth * (16 / Sizex.currentWidth),
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                )
                              : const Text(
                                  "data",
                                  style: TextStyle(color: Colors.white),
                                ),
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
          padding: EdgeInsets.all(maxWidth * (8 / Sizex.currentWidth)),
          child: Text(
            "Catogories",
            style: TextStyle(
                color: Colors.white,
                fontSize: maxWidth * (25 / Sizex.currentWidth),
                fontWeight: FontWeight.w500),
          ),
        ),
        Wrap(
          direction: Axis.horizontal,
          runAlignment: WrapAlignment.start,
          runSpacing: maxWidth * (10 / Sizex.currentWidth),
          spacing: maxWidth * (10 / Sizex.currentWidth),
          children: [
            for (int i = 0; i < profile().Catogories.length; i++)
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: maxWidth * (10 / Sizex.currentWidth),
                    vertical: 5),
                decoration: BoxDecoration(
                  color: const Color(0xFF242424),
                  borderRadius: BorderRadius.circular(
                      maxWidth * (10 / Sizex.currentWidth)),
                ),
                child: Text(
                  profile().Catogories[i],
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: maxWidth * (16 / Sizex.currentWidth),
                  ),
                ),
              ),
          ],
        ),
        Padding(
          padding: EdgeInsets.all(maxWidth * (8 / Sizex.currentWidth)),
          child: Text(
            "Celebs",
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
                  physics: ClampingScrollPhysics(),
                  itemCount: data[3]?.results.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        data[3]!.results[index].profilePath != null
                            ? Container(
                                width: maxWidth * (150 / Sizex.currentWidth),
                                height: maxHeight * (200 / Sizex.currentHeight),
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
                              )
                            : Container(
                                width: maxWidth * (150 / Sizex.currentWidth),
                                height: maxHeight * (200 / Sizex.currentHeight),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.grey),
                                child: Icon(
                                  Icons.person,
                                  size: maxWidth * (50 / Sizex.currentWidth),
                                  color: Colors.white24,
                                ),
                              ),
                        data[3]!.results[index].name!.isNotEmpty
                            ? SizedBox(
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
                            : const Text(
                                "Name is not published",
                                style: TextStyle(color: Colors.white),
                              ),
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
      ],
    );
  }
}
