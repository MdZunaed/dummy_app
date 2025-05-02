import 'package:dummy_app/features/riverpod/models/item_model.dart';
import 'package:dummy_app/features/riverpod/provider/items_provider.dart';

class ItemsState {
  final List<Item> allItems;
  final List<Item> filteredItems;
  final List<Item> favoriteItems;
  final FavoriteFilterType favoriteFilterType;
  final String query;

  ItemsState({
    required this.allItems,
    required this.filteredItems,
    required this.favoriteItems,
    required this.query,
    required this.favoriteFilterType,
  });

  ItemsState copyWith({
    final List<Item>? allItems,
    final List<Item>? filteredItems,
    final List<Item>? favoriteItems,
    final FavoriteFilterType? favoriteFilterType,
    final String? query,
  }) {
    return ItemsState(
      allItems: allItems ?? this.allItems,
      filteredItems: filteredItems ?? this.filteredItems,
      favoriteItems: favoriteItems ?? this.favoriteItems,
      query: query ?? this.query,
      favoriteFilterType: favoriteFilterType ?? this.favoriteFilterType,
    );
  }
}
