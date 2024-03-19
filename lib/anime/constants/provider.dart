import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pratice_app/anime/model/anime_model.dart';
import 'package:pratice_app/anime/services/servies.dart';

final spotlightanimeProvider = FutureProvider<Homepage>((ref) async {
  return await Api().getdata();
});