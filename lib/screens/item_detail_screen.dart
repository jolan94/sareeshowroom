import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sareeshowroom/models/saree_model.dart';
import 'package:sareeshowroom/service/favorite_controller.dart';

class ItemDetailScreen extends StatefulWidget {
  final SareeModel saree;

  const ItemDetailScreen({required this.saree});

  @override
  _ItemDetailScreenState createState() => _ItemDetailScreenState();
}

class _ItemDetailScreenState extends State<ItemDetailScreen> {
  final FavoriteController favoriteController = Get.find<FavoriteController>();
  bool isFavorited = false;

  @override
  void initState() {
    isFavorited = favoriteController.isSareeFavorited(widget.saree);
    super.initState();
  }

  void toggleFavorite() {
    setState(() {
      isFavorited = !isFavorited;
      if (isFavorited) {
        favoriteController.addFavoriteSaree(widget.saree);
      } else {
        favoriteController.removeFavoriteSaree(widget.saree);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Item Detail'),
        actions: [
          IconButton(
            onPressed: toggleFavorite,
            icon: Icon(
              isFavorited ? Icons.favorite : Icons.favorite_border,
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(widget.saree.imageURL),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '₹${widget.saree.price.toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 18),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '👍${widget.saree.likesCount.toString()}',
                  style: const TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.saree.title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(widget.saree.description),
          ),
        ],
      ),
    );
  }
}
