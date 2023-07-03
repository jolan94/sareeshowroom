import 'package:flutter/material.dart';
import 'package:sareeshowroom/models/saree_model.dart';

class SareeGridItem extends StatelessWidget {
  final SareeModel saree;

  const SareeGridItem({required this.saree});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridTile(
        footer: GridTileBar(
            backgroundColor: Colors.black45,
            title: Text(saree.title),
            subtitle: Text(
              '₹${saree.price.toStringAsFixed(2)}',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            trailing: Row(
              children: [
                const Icon(Icons.thumb_up),
                const SizedBox(width: 5),
                Text(
                  saree.likesCount.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            )),
        child: Image.network(saree.imageURL, fit: BoxFit.cover),
      ),
    );
  }
}
