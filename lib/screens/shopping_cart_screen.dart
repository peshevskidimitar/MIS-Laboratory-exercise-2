import 'package:flutter/material.dart';

import '../models/clothing.dart';

class ShoppingCartScreen extends StatefulWidget {
  final List<Clothing> clothes;
  final Function removeClothing;
  final Function buyAll;

  const ShoppingCartScreen(
      {super.key,
      required this.clothes,
      required this.removeClothing,
      required this.buyAll});

  @override
  State<ShoppingCartScreen> createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Clothing Store",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: ListView.builder(
          itemCount: widget.clothes.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                leading: Image.asset(
                  widget.clothes[index].imageUrl,
                  fit: BoxFit.cover,
                ),
                title: Text(
                  "${widget.clothes[index].name} \$${widget.clothes[index].price.toStringAsFixed(2)}",
                  style: const TextStyle(fontSize: 16, color: Colors.red),
                ),
                subtitle: Text(
                  widget.clothes[index].description,
                  style: const TextStyle(fontSize: 14, color: Colors.red),
                  overflow: TextOverflow.fade,
                ),
                trailing: FloatingActionButton(
                  heroTag: "$index",
                  mini: true,
                  onPressed: () {
                    setState(() {
                      widget.removeClothing(index);
                    });
                  },
                  backgroundColor: Colors.green,
                  child: const Icon(Icons.remove_shopping_cart),
                ),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            widget.buyAll();
          });
        },
        backgroundColor: Colors.green,
        child: const Icon(Icons.shopping_cart_checkout),
      ),
    );
  }
}
