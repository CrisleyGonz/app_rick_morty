class ConstantsImages {
  static const String basePath = 'assets/';

  static String getImagePath({required String imageName}) {
    return basePath + imageName;
  }

  static const String logo1 = 'logo_pokemon.png';
  static const String logo2 = 'logo_rick_and_mortie.png';
  static const String bg = 'bg_card.png';
}
