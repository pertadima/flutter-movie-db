import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_db/bloc/home/home_bloc.dart';
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
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: _homeBloc,
      builder: (BuildContext context, HomeState homeState) {
        if (homeState is HomeLoaded) {
          
        }

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
              child: null
            ),
          ),
        );
      },
    );
  }
}
