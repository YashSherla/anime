import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

//simple provider++++++++++++++
// final getProvider = Provider<dynamic>((ref) {
//   return 1;
// });
//state provider++++++++++++++
final stateProvider = StateProvider<int>((ref) => 0);
final streamProvider = StreamProvider<int>((ref) => fechdata());

class PraticePage extends ConsumerWidget {
  const PraticePage({super.key});

  getdata() async {
    String api = 'https://api-aniwatch.onrender.com/anime/home';
    try {
      var url = Uri.parse(api);
      final res = await http.get(url);
      var resdata = jsonDecode(res.body);
      final Map data = resdata;

      log(data.toString());
    } catch (e) {
      log(e.toString());
      return {};
    }
  }
  

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //simple provider+++++++++++++
    // int data = ref.read<dynamic>(getProvider);
    //state provider++++++++++++++
    // int data = ref.watch(stateProvider);
    //stream provider+++++++++++++
    var data = ref.watch(streamProvider);
    return data.when(data: (data) {
      return Center(
        child: Text(data.toString()),
      );
    }, error: (error, stackTrace) {
      return Center(
        child: Text(error.toString()),
      );
    }, loading: () {
      return Center(
        child: CircularProgressIndicator(),
      );
    });
  }
}

Stream<int> fechdata() {
  return Stream<int>.periodic(
    Duration(seconds: 2),
    (number) => number,
  ).take(100);
}

                 