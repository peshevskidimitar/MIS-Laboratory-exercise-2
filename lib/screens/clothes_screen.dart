import 'package:eshop/screens/shopping_cart_screen.dart';
import 'package:eshop/widgets/add_clothing.dart';
import 'package:eshop/widgets/edit_clothing.dart';
import 'package:flutter/material.dart';

import '../models/clothing.dart';

class ClothesScreen extends StatefulWidget {
  const ClothesScreen({super.key});

  @override
  State<ClothesScreen> createState() => _ClothesScreenState();
}

class _ClothesScreenState extends State<ClothesScreen> {
  final List<Clothing> _clothes = [
    Clothing(1, "T-shirt", "This is a red T-shirt.", "lib/images/t-shirt.png",
        49.99),
    Clothing(
        2, "Dress", "This is a pink dress.", "lib/images/dress.png", 399.99)
  ];
  final List<Clothing> _shoppingCartClothes = [];

  void _addClothing() {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return GestureDetector(
              onTap: () {},
              behavior: HitTestBehavior.opaque,
              child: AddClothing(addClothing: _addClothingToList));
        });
  }

  void _editClothing(int index, Clothing clothing) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return GestureDetector(
              onTap: () {},
              behavior: HitTestBehavior.opaque,
              child: EditClothing(
                  index: index,
                  clothing: clothing,
                  editClothing: _editClothingFromList));
        });
  }

  void _addClothingToList(Clothing clothing) {
    setState(() {
      _clothes.add(clothing);
    });
  }

  void _editClothingFromList(int index, Clothing clothing) {
    setState(() {
      _clothes[index] = clothing;
    });
  }

  void _removeClothingFromList(int index) {
    setState(() {
      _clothes.removeAt(index);
    });
  }

  void _addToShoppingCart(int index) {
    setState(() {
      _shoppingCartClothes.add(_clothes[index]);
    });
  }

  void _removeFromShoppingCart(int index) {
    setState(() {
      _shoppingCartClothes.removeAt(index);
    });
  }

  void _buyAllFromShoppingCart() {
    setState(() {
      _shoppingCartClothes.clear();
    });
  }

  void _navigateToShoppingCart() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ShoppingCartScreen(
          clothes: _shoppingCartClothes,
          removeClothing: _removeFromShoppingCart,
          buyAll: _buyAllFromShoppingCart,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Clothing Store",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Theme.of(context).primaryColor,
        actions: [
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: ElevatedButton(
                  onPressed: _navigateToShoppingCart,
                  child: const Icon(Icons.shopping_cart)))
        ],
      ),
      body: ListView.builder(
          itemCount: _clothes.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                leading: Image.asset(
                  _clothes[index].imageUrl,
                  fit: BoxFit.cover,
                ),
                title: Text(
                  "${_clothes[index].name} \$${_clothes[index].price.toStringAsFixed(2)}",
                  style: const TextStyle(fontSize: 16, color: Colors.red),
                ),
                subtitle: Text(
                  _clothes[index].description,
                  style: const TextStyle(fontSize: 14, color: Colors.red),
                  overflow: TextOverflow.fade,
                ),
                trailing: Wrap(
                  children: [
                    FloatingActionButton(
                      heroTag: "edit$index",
                      onPressed: () => _editClothing(index, _clothes[index]),
                      mini: true,
                      backgroundColor: Colors.green,
                      child: const Icon(Icons.edit),
                    ),
                    FloatingActionButton(
                      heroTag: "delete$index",
                      onPressed: () => _removeClothingFromList(index),
                      mini: true,
                      backgroundColor: Colors.green,
                      child: const Icon(Icons.delete),
                    ),
                    FloatingActionButton(
                      heroTag: "add_shopping_cart$index",
                      onPressed: () => _addToShoppingCart(index),
                      mini: true,
                      backgroundColor: Colors.green,
                      child: const Icon(Icons.add_shopping_cart),
                    ),
                  ],
                ),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        heroTag: "add",
        onPressed: _addClothing,
        backgroundColor: Colors.green,
        child: const Icon(Icons.add),
      ),
    );
  }
}
