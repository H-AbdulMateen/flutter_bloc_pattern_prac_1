import 'package:flutter_bloc_pattern_prac_1/src/models/item_model.dart';
import 'package:flutter_bloc_pattern_prac_1/src/models/trailer_model.dart';
import 'package:flutter_bloc_pattern_prac_1/src/resources/movie_api_provider.dart';

class Repository{
  var apiProvider = MovieApiProvider();

  Future<ItemModel> fetchMovies() => apiProvider.fetchMovieList();

  Future<TrailerModel> fetchTrailers(int movieId) => apiProvider.fetchTrailer(movieId);

}