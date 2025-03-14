// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:multiselect/multiselect.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:innovahub_app/core/Constants/Colors_Constant.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  static const String routeName = 'owner_product';

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController productNameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController discountController = TextEditingController();
  TextEditingController categoryIdController = TextEditingController();
  TextEditingController stockController = TextEditingController();
  TextEditingController dimensionsController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController sizeNamesController = TextEditingController();
  TextEditingController colorNamesController = TextEditingController();
  File? _image1;
  File? _image2;
  File? _image3;
  final _formKey = GlobalKey<FormState>();

  File? homePicture;
  List<File> pictures = [];
  Set<String> selectedColors = {};

  final picker = ImagePicker();

  Future<void> pickHomePicture() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        homePicture = File(pickedFile.path);
      });
    }
  }

  // اختيار صور إضافية
  Future<void> pickPictures() async {
    final pickedFiles = await picker.pickMultiImage();
    if (pickedFiles.isNotEmpty) {
      setState(() {
        pictures = pickedFiles.map((file) => File(file.path)).toList();
      });
    }
  }

  Future<void> _pickImage(int imageNumber) async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        if (imageNumber == 1) {
          _image1 = File(pickedFile.path);
        } else if (imageNumber == 2) {
          _image2 = File(pickedFile.path);
        } else if (imageNumber == 3) {
          _image3 = File(pickedFile.path);
        }
      });
    }
  }

  Future<void> addProduct() async {
    if (!_formKey.currentState!.validate() || homePicture == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content:
                Text("Please fill all required fields and select images.")),
      );
      return;
    }

    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString("token");

      if (token == null) {
        throw Exception("User is not authenticated!");
      }

      var request = http.MultipartRequest(
        'POST',
        Uri.parse("https://innova-hub.premiumasp.net/api/Product"),
      );

      request.headers.addAll({
        'Authorization': 'Bearer $token',
        'Content-Type': 'multipart/form-data',
      });

      request.fields['ProductName'] = productNameController.text;
      request.fields['Description'] = descriptionController.text;
      request.fields['Price'] = priceController.text;
      request.fields['Discount'] = discountController.text;
      request.fields['CategoryId'] = categoryIdController.text;
      request.fields['Stock'] = stockController.text;
      request.fields['Dimensions'] = dimensionsController.text;
      request.fields['Weight'] = weightController.text;
      request.fields['SizeNames'] = sizeNamesController.text;
      request.fields['ColorNames'] = colorNamesController.text;

      request.files.add(
          await http.MultipartFile.fromPath('HomePicture', homePicture!.path));

      for (var picture in pictures) {
        request.files
            .add(await http.MultipartFile.fromPath('Pictures', picture.path));
      }

      var response = await request.send();
      var responseBody = await response.stream.bytesToString();
      var decodedResponse = jsonDecode(responseBody);

      if (response.statusCode == 200 || response.statusCode == 201) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Product added successfully!")),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Error: ${decodedResponse['Message']}")),
        );
      }
    } catch (e) {
      print("Exception: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Exception: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            "Publish Your Product",
            style: TextStyle(fontSize: 18.sp),
          ),
          actions: [
            Icon(
              Icons.close,
              color: Colors.red,
              size: 25.r,
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
          ).r,
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Product Name : ",
                        style: TextStyle(fontSize: 16.sp, color: Colors.teal),
                      ),
                      SizedBox(
                          width: 230.r,
                          height: 30.r,
                          child: const CustomTextField())
                    ],
                  ),
                  SizedBox(
                    height: 20.r,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Product Category : ",
                        style: TextStyle(fontSize: 16, color: Colors.teal),
                      ),
                      Container(
                          decoration: BoxDecoration(
                              color: Constant.white4Color,
                              borderRadius: BorderRadius.circular(5)),
                          height: 50.r,
                          width: 200.r,
                          child: dropdownmenueforcatregory(
                            categoryIdController: categoryIdController,
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 20.r,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Description : ",
                        style: TextStyle(fontSize: 16, color: Colors.teal),
                      ),
                      SizedBox(
                          width: 230.r,
                          height: 100.r,
                          child: const CustomTextField(
                            maxLines: 5,
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 10.r,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Price : ",
                            style:
                                TextStyle(fontSize: 16.sp, color: Colors.teal),
                          ),
                          SizedBox(
                            height: 5.r,
                          ),
                          SizedBox(
                              width: 170.r,
                              height: 30.r,
                              child: const CustomTextField())
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Discount : ",
                            style:
                                TextStyle(fontSize: 16.sp, color: Colors.teal),
                          ),
                          SizedBox(
                            height: 5.r,
                          ),
                          SizedBox(
                              width: 170.r,
                              height: 30.r,
                              child: const CustomTextField())
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 15.r,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Wight (Kg): ",
                            style:
                                TextStyle(fontSize: 16.sp, color: Colors.teal),
                          ),
                          SizedBox(
                            height: 5.r,
                          ),
                          SizedBox(
                              width: 170.r,
                              height: 30.r,
                              child: const CustomTextField())
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Dimentions(L×W×H) : ",
                            style:
                                TextStyle(fontSize: 16.sp, color: Colors.teal),
                          ),
                          SizedBox(
                            height: 5.r,
                          ),
                          SizedBox(
                              width: 170.r,
                              height: 30.r,
                              child: const CustomTextField())
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10.r,
                  ),
                  Row(
                    children: [
                      Text(
                        "Availability",
                        style: TextStyle(fontSize: 16.sp, color: Colors.black),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15.r,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Color : ",
                            style:
                                TextStyle(fontSize: 16.sp, color: Colors.teal),
                          ),
                          SizedBox(
                            height: 5.r,
                          ),
                          Container(
                              decoration: BoxDecoration(
                                color: Constant.white4Color, //
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Constant.white4Color,
                                ),
                              ),
                              height: 40.r,
                              width: 170.r,
                              child: DropdownMenuForcolor(
                                selectedColors: selectedColors,
                              ))
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Size : ",
                            style:
                                TextStyle(fontSize: 16.sp, color: Colors.teal),
                          ),
                          SizedBox(
                            height: 5.r,
                          ),
                          Container(
                              decoration: BoxDecoration(
                                color: Constant.white4Color, //
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Constant.white4Color,
                                ),
                              ),
                              height: 40.r,
                              width: 170.r,
                              child: const DropdownMenuForsize())
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 15.r,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Stock Availability : ",
                        style: TextStyle(fontSize: 16.sp, color: Colors.teal),
                      ),
                      Expanded(
                          child: SizedBox(
                              height: 30.r, child: const CustomTextField()))
                    ],
                  ),
                  SizedBox(
                    height: 20.r,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("Home Picture",
                          style:
                              TextStyle(fontSize: 16.sp, color: Colors.teal)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildImagePicker(1, _image1, isLarge: true),
                          const SizedBox(width: 20),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text("Other Picture",
                            style: TextStyle(fontSize: 16, color: Colors.teal)),
                        Column(
                          children: [
                            _buildImagePicker(2, _image2),
                            const SizedBox(height: 15),
                            _buildImagePicker(3, _image3),
                          ],
                        ),
                      ]),
                  const SizedBox(
                    height: 40,
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        addProduct();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Constant.green2Color,
                        minimumSize: const Size(double.infinity, 50),
                      ),
                      child: const Text(
                        'Publish Deal',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  Widget _buildImagePicker(int imageNumber, File? image,
      {bool isLarge = false}) {
    return GestureDetector(
      onTap: () => _pickImage(imageNumber),
      child: Container(
        clipBehavior: Clip.antiAlias,
        width: isLarge ? 200 : 130,
        height: isLarge ? 270 : 130,
        decoration: BoxDecoration(
            color: Constant.white4Color,
            borderRadius: BorderRadius.circular(15)),
        child: image != null
            ? Image.file(image, fit: BoxFit.cover)
            : Icon(Icons.file_upload, size: isLarge ? 30 : 20),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final int maxLines;

  const CustomTextField({super.key, this.maxLines = 1});
  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(color: Colors.black),
      maxLines: maxLines,
      decoration: InputDecoration(
        filled: true,
        fillColor: Constant.white4Color,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: Constant.white4Color),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: Constant.white4Color),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: Constant.white4Color, width: 2),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      ),
    );
  }
}

