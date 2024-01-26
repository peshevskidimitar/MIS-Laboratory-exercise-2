import 'package:eshop/models/clothing.dart';
import 'package:flutter/material.dart';

class EditClothing extends StatefulWidget {
  final int index;
  final Clothing clothing;
  final Function editClothing;

  const EditClothing(
      {super.key,
      required this.index,
      required this.clothing,
      required this.editClothing});

  @override
  State<EditClothing> createState() => _EditClothingState();
}

class _EditClothingState extends State<EditClothing> {
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _imageUrlController = TextEditingController();
  final _priceController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nameController.text = widget.clothing.name;
    _descriptionController.text = widget.clothing.description;
    _imageUrlController.text = widget.clothing.imageUrl;
    _priceController.text = widget.clothing.price.toStringAsFixed(2);
  }

  void _submitData() {
    String name = _nameController.text;
    String description = _descriptionController.text;
    String imageUrl = _imageUrlController.text;
    double price = double.parse(_priceController.text);

    final clothing =
        Clothing(widget.clothing.id, name, description, imageUrl, price);

    widget.editClothing(widget.index, clothing);
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
                    child: const Text("Edit")),
              ),
            ]),
          )
        ],
      ),
    );
  }
}
