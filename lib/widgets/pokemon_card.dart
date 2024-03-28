import 'package:flutter/material.dart';
import 'package:work_test/constants/constants_images.dart';
import 'package:work_test/models/models.dart';

class PokemonCard extends StatelessWidget {
  const PokemonCard({super.key, required this.pokemon});

  final PokemonModel pokemon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      //padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF3F67AB),
        image: DecorationImage(
            image: AssetImage(
              ConstantsImages.getImagePath(imageName: ConstantsImages.bg),
            ),
            fit: BoxFit.fill),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(28, 12, 0, 28),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                decoration: const BoxDecoration(
                  color: Color(0xFFFECA1B),
                ),
                child: const Text(
                  "PUBLICIDAD",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(200),
                  child: CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.white,
                    child: Image.network(
                        pokemon.sprites?.other?.officialArtwork?.frontDefault ??
                            ""),
                  )),
              const SizedBox(width: 30),
              Flexible(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      pokemon.name ?? "Desconocido",
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Color.fromARGB(255, 255, 255, 255)),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 6, vertical: 3),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2),
                        color: const Color(0xFF333333),
                      ),
                      child: Text(
                        'Tipo: ${pokemon.types?.first.type?.name}'
                            .toUpperCase(),
                        style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w900,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
