

/*import 'package:flutter/material.dart';
import 'package:multiselect/multiselect.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  static const String routeName = 'owner_product';

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 15,
      ),
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
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(5)),
                  height: 30,
                  width: 230,
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
                        color: Colors.grey, //
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.grey.shade600,
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
                        color: Colors.grey, //
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.grey.shade600,
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
              Container(
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 199, 197, 197),
                      borderRadius: BorderRadius.circular(5)),
                  width: 100,
                  child: Center(
                    child: Text(
                      "Choose File",
                      style: TextStyle(fontSize: 15),
                      ),
                  )),
              Text("No choose File",
                  style: TextStyle(fontSize: 16, color: Colors.black)),
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
              Container(
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 199, 197, 197),
                      borderRadius: BorderRadius.circular(5)),
                  width: 100,
                  child: Center(
                    child: Text(
                      "Choose File",
                      style: TextStyle(fontSize: 15),
                    ),
                  )),
              Text("No choose File",
                  style: TextStyle(fontSize: 16, color: Colors.black)),
            ],
          ),
          SizedBox(
            height: 40,
          ),
          Container(
              height: 30,
              width: 150,
              decoration: BoxDecoration(
                  color: Colors.green, borderRadius: BorderRadius.circular(5)),
              child: Center(
                child: Text(
                  "Publish Product",
                  style: TextStyle(color: Colors.white),
                ),
              ))
        ],
      ),
    ));
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
        fillColor: Colors.grey,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: Colors.grey),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: Colors.grey, width: 2),
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
          padding: EdgeInsets.only(left: 60),
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
