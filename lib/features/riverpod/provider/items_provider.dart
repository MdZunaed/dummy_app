import 'package:dummy_app/features/riverpod/models/item_model.dart';
import 'package:dummy_app/features/riverpod/provider/items_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final itemProvider = StateNotifierProvider<ItemsNotifier, ItemsState>((ref) {
  return ItemsNotifier();
});

class ItemsNotifier extends StateNotifier<ItemsState> {
  ItemsNotifier() : super(ItemsState(
      allItems: items,
      filteredItems: [],
      favoriteItems: [],
      favoriteFilterType: FavoriteFilterType.all,
      query: '',
  ));

  void getFilterItems(String query) {
    state = state.copyWith(filteredItems: _filterItems(state.allItems, query));
  }

  List<Item> _filterItems(List<Item> items, String query) {
    if (query.isEmpty) {
      return [];
    }
    return items.where((item) => item.name.toLowerCase().contains(query)).toList();
  }

  void getFavoriteItems(FavoriteFilterType filterType) {
    state = state.copyWith(favoriteItems: _filterFavoriteItems(state.allItems, filterType));
  }


  void updateItemType(FavoriteFilterType filterType) {
    state = state.copyWith(favoriteFilterType: filterType);
  }

  List<Item> _filterFavoriteItems(List<Item> items, FavoriteFilterType filterType) {
    if (filterType == FavoriteFilterType.all) {
      return items;
    }
    return items.where((item) => item.favourite == true).toList();
  }
}

List<Item> items = [
  Item(name: 'MacBook', favourite: true, id: 1),
  Item(name: 'iPhone', favourite: false, id: 2),
  Item(name: 'G-force 3860', favourite: false, id: 3),
  Item(name: 'Samsung Ultra', favourite: true, id: 4),
  Item(name: 'Google Pixel 9', favourite: false, id: 5),
  Item(name: 'iPad Pro 13', favourite: true, id: 6)
];

enum FavoriteFilterType { all, favorite }
