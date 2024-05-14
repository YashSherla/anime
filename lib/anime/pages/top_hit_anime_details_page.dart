import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pratice_app/anime/constants/provider.dart';

class HitAnimeDetails extends ConsumerStatefulWidget {
  const HitAnimeDetails({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _HitAnimeDetailsState();
}

class _HitAnimeDetailsState extends ConsumerState<HitAnimeDetails> {
  @override
  Widget build(BuildContext context) {
    var spotlightAnimes = ref.watch(spotlightanimeProvider);

    return Scaffold(
      body: spotlightAnimes.when(
        data: (data) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_back),
                      ),
                     const Text(
                        'Top Hits Anime',
                        style:  TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: data.trendingAnimes.length,
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            Stack(
                              children: [
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 10),
                                  height: 250,
                                  width: 180,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                        data.trendingAnimes[index].poster,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  child: Padding(
                                    padding: const EdgeInsets.all(30.0),
                                    child: Text(
                                      data.trendingAnimes[index].rank
                                          .toString(),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 40,
                                          color: Colors.white),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 200,
                                  child: Text(
                                    data.trendingAnimes[index].name,
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                const SizedBox(
                                  width: 200,
                                  child: Text(
                                    'Anime is a diverse medium with distinctive production methods that have adapted in response to emergent technologies.',
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                ElevatedButton.icon(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                  label: const Text(
                                    'My List',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.green),
                                ),
                              ],
                            )
                          ],
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          );
        },
        error: (error, stackTrace) {
          return Center(
            child: Text(error.toString()),
          );
        },
        loading: () {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
