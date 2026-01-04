import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectedCategoryProvider = StateProvider<int>((ref) => 0);

class CategoryList extends ConsumerWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // La liste de tes catégories
    final List<String> categories = [
      "Neapolitan",
      "Margherita",
      "Pepperoni",
      "Mushroom",
      "Hawaiian"
    ];

    // On écoute quelle catégorie est sélectionnée
    final selectedIndex = ref.watch(selectedCategoryProvider);

    return SizedBox(
      height: 40, // Hauteur de la barre de catégories
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 1),
        itemCount: categories.length,
        // Le séparateur entre chaque bulle
        separatorBuilder: (context, index) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final isSelected = selectedIndex == index;

          return GestureDetector(
            onTap: () {
              // On met à jour l'index sélectionné lors du clic
              ref.read(selectedCategoryProvider.notifier).state = index;
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              padding: const EdgeInsets.symmetric(horizontal: 25),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                // Si sélectionné : Orange, sinon : Blanc avec bordure
                color: isSelected ? Colors.deepOrange : Colors.white,
                borderRadius: BorderRadius.circular(25),
                border: Border.all(
                  color: isSelected ? Colors.deepOrange : Colors.grey.shade300,
                  width: 1,
                ),
              ),
              child: Text(
                categories[index],
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black87,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  fontSize: 15,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}