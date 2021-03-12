import 'package:flutter_bloc_pattern_prac_1/src/models/item_model.dart';
import 'package:flutter_bloc_pattern_prac_1/src/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class MoviesBloc{
  var _repository = Repository();
  var _moviesFetcher = PublishSubject<ItemModel>();

  Stream<ItemModel> get allMovies => _moviesFetcher.stream;

  fetchAllMovies() async {
    ItemModel itemModel =await _repository.fetchMovies();
    _moviesFetcher.sink.add(itemModel);
  }

  dispose(){
    _moviesFetcher.close();
  }
}

final bloc = MoviesBloc();