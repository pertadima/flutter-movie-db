import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:meta/meta.dart';
import 'package:movie_db/data/movie_response.dart';
import 'enum_api.dart';

class ServiceAPI {
  final http.Client httpClient;
  final String baseUrl;

  ServiceAPI({@required this.httpClient, @required this.baseUrl});

  Future<MovieResponse> fetchTrendingMovie() async {
    final response =
        await httpClient.get(baseUrl + endPoint[Service.trendingMovie]);

    if (response.statusCode == 200) {
      return MovieResponse.fromJson(json.decode(response.body));
    } else {
      return throw Exception('Error fetch data');
    }
  }
}
