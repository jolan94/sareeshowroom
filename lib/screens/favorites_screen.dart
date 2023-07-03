import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sareeshowroom/service/favorite_controller.dart';
import 'package:sareeshowroom/widgets/saree_list_tile.dart';

class FavoritesScreen extends StatelessWidget {
  final FavoriteController favoriteController = Get.find<FavoriteController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: favoriteController.favoriteSarees.length,
          itemBuilder: (ctx, index) {
            final saree = favoriteController.favoriteSarees[index];
            return SareeListTile(saree: saree);
          },
        ),
      ),
    );
  }
}
