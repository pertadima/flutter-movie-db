enum Service {
  trendingMovie,
  detailMovie
}

const Map<Service, String> endPoint = {
  Service.trendingMovie: "/trending/movie/week?api_key=c8ff8c510e74a75a3643870242745d71",
  Service.detailMovie: ""
};