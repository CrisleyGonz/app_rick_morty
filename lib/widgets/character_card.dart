import 'package:flutter/material.dart';
import 'package:work_test/models/models.dart';

class CharacterCard extends StatelessWidget {
  const CharacterCard({super.key, required this.characterModel});

  final CharacterModel characterModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(200),
              child: CircleAvatar(
                backgroundColor: const Color(0xFFF0F0F0),
                radius: 40,
                child: Image.network(characterModel.image ?? ""),
              )),
          const SizedBox(width: 20),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  characterModel.name ?? "Desconocido",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF333333)),
                ),
                const SizedBox(height: 5),
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: const Color(0xFF55CC44),
                    borderRadius: BorderRadius.circular(2),
                  ),
                  child: Text(
                      characterModel.species?.toUpperCase() ?? "Desconocido",
                      style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w900,
                          color: Colors.white)),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Last known location',
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF333333)),
                ),
                const SizedBox(height: 4),
                Text(
                  characterModel.location?.name ?? "Desconocido",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF333333)),
                ),
                const SizedBox(height: 4),
                const Text(
                  'First seen in',
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF333333)),
                ),
                const SizedBox(height: 4),
                Text(
                  characterModel.origin?.name ?? "Desconocido",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF333333)),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