class dropdownmenueforcatregory extends StatefulWidget {
  final TextEditingController categoryIdController;
  const dropdownmenueforcatregory(
      {super.key, required this.categoryIdController});

  @override
  State<dropdownmenueforcatregory> createState() =>
      _dropdownmenueforcatregoryState();
}

class _dropdownmenueforcatregoryState extends State<dropdownmenueforcatregory> {
  String? dropdownvalue;

  final List<Map<String, dynamic>> categories = [
    {"CategoryId": 1, "CategoryName": "Carpets"},
    {"CategoryId": 2, "CategoryName": "Home"},
    {"CategoryId": 3, "CategoryName": "Bags"},
    {"CategoryId": 4, "CategoryName": "Jewelry"},
    {"CategoryId": 5, "CategoryName": "Art"},
    {"CategoryId": 6, "CategoryName": "Men"},
    {"CategoryId": 7, "CategoryName": "Watches"},
    {"CategoryId": 8, "CategoryName": "Drawing"},
    {"CategoryId": 9, "CategoryName": "Necklace"},
    {"CategoryId": 10, "CategoryName": "Wood Crafting"},
    {"CategoryId": 11, "CategoryName": "Toys"},
    {"CategoryId": 12, "CategoryName": "Carpets"},
    {"CategoryId": 13, "CategoryName": "Rings"},
    {"CategoryId": 14, "CategoryName": "Furniture"},
    {"CategoryId": 15, "CategoryName": "Laptops"},
  ];
  String? selectedCategoryName;
  int? selectedCategoryId;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: 'Select Category',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      ),
      value: selectedCategoryName,
      items: categories.map((category) {
        return DropdownMenuItem<String>(
          value: category['CategoryName'],
          child: Text(category['CategoryName']),
        );
      }).toList(),
      onChanged: (String? newValue) {
        setState(() {
          selectedCategoryName = newValue;
          selectedCategoryId = categories.firstWhere(
            (category) => category['CategoryName'] == newValue,
          )['CategoryId'];

          // تحديث قيمة الـ Controller بالـ CategoryId
          widget.categoryIdController.text = selectedCategoryId.toString();
        });
      },
    );
  }
}

