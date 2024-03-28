import 'dart:math' as math;

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:work_test/models/models.dart';
import 'package:work_test/provider/pokemon_provider.dart';
import 'package:work_test/provider/rick_and_morty_provider.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState());

  final RickAndMortyProvider _rickAndMortyProvider = RickAndMortyProvider();
  final PokemonProvider _pokemonProvider = PokemonProvider();

  Future<void> getCharacters({bool isLoading = false}) async {
    (isLoading)
        ? emit(state.copyWith(isLoading: true))
        : emit(state.copyWith(sectionStatus: SectionStatus.loading));

    final response =
        await _rickAndMortyProvider.getCharacters(page: state.page);

    return response.fold((l) {
      emit(state.copyWith(sectionStatus: SectionStatus.error));
    }, (r) async {
      final ricks = [...state.charactersList + r.results!];
      final pokemons = [...state.pokemonsList];

      List<dynamic> newList = [];

      // Iterando la lista de ricks
      for (var i = 0; i < ricks.length; i++) {
        // Agregando un Rick a la lista
        newList.add(ricks[i]);

        // Verificando cada 7 posiciones (Division por modulo)
        if ((i + 1).remainder(7) == 0) {
          // Verificando longitud de la lista
          if (pokemons.length >= ((i + 1) / 7)) {
            // Agregando un pokemon a la lista
            newList.add(pokemons[(((i + 1) / 7) - 1).toInt()]);
          } else {
            // Consumiendo endpoint para conseguir un nuevo pokemon
            await _getPokemon(id: (1 + math.Random().nextInt((1025 - 1) + 1)))
                .then((newPokemon) {
              if (newPokemon != null) {
                // Agregando un pokemon a la lista
                newList.add(newPokemon);
              } else {
                emit(state.copyWith(
                    sectionStatus: SectionStatus.error,
                    page: 1,
                    charactersList: [],
                    ultimate: [],
                    pokemonsList: [],
                    charactersModel: const Shrouded.value(null)));
                return;
              }
            });
          }
        } else {
          //
        }
      }
      emit(state.copyWith(
        sectionStatus: SectionStatus.ok,
        charactersModel: Shrouded.value(r),
        ultimate: newList,
        page: ((r.info?.next ?? "").isNotEmpty) ? (state.page) + 1 : (-1),
        charactersList: [...state.charactersList + r.results!],
        isLoading: false,
      ));
    });
  }

  Future<PokemonModel?> _getPokemon({required int id}) async {
    PokemonModel? pokemon;
    emit(state.copyWith(pokemonStatus: SectionStatus.loading));

    final response = await _pokemonProvider.getPokemon(id: id);

    response.fold((l) {
      emit(state.copyWith(pokemonStatus: SectionStatus.error));
    }, (r) {
      pokemon = r;
      emit(state.copyWith(
        pokemonStatus: SectionStatus.ok,
        pokemonsList: [
          ...state.pokemonsList + [r]
        ],
      ));
    });
    return pokemon;
  }
}
