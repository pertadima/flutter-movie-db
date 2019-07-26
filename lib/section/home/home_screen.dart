import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_db/bloc/home/home_bloc.dart';
import 'package:movie_db/bloc/home/home_event.dart';
import 'package:movie_db/bloc/home/home_state.dart';
import 'package:movie_db/network/network_repository.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeBloc _homeBloc =
      HomeBloc(networkRepository: NetworkRepository.get());

  @override
  void initState() {
    super.initState();
    _homeBloc.dispatch(FetchTrendingMovie());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: _homeBloc,
      builder: (BuildContext context, HomeState homeState) {
        if (homeState is HomeLoaded) {
          return BlocProviderTree(
            blocProviders: [
              BlocProvider<HomeBloc>(
                bloc: _homeBloc,
              ),
            ],
            child: Scaffold(
              resizeToAvoidBottomPadding: false,
              backgroundColor: Colors.white,
              appBar: AppBar(title: Text('Movie DB - Flutter')),
              body: Container(
                  height: double.infinity,
                  child: GridView.builder(
                    padding: EdgeInsets.all(20.0),
                    itemBuilder: (context, position) {
                      return Card(
                        child: Image.network(
                            "https://image.tmdb.org/t/p/w500${homeState.movie.results[position].posterPath}",
                            fit: BoxFit.cover),
                      );
                    },
                    itemCount: homeState.movie.results.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                  )),
            ),
          );
        }

        if (homeState is HomeError) {}

        if (homeState is HomeLoading) {}
      },
    );
  }
}
