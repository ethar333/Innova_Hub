import 'package:flutter/material.dart';
import 'package:innovahub_app/Api_Categories/Api_Manager.dart';
import 'package:innovahub_app/Constants/Colors_Constant.dart';
import 'package:innovahub_app/Custom_Widgets/Stack_listCart.dart';
import 'package:innovahub_app/Custom_Widgets/category_card.dart';
import 'package:innovahub_app/Custom_Widgets/stack_list.dart';
import 'package:innovahub_app/Custom_Widgets/stack_listHandmade.dart';
import 'package:innovahub_app/Models/Category_response.dart';
import 'package:innovahub_app/Models/product_response.dart';

class TrainingPage extends StatelessWidget {
  //final CategoryModel categoryModel;

  const TrainingPage({
    super.key,
  });

  static const String routeName = 'page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Innova'),
      ),

      body: 
           // display categories:
        FutureBuilder<List<CategoryResponse>>(
        future: ApiManager.getAllCategories(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {

            return const Center(child: CircularProgressIndicator(
             color:Constant.mainColor,
            ));

          } else if (snapshot.hasError) {

            return Center(child: Text("Error: ${snapshot.error}"));

          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {

            return const Center(child: Text("No categories found"));
          }
 
          // server has data:
           List<CategoryResponse> categoryList = snapshot.data!;

            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: categoryList.take(3).map((category) {
                    return Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: CategoryCard(category: category),
                      ),
                    );
                  }).toList(),
                ),
                
                const SizedBox(height: 10),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: categoryList.skip(3).map((category) {
                    return Padding(
                      padding: const EdgeInsets.all(5),
                      child: CategoryCard(category: category)
                    );
                  }).toList(),
                ),
              ],
          );
        },
      ),

      
      
      
      
      
      /*FutureBuilder<CategoryModel>(
        future: ApiManager.getProducts(15), // loading data:

        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
                child: CircularProgressIndicator(
              color: Constant.mainColor,
            ));
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData) {
            return const Center(child: Text("No categories found"));
          }

          // server has data:

          var products = snapshot.data?.allProducts ?? []; // get all products;

          return Container(
            margin: const EdgeInsets.only(left: 15, right: 15),
          
            width: double.infinity,
            child: GridView.builder(
              itemCount: products.length,
              shrinkWrap: true, // يضمن أن الشبكة لا تأخذ مساحة غير ضرورية
              physics:
                  const NeverScrollableScrollPhysics(), // يجعل التمرير يتم فقط من خلال الشاشة الرئيسية
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // عدد الأعمدة في الشبكة = 2
                crossAxisSpacing: 10, // المسافة بين الأعمدة
                mainAxisSpacing: 15, // المسافة بين الصفوف
                childAspectRatio: 0.75, // ضبط نسبة العرض إلى الارتفاع
              ),
              itemBuilder: (context, index) {
                return stacklisthandmade(product: products[index]);
              },
            ),
          );
        },
      ),*/
    );
  }
}


/*
Container(
             margin: const EdgeInsets.only(left: 15,right: 15),
             height: 350,
             width: double.infinity,
             child: ListView.separated(
               itemCount: products.length,
               scrollDirection: Axis.horizontal,
               itemBuilder: (context, index) {

                 return stacklisthandmade(product: products[index],);

               },
               separatorBuilder: (BuildContext context, int index) {
                 return const SizedBox( width: 15, );

               },
             ),
          );
*/