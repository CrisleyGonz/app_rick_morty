import 'package:dio/dio.dart';

class ApiResource {
  final characterApi = characterDio();
  final pokemonApi = pokemonDio();

  static Dio characterDio() {
    var dio = Dio(BaseOptions(
      baseUrl: "https://rickandmortyapi.com/api/",
      receiveTimeout: const Duration(minutes: 10),
      connectTimeout: const Duration(minutes: 10),
      sendTimeout: const Duration(minutes: 10),
    ));
    return dio;
  }

  static Dio pokemonDio() {
    var dio = Dio(BaseOptions(
      baseUrl: "https://pokeapi.co/api/v2/",
      receiveTimeout: const Duration(minutes: 10),
      connectTimeout: const Duration(minutes: 10),
      sendTimeout: const Duration(minutes: 10),
    ));
    return dio;
  }
}
