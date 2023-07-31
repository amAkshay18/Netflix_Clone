import 'dart:convert';
import 'dart:developer';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'package:netflix/domain/models/common_model/common_model.dart';
import 'package:netflix/domain/models/common_model/result.dart';
import 'package:netflix/infrasturcture/apikey.dart';

Future<List<Result>> getReleased() async {
  final response = await http.get(
    Uri.parse('https://api.themoviedb.org/3/movie/now_playing?api_key=$apiKey'),
  );
  if (response.statusCode == 200) {
    final jsonData = jsonDecode(response.body);
    final result = CommonModel.fromJson(jsonData);

    if (result.results != null) {
      return result.results!;
    }
  }
  List<Result> empty = [];
  return empty;
}

Future<List<Result>> getTrendingNow() async {
  final response = await http.get(
    Uri.parse(
        'https://api.themoviedb.org/3/movie/top_rated?api_key=ec1c497e5e53e7b2a49aea6d139f7954'),
  );
  if (response.statusCode == 200) {
    final jsonData = jsonDecode(response.body);
    final result = CommonModel.fromJson(jsonData);

    if (result.results != null) {
      return result.results!;
    }
  }
  List<Result> empty = [];
  return empty;
}

Future<List<Result>> getTenseDrama() async {
  final response = await http.get(
    Uri.parse(
        'https://api.themoviedb.org/3/tv/airing_today?api_key=ec1c497e5e53e7b2a49aea6d139f7954'),
  );
  if (response.statusCode == 200) {
    final jsonData = jsonDecode(response.body);
    final result = CommonModel.fromJson(jsonData);

    if (result.results != null) {
      return result.results!;
    }
  }
  List<Result> empty = [];
  return empty;
}

Future<List<Result>> getSouthIndianCinema() async {
  final response = await http.get(
    Uri.parse(
        'https://api.themoviedb.org/3/tv/top_rated?api_key=ec1c497e5e53e7b2a49aea6d139f7954'),
  );
  if (response.statusCode == 200) {
    final jsonData = jsonDecode(response.body);
    final result = CommonModel.fromJson(jsonData);
    if (result.results != null) {
      return result.results!;
    }
  }
  List<Result> empty = [];
  return empty;
}

Future<List<Result>> getTop10TvShowsInIndiaToday() async {
  final response = await http.get(
    Uri.parse('https://api.themoviedb.org/3/movie/now_playing?api_key=$apiKey'),
  );
  if (response.statusCode == 200) {
    final jsonData = jsonDecode(response.body);
    final result = CommonModel.fromJson(jsonData);
    if (result.results != null) {
      return result.results!;
    }
  } else {
    log('error');
  }

  return [];
}