class DropdownMenuForcolor extends StatefulWidget {
  Set<String> selectedColors;
  DropdownMenuForcolor({
    Key? key,
    required this.selectedColors,
  }) : super(key: key);

  @override
  State<DropdownMenuForcolor> createState() => _DropdownMenuForcolorState();
}

class _DropdownMenuForcolorState extends State<DropdownMenuForcolor> {
  final List<String> colorOptions = [
    "Red",
    "Green",
    "Yellow",
    "Blue",
    "Black",
    "White"
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: DropDownMultiSelect(
            options: colorOptions,
            selectedValues: widget.selectedColors.toList(),
            whenEmpty: widget.selectedColors.isEmpty
                ? ""
                : widget.selectedColors.join(" | "),
            onChanged: (List<String> values) {
              setState(() {
                widget.selectedColors = values.toSet();
              });
            },
            decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            ),
          ),
        ),
      ],
    );
  }
}

class DropdownMenuForsize extends StatefulWidget {
  const DropdownMenuForsize({super.key});

  @override
  State<DropdownMenuForsize> createState() => _DropdownMenuForsizeState();
}

class _DropdownMenuForsizeState extends State<DropdownMenuForsize> {
  List<String> selectedColors = [];

  final List<String> colorOptions = [
    "-",
    "S",
    "M",
    "L",
    "XL",
    "XXL",
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: DropDownMultiSelect(
            // selectedValuesStyle: TextStyle(  color: Colors.black, ),
            options: colorOptions,
            selectedValues: selectedColors,
            whenEmpty: '', //
            // separator: " | ", // ✅
            onChanged: (List<String> values) {
              setState(() {
                selectedColors = values;
              });
            },
            decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            ),
          ),
        ),
      ],
    );
  }
}





