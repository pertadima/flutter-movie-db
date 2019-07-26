import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_db/bloc/home/home_bloc.dart';
import 'package:movie_db/bloc/home/home_event.dart';
import 'package:movie_db/bloc/home/home_state.dart';
import 'package:movie_db/data/movie_response.dart';
import 'package:movie_db/network/network_repository.dart';

class MockNetworkRepository extends Mock implements NetworkRepository {
  
}

var homeResponse =
    MovieResponse(page: 1, results: [], totalPages: 1, totalResults: 1);

void main() {
  HomeBloc homeBloc;
  NetworkRepository networkRepository;

  setUp(() {
    networkRepository = MockNetworkRepository();
    homeBloc = HomeBloc(networkRepository: networkRepository);
  });

  test('throw error when repository is null', () {
    expect(() => HomeBloc(networkRepository: null), throwsAssertionError);
  });

  test('initial state is correct', () {
    expect(homeBloc.initialState, InitialHomeState());
  });

  test('dispose does not emit new states', () {
    expectLater(homeBloc.state, emitsInOrder([]));
    homeBloc.dispose();
  });

  group('HomeLoaded', () {
    test('Trending Movie Load Success', () {
      final expectedResponse = [
        InitialHomeState(),
        HomeLoading(),
        HomeLoaded(movie: homeResponse)
      ];

      when(networkRepository.getTrendingMovie())
          .thenAnswer((_) => Future.value(homeResponse));

      expectLater(homeBloc.state, emitsInOrder(expectedResponse)).then((_) {
        verify(networkRepository.getTrendingMovie()).called(1);
      });
      homeBloc.dispatch(FetchTrendingMovie());
    });
  });
}
