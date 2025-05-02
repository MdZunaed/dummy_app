import 'package:dummy_app/features/riverpod/provider/items_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoriteRiverpod extends ConsumerWidget {
  const FavoriteRiverpod({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(itemProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Items"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10,
          children: [
            TextField(
              decoration: const InputDecoration(
                hintText: "Search Items....",
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                ref.read(itemProvider.notifier).getFilterItems(value);
              },
            ),
            if (items.filteredItems.isNotEmpty) ...[
              const Text("Searched Items"),
              ListView.builder(
                shrinkWrap: true,
                primary: false,
                itemCount: items.filteredItems.length,
                itemBuilder: (context, index) {
                  final item = items.filteredItems[index];
                  return ListTile(
                    title: Text(item.name),
                    leading: const Icon(Icons.image_sharp),
                    trailing: Icon(item.favourite ? Icons.favorite : Icons.favorite_outline),
                  );
                },
              ),
            ],
            allItemsTitleWithFilter(context, ref),
            ListView.builder(
              shrinkWrap: true,
              primary: false,
              itemCount: items.favoriteFilterType == FavoriteFilterType.all
                  ? items.allItems.length
                  : items.favoriteItems.length,
              itemBuilder: (context, index) {
                final item = items.favoriteFilterType == FavoriteFilterType.all
                    ? items.allItems[index]
                    : items.favoriteItems[index];
                return ListTile(
                  title: Text(item.name),
                  leading: const Icon(Icons.image_sharp),
                  trailing: Icon(item.favourite ? Icons.favorite : Icons.favorite_outline),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Row allItemsTitleWithFilter(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text("All Items"),
        PopupMenuButton(
          icon: Icon(Icons.filter_alt, color: Theme.of(context).primaryColor),
          onSelected: (value) {
            ref.read(itemProvider.notifier).updateItemType(value);
            ref.read(itemProvider.notifier).getFavoriteItems(value);
          },
          itemBuilder: (context) {
            return [
              const PopupMenuItem(
                value: FavoriteFilterType.all,
                child: Text("All"),
              ),
              const PopupMenuItem(
                value: FavoriteFilterType.favorite,
                child: Text("Favorites"),
              ),
            ];
          },
        ),
      ],
    );
  }
}
