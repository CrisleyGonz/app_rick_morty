import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:work_test/api/api.dart';
import 'package:work_test/models/rick_and_morty/rick_and_morty.dart';

class RickAndMortyProvider {
  // Obteniendo lista de personajes
  Future<Either<String, CharactersModel>> getCharacters(
      {required int page}) async {
    log("getCharacters -> page: $page");

    try {
      // Parametro para manejo del paginado
      final params = {"page": page};

      // Endpoint
      final response = await ApiResource()
          .characterApi
          .get("character", queryParameters: params);

      return Right(CharactersModel.fromJson(response.data));
    } catch (e) {
      return const Left("Error");
    }
  }
}
