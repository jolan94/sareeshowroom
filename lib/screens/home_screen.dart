import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sareeshowroom/models/saree_model.dart';
import 'package:sareeshowroom/screens/favorites_screen.dart';
import 'package:sareeshowroom/screens/item_detail_screen.dart';
import 'package:sareeshowroom/screens/profile_screen.dart';
import 'package:sareeshowroom/service/favorite_controller.dart';
import 'package:sareeshowroom/widgets/saree_grid_item.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FavoriteController favoriteController = Get.put(FavoriteController());
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              Get.to(() => FavoritesScreen());
            },
            icon: const Icon(Icons.favorite),
          ),
          IconButton(
            onPressed: () {
              Get.to(() => ProfileScreen());
            },
            icon: const Icon(Icons.person),
          ),
        ],
      ),
      body: Obx(
        () {
          final List<SareeModel> filteredSarees = favoriteController.sareeList
              .where((saree) => saree.title.toLowerCase().contains(_searchQuery.toLowerCase()))
              .toList();

          if (filteredSarees.isEmpty) {
            return const Center(
              child: Text(
                'No results found',
                style: TextStyle(fontSize: 18),
              ),
            );
          }

          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _searchController,
                  decoration: const InputDecoration(
                    labelText: 'Search',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _searchQuery = value;
                    });
                  },
                ),
              ),
              Expanded(
                child: GridView.builder(
                  itemCount: filteredSarees.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (ctx, index) {
                    final saree = filteredSarees[index];
                    return GestureDetector(
                      onTap: () {
                        Get.to(() => ItemDetailScreen(saree: saree));
                      },
                      child: SareeGridItem(saree: saree),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
