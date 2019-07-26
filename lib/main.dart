import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:movie_db/network/network_repository.dart';
import 'package:movie_db/network/service_api.dart';
import 'package:movie_db/section/home/home_screen.dart';
import 'package:http/http.dart' as http;
import 'package:movie_db/simple_bloc_delegate.dart';

import 'app_config.dart';

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();

  var repository = NetworkRepository(ServiceAPI(
      httpClient: http.Client(), baseUrl: "https://api.themoviedb.org/3"));

  var configuredApp = AppConfig(
    appDisplayName: "Flutter Demo",
    appInternalId: 1,
    child: MyApp(networkRepository: repository),
  );

   runApp(configuredApp);
}

class MyApp extends StatelessWidget {
  final NetworkRepository networkRepository;
  const MyApp({Key key, this.networkRepository})
      : assert(networkRepository != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo - Movie DB',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}
