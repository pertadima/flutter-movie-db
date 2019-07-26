import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:movie_db/data/movie_response.dart';

@immutable
abstract class HomeState extends Equatable {
  HomeState([List props = const []]) : super(props);
}

class InitialHomeState extends HomeState {
  @override
  String toString() => 'InitialHomeState';
}

class HomeLoading extends HomeState {
  @override
  String toString() => 'HomeLoading';
}

class HomeLoaded extends HomeState {
  final MovieResponse movie;
  HomeLoaded({@required this.movie}) : super([movie]);

  @override
  String toString() => 'HomeLoaded';
}

class HomeError extends HomeState {
  final String error;
  HomeError({@required this.error}) : super([error]);

  @override
  String toString() => 'HomeError';
}