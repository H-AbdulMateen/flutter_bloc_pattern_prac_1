import 'dart:async';
import 'dart:convert';
import 'package:flutter_bloc_pattern_prac_1/src/models/item_model.dart';
import 'package:flutter_bloc_pattern_prac_1/src/models/trailer_model.dart';
import 'package:http/http.dart' show Client;

class MovieApiProvider {
  Client client = Client();
  final _apiKey = '802b2c4b88ea1183e50e6b285a27696e';
  final _baseUrl = "http://api.themoviedb.org/3/movie";
  Future<ItemModel> fetchMovieList() async {
    print("entered");
    final response = await client
        .get(Uri.parse('http://api.themoviedb.org/3/movie/popular?api_key=$_apiKey'));
    print(response.body.toString());
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return ItemModel.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }

  Future<TrailerModel> fetchTrailer(int movieId) async {
    final response =
    await client.get(Uri.parse("$_baseUrl/$movieId/videos?api_key=$_apiKey"));

    if (response.statusCode == 200) {
      return TrailerModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load trailers');
    }
  }

}