/*import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:innovahub_app/Api/Api_Manager_services_product.dart';
import 'package:innovahub_app/core/Constants/Colors_Constant.dart';
import 'package:multiselect/multiselect.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  static const String routeName = 'owner_product';

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 File? _image1;
  File? _image2;
  File? _image3;
  final _formKey =GlobalKey<FormState>();
  String productName = "";
  String description = "";
  int price = 0;
  int discount = 0;
  int categoryId = 17;
  int stock = 1;
  String dimensions = "";
  int weight = 0;
  List<String> selectedSizes = [];
  List<String> selectedColors = [];

  File? homePicture;
  List<File> pictures = [];

  final picker = ImagePicker();

  Future<void> pickHomePicture() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        homePicture = File(pickedFile.path);
      });
    }
  }

  // اختيار صور إضافية
  Future<void> pickPictures() async {
    final pickedFiles = await picker.pickMultiImage();
    if (pickedFiles.isNotEmpty) {
      setState(() {
        pictures = pickedFiles.map((file) => File(file.path)).toList();
      });
    }
  }

  Future<void> saveProduct() async {
    
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      if (homePicture == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Please select a home picture")),
        );
        return;
      }

      try {
        await ApiService.addProduct(
          productName: productName,
          homePicture: homePicture!.path,
          pictures: pictures.map((file) => file.path).toList(),
          description: description,
          price: price,
          discount: discount,
          categoryId: categoryId,
          stock: stock,
          dimensions: dimensions,
          weight: weight,
          sizeNames: selectedSizes,
          colorNames: selectedColors,
        );

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Product added successfully!")),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Error: $e")),
        );
      }
    }
  }


   Future<void> _pickImage(int imageNumber) async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        if (imageNumber == 1) {
          _image1 = File(pickedFile.path);
        } else if (imageNumber == 2) {
          _image2 = File(pickedFile.path);
        } else if (imageNumber == 3) {
          _image3 = File(pickedFile.path);
        }
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(right: 15),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Publish Your Product",
                  style: TextStyle(fontSize: 18),
                ),
                Icon(
                  Icons.close,
                  color: Colors.red,
                  size: 25,
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Product Name : ",
                  style: TextStyle(fontSize: 16, color: Colors.teal),
                ),
                Container(width: 230, height: 30, child: CustomTextField())
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Product Category : ",
                  style: TextStyle(fontSize: 16, color: Colors.teal),
                ),
                Container(
                    decoration: BoxDecoration(
                        color: Constant.white4Color,
                        borderRadius: BorderRadius.circular(5)),
                    height: 30,
                    width: 200,
                    child: dropdownmenueforcatregory())
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Description : ",
                  style: TextStyle(fontSize: 16, color: Colors.teal),
                ),
                Container(
                    width: 230,
                    height: 100,
                    child: CustomTextField(
                      maxLines: 5,
                    ))
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Price : ",
                      style: TextStyle(fontSize: 16, color: Colors.teal),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(width: 170, height: 30, child: CustomTextField())
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Discount : ",
                      style: TextStyle(fontSize: 16, color: Colors.teal),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(width: 170, height: 30, child: CustomTextField())
                  ],
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment:CrossAxisAlignment.start,
                   children: [
                    Text(
                      "Wight (Kg): ",
                      style: TextStyle(fontSize: 16, color: Colors.teal),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(width: 170, height: 30, child: CustomTextField())
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Dimentions(L×W×H) : ",
                      style: TextStyle(fontSize: 16, color: Colors.teal),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(width: 170, height: 30, child: CustomTextField())
                  ],
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  "Availability",
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Color : ",
                      style: TextStyle(fontSize: 16, color: Colors.teal),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                        decoration: BoxDecoration(
                          color: Constant.white4Color, //
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Constant.white4Color.shade600,
                          ),
                        ),
                        height: 40,
                        width: 170,
                        child: DropdownMenuForcolor())
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Size : ",
                      style: TextStyle(fontSize: 16, color: Colors.teal),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                        decoration: BoxDecoration(
                          color: Constant.white4Color, //
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Constant.white4Color.shade600,
                          ),
                        ),
                        height: 40,
                        width: 170,
                        child: DropdownMenuForsize())
                  ],
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Stock Availability : ",
                  style: TextStyle(fontSize: 16, color: Colors.teal),
                ),
                Container(width: 240, height: 30, child: CustomTextField())
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Home Picture",
                    style: TextStyle(fontSize: 16, color: Colors.teal)),
               
                      
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildImagePicker(1, _image1, isLarge: true),
                      const SizedBox(width: 20),
                       
                    ],
                  ),
                   
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Other Picture",
                    style: TextStyle(fontSize: 16, color: Colors.teal)),
                     Column(
                        children: [
                          _buildImagePicker(2, _image2),
                          const SizedBox(height: 15),
                          _buildImagePicker(3, _image3),
                        ],
                      ),
              ]
            ),
            SizedBox(
              height: 40,
            ),
             Center(
                  child: ElevatedButton(
                    onPressed: () {
                      saveProduct();      // call Function to publish deal:

                    },

                    style: ElevatedButton.styleFrom(
                      backgroundColor: Constant.green2Color,
                      minimumSize: const Size(double.infinity, 50),
                    ),
                    child: const Text(
                      'Publish Deal',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
                
                SizedBox(height: 20,),
          ],
        ),
      ),
    ));
  }
   Widget _buildImagePicker(int imageNumber, File? image, {bool isLarge = false}) {
    return GestureDetector(
      onTap: () => _pickImage(imageNumber),
      child: Container(
        clipBehavior: Clip.antiAlias,
        width: isLarge ? 200 : 130,
        height: isLarge ? 270 : 130,
        decoration: BoxDecoration(
          color: Constant.white4Color,
          borderRadius: BorderRadius.circular(15)
        ),
        child: image != null
         ? Image.file(image, fit: BoxFit.cover)
         : Icon(Icons.file_upload, size: isLarge ? 30 : 20),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final int maxLines;

  const CustomTextField({super.key, this.maxLines = 1});
  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(color: Colors.black),
      maxLines: maxLines,
      decoration: InputDecoration(
        filled: true,
        fillColor: Constant.white4Color,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: Constant.white4Color),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: Constant.white4Color),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: Constant.white4Color, width: 2),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      ),
    );
  }
}

class dropdownmenueforcatregory extends StatefulWidget {
  const dropdownmenueforcatregory({super.key});

  @override
  State<dropdownmenueforcatregory> createState() =>
   _dropdownmenueforcatregoryState();
}

class _dropdownmenueforcatregoryState extends State<dropdownmenueforcatregory> {
  String? dropdownvalue;

  var items = [
    'Handcraft Carpets',
    'Necklaces',
    'Rings',
  ];
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value: dropdownvalue,
      icon: Padding(
          padding: EdgeInsets.only(left: 20),
          child: Icon(Icons.keyboard_arrow_down, color: Colors.black)),
      items: items.map((String items) {
        return DropdownMenuItem(
          value: items,
          child: Padding(padding: EdgeInsets.only(left: 5), child: Text(items)),
        );
      }).toList(),
      onChanged: (String? newValue) {
        setState(() {
          dropdownvalue = newValue!;
        });
      },
    );
  }
}

class DropdownMenuForcolor extends StatefulWidget {
  const DropdownMenuForcolor({super.key});

  @override
  State<DropdownMenuForcolor> createState() => _DropdownMenuForcolorState();
}

class _DropdownMenuForcolorState extends State<DropdownMenuForcolor> {
  List<String> selectedColors = [];

  final List<String> colorOptions = [
    "Red",
    "Green",
    "Yellow",
    "Blue",
    "Black",
    "White"
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: DropDownMultiSelect(
            //selectedValuesStyle: TextStyle(color: Colors.black),
            options: colorOptions,
            selectedValues: selectedColors,
            whenEmpty: selectedColors.isEmpty
                ? ""
                : selectedColors.join(" | "),
            //separator: " | ",
            onChanged: (List<String> values) {
              setState(() {
                selectedColors = values;
              });
            },
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            ),
          ),
        ),
      ],
    );
  }
}

class DropdownMenuForsize extends StatefulWidget {
  const DropdownMenuForsize({super.key});

  @override
  State<DropdownMenuForsize> createState() => _DropdownMenuForsizeState();
}

class _DropdownMenuForsizeState extends State<DropdownMenuForsize> {
  List<String> selectedColors = [];

  final List<String> colorOptions = [
    "S",
    "M",
    "L",
    "XL",
    "XXL",
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: DropDownMultiSelect(
           // selectedValuesStyle: TextStyle(  color: Colors.black, ),
            options: colorOptions,
            selectedValues: selectedColors,
            whenEmpty: '', //
           // separator: " | ", // ✅
            onChanged: (List<String> values) {
              setState(() {
                selectedColors = values;
              });
            },
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            ),
          ),
        ),
      ],
    );
  }
 
}*/


