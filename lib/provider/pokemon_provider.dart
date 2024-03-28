import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:work_test/api/api_resource.dart';
import 'package:work_test/models/pokemon/pokemon.dart';

class PokemonProvider {
  // Obteniendo un pokemon
  Future<Either<String, PokemonModel>> getPokemon({required int id}) async {
    log("getPokemon -> id: $id");

    try {
      // Endpoint
      final response = await ApiResource().pokemonApi.get("pokemon/$id/");

      return Right(PokemonModel.fromJson(response.data));
    } catch (e) {
      return const Left("Error");
    }
  }
}
