
/*import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:innovahub_app/Api/Api_Manager_services_product.dart';

class ProductScreen extends StatefulWidget {

  static const routeName = 'product_screen';         // route name of this screen:
  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final _productNameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _priceController = TextEditingController();
  final _discountController = TextEditingController();
  final _weightController = TextEditingController();
  final _dimensionsController = TextEditingController();
  final _stockController = TextEditingController();

  String? _selectedCategoryId;
  List<String> _selectedSizes = [];
  List<String> _selectedColors = [];
  File? _homePicture;
  List<File> _productPictures = [];

  Future<void> _pickImage(bool isHomePicture) async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        if (isHomePicture) {
          _homePicture = File(pickedFile.path);
        } else {
          _productPictures.add(File(pickedFile.path));
        }
      });
    }
  }

  Future<void> _publishProduct() async {
      // Debugging: طباعة القيم للتحقق منها
  print("Product Name: ${_productNameController.text.trim()}");
  print("Description: ${_descriptionController.text.trim()}");
  print("Price: ${_priceController.text.trim()}");
  print("Stock: ${_stockController.text.trim()}");
  print("Discount: ${_discountController.text.trim()}");
  print("Weight: ${_weightController.text.trim()}");
  print("Dimensions: ${_dimensionsController.text.trim()}");
  print("Category ID: $_selectedCategoryId");
  print("Home Picture: $_homePicture");

    if (_productNameController.text.trim().isEmpty ||
        _descriptionController.text.trim().isEmpty ||
        _priceController.text.trim().isEmpty ||
        _stockController.text.trim().isEmpty ||
        _discountController.text.trim().isEmpty ||
        _weightController.text.trim().isEmpty ||
        _dimensionsController.text.trim().isEmpty ||
        _selectedCategoryId == null || _homePicture == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("❌ Please fill all fields and add a home picture.")),
      );
      return;
    }

    await ApiService.add

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("✅ Product added successfully!")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Product")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(controller: _productNameController, decoration: InputDecoration(labelText: "Product Name")),
              TextField(controller: _descriptionController, decoration: InputDecoration(labelText: "Description")),
              TextField(controller: _priceController, decoration: InputDecoration(labelText: "Price")),
              TextField(controller: _discountController, decoration: InputDecoration(labelText: "Discount")),
              TextField(controller: _weightController, decoration: InputDecoration(labelText: "Weight (Kg)")),
              TextField(controller: _dimensionsController, decoration: InputDecoration(labelText: "Dimensions (L×W×H)")),
              TextField(controller: _stockController, decoration: InputDecoration(labelText: "Stock")),
              SizedBox(height: 20),
              Text("Select Home Picture"),
              GestureDetector(
                onTap: () => _pickImage(true),
                child: Container(
                  height: 150,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                  ),
                  child: _homePicture != null
                      ? Image.file(_homePicture!, fit:BoxFit.cover)
                      : Icon(Icons.add_a_photo, size: 50),
                ),
              ),
              SizedBox(height: 20),
              Text("Select Other Pictures"),
              Wrap(
                spacing: 10,
                children: _productPictures.map((file) {
                  return Stack(
                    children: [
                      Image.file(file, width: 100, height: 100, fit: BoxFit.cover),
                      Positioned(
                        top: 5,
                        right: 5,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _productPictures.remove(file);
                            });
                          },
                          child: Icon(Icons.cancel, color: Colors.red),
                        ),
                      ),
                    ],
                  );
                }).toList(),
              ),
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () => _pickImage(false),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _publishProduct,
                child: Text("Publish Product"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}*/

