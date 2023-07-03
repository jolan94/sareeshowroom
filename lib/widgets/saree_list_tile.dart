import 'package:flutter/material.dart';
import 'package:sareeshowroom/models/saree_model.dart';

class SareeListTile extends StatelessWidget {
  final SareeModel saree;

  const SareeListTile({required this.saree});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(saree.imageURL, width: 48, height: 48, fit: BoxFit.cover),
      title: Text(saree.title),
      subtitle: Text('Price: \$${saree.price.toStringAsFixed(2)}'),
      trailing: IconButton(
        icon: const Icon(Icons.favorite),
        onPressed: () {},
      ),
    );
  }
}
