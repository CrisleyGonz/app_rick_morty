part of 'home_cubit.dart';

class HomeState extends Equatable {
  const HomeState({
    this.errorText = "",
    this.sectionStatus = SectionStatus.initial,
    this.charactersModel,
    this.isLoading = false,
    this.page = 1,
    this.charactersList = const [],
    this.pokemonsList = const [],
    this.pokemonStatus = SectionStatus.initial,
    this.ultimate = const [],
  });

  // General
  final String errorText;
  final bool isLoading;
  final int page;

  // Rick and Morty
  final SectionStatus sectionStatus;
  final CharactersModel? charactersModel;
  final List<CharacterModel> charactersList;

  // Pokemons
  final List<PokemonModel> pokemonsList;
  final SectionStatus pokemonStatus;

  // Ricks + Pokemons
  final List<dynamic> ultimate;

  @override
  List<Object?> get props => [
        errorText,
        sectionStatus,
        charactersModel,
        isLoading,
        page,
        charactersList,
        pokemonsList,
        pokemonStatus,
        ultimate,
      ];

  HomeState copyWith({
    String? errorText,
    SectionStatus? sectionStatus,
    Shrouded<CharactersModel?>? charactersModel,
    bool? isLoading,
    int? page,
    List<CharacterModel>? charactersList,
    List<PokemonModel>? pokemonsList,
    SectionStatus? pokemonStatus,
    List<dynamic>? ultimate,
  }) {
    return HomeState(
      errorText: errorText ?? this.errorText,
      sectionStatus: sectionStatus ?? this.sectionStatus,
      charactersModel: charactersModel != null
          ? charactersModel.value
          : this.charactersModel,
      isLoading: isLoading ?? this.isLoading,
      page: page ?? this.page,
      charactersList: charactersList ?? this.charactersList,
      pokemonsList: pokemonsList ?? this.pokemonsList,
      pokemonStatus: pokemonStatus ?? this.pokemonStatus,
      ultimate: ultimate ?? this.ultimate,
    );
  }
}
