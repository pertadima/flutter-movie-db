import 'package:movie_db/data/movie_response.dart';
import 'package:movie_db/network/service_api.dart';

class NetworkRepository {
  static NetworkRepository _repo;
  static NetworkRepository get() => _repo;
  NetworkRepository._internal(this.serviceApi);
  final ServiceAPI serviceApi;

  factory NetworkRepository(ServiceAPI serviceApi) {
    _repo = NetworkRepository._internal(serviceApi);
    return _repo;
  }

  Future<MovieResponse> getTrendingMovie() async{
    final data = await serviceApi.fetchTrendingMovie();
    return data;
  }
}
