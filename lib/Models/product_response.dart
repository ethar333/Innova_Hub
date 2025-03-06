
 // Model:(products):

  class CategoryModel{
   
     // attributes:
    String categoryName;
    String categoryDescription;
    List<ProductResponse> allProducts;

    // constructor:
    CategoryModel({required this.categoryName,required this.categoryDescription,required this.allProducts});

   // from json:
   factory CategoryModel.fromJson(Map<String, dynamic> json){

    return CategoryModel(
      categoryName: json['CategoryName'],
      categoryDescription: json['CategoryDescription'],
      allProducts: json['AllProductsOnspecificCategories'] != null
       ? List<ProductResponse>.from(json["AllProductsOnspecificCategories"].map((x) => ProductResponse.fromJson(x)))
       : [],
          
    );
   }
   
   // to json:
   Map<String, dynamic> toJson(){

    return{

      'CategoryName' : categoryName,
      'CategoryDescription' : categoryDescription,
      'AllProductsOnspecificCategories' : allProducts.map((e) => e.toJson()).toList(),
    };
   }
   @override
  String toString() {
    return 'CategoryModel{categoryName: $categoryName, categoryDescription: $categoryDescription, allProducts: $allProducts}';

  }
  }

  

class ProductResponse{
  
  // attributes of each product:
  String name;
  String description;
  String authorName;
  String productImage;
  List<String> productImages;
  double price;
  bool isAvailable;
  int stock;

   // constructor:
   ProductResponse({required this.name,
   required this.description,
   required this.authorName,
   required this.productImage,
   required this.productImages,
   required this.price,
   required this.isAvailable,
   required this.stock,
   });

  // factory constructor:(from json):
  factory ProductResponse.fromJson(Map<String, dynamic> json){

    return ProductResponse(
      name: json['ProductName'],
      description: json['ProductDescription'],
      authorName: json['AuthorName'],
      productImage: json['HomePicture'],
      productImages: List<String>.from(json['ProductPictures']),
      price: json['ProductPrice'].toDouble(),
      isAvailable: json['IsAvailable'],
      stock: json['Stock'],
    );
  }
 
 // to json:
   Map<String, dynamic> toJson(){

     return{
      'ProductName' : name,
      'ProductDescription' : description,
      'AuthorName' : authorName,
      'HomePicture' : productImage,
      'ProductPictures' : productImages,
      'ProductPrice' : price,
      'IsAvailable' : isAvailable,
      'Stock' : stock,

      };
   }

}

