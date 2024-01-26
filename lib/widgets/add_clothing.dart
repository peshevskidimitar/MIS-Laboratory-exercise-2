import 'dart:math';

import 'package:eshop/models/clothing.dart';
import 'package:flutter/material.dart';

class AddClothing extends StatefulWidget {
  final Function addClothing;

  const AddClothing({super.key, required this.addClothing});

  @override
  State<AddClothing> createState() => _AddClothingState();
}

class _AddClothingState extends State<AddClothing> {
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _imageUrlController = TextEditingController();
  final _priceController = TextEditingController();

  void _submitData() {
    String name = _nameController.text;
    String description = _descriptionController.text;
    String imageUrl = _imageUrlController.text;
    double price = double.parse(_priceController.text);

    final clothing =
        Clothing(Random().nextInt(100), name, description, imageUrl, price);

    widget.addClothing(clothing);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: "Name"),
              onSubmitted: (_) => _submitData),
          TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(labelText: "Description"),
              onSubmitted: (_) => _submitData),
          TextField(
              controller: _imageUrlController,
              decoration: const InputDecoration(labelText: "Image URL"),
              onSubmitted: (_) => _submitData),
          TextField(
              controller: _priceController,
              decoration: const InputDecoration(labelText: "Price"),
              onSubmitted: (_) => _submitData,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true)),
          Container(
            padding: const EdgeInsets.all(10.0),
            child: Row(children: [
              Expanded(
                child: ElevatedButton(
                    onPressed: _submitData,
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.green),
                    child: const Text("Add")),
              ),
            ]),
          )
        ],
      ),
    );
  }
}
