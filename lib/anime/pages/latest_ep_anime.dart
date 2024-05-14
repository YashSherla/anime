import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pratice_app/anime/constants/provider.dart';

class LatestEpisodeAnimes extends ConsumerStatefulWidget {
  const LatestEpisodeAnimes({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _LatestEpisodeAnimesState();
}

class _LatestEpisodeAnimesState extends ConsumerState<LatestEpisodeAnimes> {
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
                        'Latest Ep Anime',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 8.0,
                      ),
                      shrinkWrap: true,
                      itemCount: data.latestEpisodeAnimes.length,
                      itemBuilder: (context, index) {
                        return Stack(
                          children: [
                            Container(
                              margin: const EdgeInsets.symmetric(horizontal: 8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                    data.latestEpisodeAnimes[index].poster,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: SizedBox(
                                  width: 150,
                                  
                                  child: Text(
                                    
                                    data.latestEpisodeAnimes[index].name
                                        .toString(),
                                        overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Colors.blue),
                                  ),
                                ),
                              ),
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
