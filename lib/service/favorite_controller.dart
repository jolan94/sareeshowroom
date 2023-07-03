import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sareeshowroom/models/saree_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FavoriteController extends GetxController {
  final List<SareeModel> sareeList = <SareeModel>[].obs;
  final List<SareeModel> favoriteSarees = <SareeModel>[].obs;

  final box = GetStorage();

  @override
  void onInit() {
    super.onInit();
    fetchSareeData();
    fetchFavoriteSarees();
  }

  void fetchSareeData() async {
    try {
      final response = await http.get(Uri.parse('https://api.npoint.io/926d7dbf8506d2b258c2/saree/'));
      if (response.statusCode == 200) {
        final data = json.decode(response.body) as List<dynamic>;
        final List<SareeModel> sarees = data.map((json) => SareeModel.fromJson(json)).toList();
        sareeList.assignAll(sarees);
      } else {
        throw Exception('Failed to fetch saree data');
      }
    } catch (e) {
      print(e);
    }
  }

  void fetchFavoriteSarees() {
    // Retrieve favorite sarees from local storage
    final favorites = box.read<List>('favorites');
    if (favorites != null) {
      favoriteSarees.assignAll(
        favorites.map((sareeJson) => SareeModel.fromJson(sareeJson)).toList(),
      );
    }
  }

  void addFavoriteSaree(SareeModel saree) {
    favoriteSarees.add(saree);
    box.write('favorites', favoriteSarees.map((saree) => saree.toJson()).toList());
  }

  void removeFavoriteSaree(SareeModel saree) {
    favoriteSarees.remove(saree);
    box.write('favorites', favoriteSarees.map((saree) => saree.toJson()).toList());
  }

  bool isSareeFavorited(SareeModel saree) {
    return favoriteSarees.contains(saree);
  }
}
