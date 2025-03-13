

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  static const String baseUrl = "https://innova-hub.premiumasp.net/api";

  static Future<void> addproduct({
  required String productName,
  required String homePicture,
  required List<String> pictures,
  required String description,
  required int price,
  required int discount,
  required int categoryId,
  required int stock,
  required String dimensions,
  required int weight,
  required List<String> sizeNames,
  required List<String> colorNames,
}) async {
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

    request.fields['ProductName'] = productName;
    request.fields['Description'] = description;
    request.fields['Price'] = price.toString();
    request.fields['Discount'] = discount.toString();
    request.fields['CategoryId'] = categoryId.toString();
    request.fields['Stock'] = stock.toString();
    request.fields['Dimensions'] = dimensions;
    request.fields['Weight'] = weight.toString();

    request.fields['SizeNames'] = sizeNames.join(',');
    request.fields['ColorNames'] = colorNames.join(',');

    request.files
        .add(await http.MultipartFile.fromPath('HomePicture', homePicture));

    // إضافة الصور الأخرى
    for (String picture in pictures) {
      request.files.add(await http.MultipartFile.fromPath('Pictures', picture));
    }

    var response = await request.send();

    var responseBody = await response.stream.bytesToString();
    var decodedResponse = jsonDecode(responseBody);

    if (response.statusCode == 200 || response.statusCode == 201) {
      print("Product added successfully: ${decodedResponse['Message']}");
    } else {
      print("Error adding product: ${decodedResponse['Message']}");
    }
  } catch (e) {
    print("Exception: $e");
  }
}
}

