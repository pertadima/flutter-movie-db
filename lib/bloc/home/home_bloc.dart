import 'dart:async';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:movie_db/network/network_repository.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final NetworkRepository networkRepository;

  HomeBloc({@required this.networkRepository})
      : assert(networkRepository != null);

  @override
  HomeState get initialState => InitialHomeState();

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    if (event is FetchTrendingMovie) {
      yield HomeLoading();

      try {
        final data = await networkRepository.getTrendingMovie();
        yield HomeLoaded(movie: data);
      } catch (exception) {
        yield HomeError(error: exception.toString());
      }
    }
  }
}
