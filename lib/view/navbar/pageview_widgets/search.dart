import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../providers/provider.dart';

class SearchPage extends ConsumerWidget {
  const SearchPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var imagebaseurl = "https://image.tmdb.org/t/p";
    var data = ref.watch(homeFutureProvider);

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 15),
                child: TextField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.grey,
                          size: 30,
                        ),
                        hintText: "Movies, Tv shows and others",
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 2)))),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      "Reccomended Movie",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 25),
                    ),
                    Spacer(),
                    CircleAvatar(
                      backgroundColor: Colors.white24,
                      child: Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 30,
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
                      height: 250,
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Catogories",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Expanded(
                child: Wrap(
                  direction: Axis.horizontal,
                  runAlignment: WrapAlignment.start,
                  runSpacing: 10,
                  spacing: 10,
                  children: [
                    for (int i = 0; i < 10; i++)
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          color: Color(0xFF242424),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          'data',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ),
                  ],
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
            ],
          ),
        ),
      ),
    );
  }
}
