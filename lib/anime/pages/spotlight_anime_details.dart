import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pratice_app/anime/constants/provider.dart';

class SpotLightAnimes extends ConsumerStatefulWidget {
  const SpotLightAnimes({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SpotLightAnimesState();
}

class _SpotLightAnimesState extends ConsumerState<SpotLightAnimes> {
  @override
  Widget build(BuildContext context) {
    var spotlightAnimes = ref.watch(spotlightanimeProvider);

    return Scaffold(
        body: spotlightAnimes.when(
      data: (data) {
        return SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: 350,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          data.spotlightAnimes.first.poster,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: 300,
                          child: Text(
                            data.spotlightAnimes.first.name,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.bookmark_add_outlined),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.share_outlined),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.play_circle,
                            color: Colors.white,
                          ),
                          label: const Text(
                            'Play',
                            style: TextStyle(color: Colors.white),
                          ),
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(100,40 ),
                              backgroundColor: Colors.green),
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
                              side: const BorderSide(
                                  color: Colors.white, width: 2),
                              backgroundColor: Colors.transparent),
                        ),
                      ],
                    ),
                    
                  ],
                ),
              ),
            ],
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
    ));
  }
}
