class ApiConstants {
  ApiConstants._();

  static const String base_URL = 'https://api.themoviedb.org/3';
  static const String API_key = '?api_key=2e0db4bf985c85cdfdecd37bb37b42ec';

  static const String trending_URL =
      'https://api.themoviedb.org/3/trending/movie/day?api_key=2e0db4bf985c85cdfdecd37bb37b42ec';
  static const String latest_URL =
      'https://api.themoviedb.org/3/movie/latest?api_key=2e0db4bf985c85cdfdecd37bb37b42ec';
  static const String toprated_URL =
      'https://api.themoviedb.org/3/movie/top_rated?api_key=2e0db4bf985c85cdfdecd37bb37b42ec';
  static const String upcoming_URL =
      'https://api.themoviedb.org/3/movie/upcoming?api_key=2e0db4bf985c85cdfdecd37bb37b42ec';
  static String image_URL(String path) =>
      'https://image.tmdb.org/t/p/w500$path';

  static String detail_URL(int movieId) =>
      'https://api.themoviedb.org/3/movie/$movieId?api_key=2e0db4bf985c85cdfdecd37bb37b42ec';
}
