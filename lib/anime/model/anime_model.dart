
class Homepage {
  List<SpotlightAnimes> spotlightAnimes;
  List<LatestEpisodeAnimes> latestEpisodeAnimes;
  List<TrendingAnimes> trendingAnimes;

  Homepage({
    required this.spotlightAnimes,
    required this.latestEpisodeAnimes,
    required this.trendingAnimes,
  });

  factory Homepage.fromJson(Map<String, dynamic> json) {
    return Homepage(
      spotlightAnimes: List<SpotlightAnimes>.from(
          json['spotlightAnimes'].map((x) => SpotlightAnimes.fromJson(x))),
      latestEpisodeAnimes: List<LatestEpisodeAnimes>.from(
          json['latestEpisodeAnimes']
              .map((x) => LatestEpisodeAnimes.fromJson(x))),
      trendingAnimes: List<TrendingAnimes>.from(
          json['trendingAnimes'].map((x) => TrendingAnimes.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'spotlightAnimes':
          List<dynamic>.from(spotlightAnimes.map((x) => x.toJson())),
      'latestEpisodeAnimes':
          List<dynamic>.from(latestEpisodeAnimes.map((x) => x.toJson())),
      'trendingAnimes':
          List<dynamic>.from(trendingAnimes.map((x) => x.toJson())),
    };
  }
}

class SpotlightAnimes {
  final int rank ;
  final String id ;
  final String name;
  final String description;
  final String poster;
  final String japaneseName;
  final Map<String, int?> episodes;
  final List<String> otherInfo;

  SpotlightAnimes({
    required this.rank,
    required this.id,
    required this.name,
    required this.description,
    required this.poster,
    required this.japaneseName,
    required this.episodes,
    required this.otherInfo,
  });

  factory SpotlightAnimes.fromJson(Map<String, dynamic> json) {
    return SpotlightAnimes(
      rank: json['rank'] as int,
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      poster: json['poster'] as String,
      japaneseName: json['jname'] as String,
      episodes: {
        'sub': json['episodes']['sub'] as int?,
        'dub': json['episodes']['dub'] as int?,
      },
      otherInfo: (json['otherInfo'] as List).map((e) => e as String).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'rank': rank,
      'id': id,
      'name': name,
      'description': description,
      'poster': poster,
      'jname': japaneseName,
      'episodes': episodes,
      'otherInfo': otherInfo,
    };
  }
}


class LatestEpisodeAnimes {
  final String id;
  final String name;
  final String poster;
  final String duration;
  final String type;
  final String rating;
  final Map<String, int?> episodes;

  LatestEpisodeAnimes({
    required this.id,
    required this.name,
    required this.poster,
    required this.duration,
    required this.type,
    required this.rating,
    required this.episodes,
  });

  factory LatestEpisodeAnimes.fromJson(Map<String, dynamic> json) {
    return LatestEpisodeAnimes(
      id: json['id'] as String,
      name: json['name'] as String,
      poster: json['poster'] as String,
      duration: json['duration'] as String,
      type: json['type'] as String,
      rating: json['rating'] ?? "",
      episodes: {
        'sub': json['episodes']['sub'] as int?,
        'dub': json['episodes']['dub'] as int?,
      },
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'poster': poster,
      'duration': duration,
      'type': type,
      'rating': rating,
      'episodes': episodes,
    };
  }
}


class TrendingAnimes {
  final int rank;
  final String name;
  final String id;
  final String poster;

  TrendingAnimes({
    required this.rank,
    required this.name,
    required this.id,
    required this.poster,
  });

  factory TrendingAnimes.fromJson(Map<String, dynamic> json) {
    return TrendingAnimes(
      rank: json['rank'] as int,
      name: json['name'] as String,
      id: json['id'] as String,
      poster: json['poster'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'rank': rank,
      'name': name,
      'id': id,
      'poster': poster,
    };
  }
}

