import 'package:flutter/material.dart';
import 'package:innovahub_app/Custom_Widgets/shipping%20_address_container.dart';
import 'package:innovahub_app/Products/checkout_address.dart';
import 'package:innovahub_app/core/Constants/Colors_Constant.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  static const String routeName = 'payment_page'; // route name:

  @override
  State<PaymentPage> createState() => _BuyPageState();
}

class _BuyPageState extends State<PaymentPage> {
  String? _selectedMethod;
  int select = 0;
  int quantity = 1;
  final List<Map<String, String>> deliveryMethods = [
    {
      'method': 'Cash on Delivery',
      'duration': '(1 to 3 days)',
      'price': '',
    },
    {
      'method': 'Standard Shipping',
      'duration': '(1 to 5 days)',
      'price': '\$10',
    },
    {
      'method': 'Express Shipping',
      'duration': '(1 to 12 days)',
      'price': '\$50',
    },
    {
      'method': 'Free Shipping',
      'duration': '(1 to 2 weeks)',
      'price': '\$0',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constant.white3Color,
      appBar: AppBar(
        //shadowColor: Constant.whiteColor,
        backgroundColor: Constant.whiteColor,
        elevation: 0,
        title: const Text(
          'Innova',
          style: TextStyle(
              color: Constant.blackColorDark,
              fontSize: 24,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: CircleAvatar(
              radius: 24,
              backgroundImage: AssetImage('assets/images/image-13.png'),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(canvasColor: Colors.white),
        child: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_filled,
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite_border_outlined,
              ),
              label: "Wishlist",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_cart_outlined,
              ),
              label: "Cart",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.search_outlined,
              ),
              label: "Search",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person_outline,
              ),
              label: "Profile",
            ),
          ],
          currentIndex: select,
          onTap: (index) {
            select = index;
            setState(() {});
          },
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.black,
          selectedLabelStyle: const TextStyle(
            fontSize: 16,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            InkWell(
                onTap: () {
                  Navigator.pushNamed(context, CheckoutAddress.routeName);
                },
                child: const ShippingAddressContainer()),
            const SizedBox(height: 15),
            Container(
              height: 250,
              // width: double.infinity,
              margin:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(color: Colors.grey.shade300, blurRadius: 4)
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            //color: Colors.grey,
                            borderRadius: BorderRadius.circular(12),
                            image: const DecorationImage(
                              image: AssetImage('assets/images/owner.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Text("Owner Name",
                            style: TextStyle(
                                color: Constant.blackColorDark,
                                fontSize: 15,
                                fontWeight: FontWeight.w500)),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Divider(
                      color: Constant.greyColor2,
                      thickness: 1.5,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            'assets/images/Necklace3.png',
                            height: 110,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 13),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                    'Lapis Set, Necklace, ring, earrings lightweight',
                                    style: TextStyle(
                                        color: Constant.blackColorDark,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500)),
                                const SizedBox(height: 14),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text('\$28.00',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black87)),
                                    const SizedBox(
                                        width: 4), // إضافة مسافة قبل الأيقونة
                                    Container(
                                      height: 40,
                                      decoration: BoxDecoration(
                                        color: Constant.whiteColor,
                                        border: Border.all(
                                          color: Constant.greyColor2,
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Row(
                                        children: [
                                          IconButton(
                                              icon: const Icon(
                                                Icons.remove,
                                                color: Constant.mainColor,
                                                size: 25,
                                              ),
                                              onPressed: () {}),
                                          Text('$quantity',
                                              style: const TextStyle(
                                                fontSize: 20,
                                                color: Constant.mainColor,
                                              )),
                                          IconButton(
                                            icon: const Icon(
                                              Icons.add,
                                              color: Constant.mainColor,
                                              size: 25,
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                quantity++;
                                              });
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                        width: 3), // إضافة مسافة قبل الأيقونة
                                    /* Expanded(
                                      child: Container(
                                        height: 40,
                                        width: 50,
                                        decoration: BoxDecoration(
                                          color: Constant.whiteColor,
                                          border: Border.all(
                                            color: Constant.greyColor2,
                                          ),
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        child: IconButton(
                                          icon: const FaIcon(
                                              FontAwesomeIcons.trash,
                                              color: Constant.redColor),
                                          onPressed: () {
                                            setState(() {
                                              quantity = 0;
                                            });
                                          },
                                        ),
                                      ),
                                    ),*/
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 265,
              width: double.infinity,
              margin:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(color: Colors.grey.shade300, blurRadius: 4)
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 10, top: 10),
                    child: Text(
                      'Delivery Methods',
                      style: TextStyle(
                          color: Constant.blackColorDark,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ...deliveryMethods.map((method) {
                    return CustomRadioOption(
                      method: method['method']!,
                      duration: method['duration']!,
                      price: method['price']!,
                    );
                  }).toList(),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              height: 230,
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Constant.whiteColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Additional Information',
                      style: TextStyle(
                          color: Constant.blackColorDark,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox( height: 10,),
                    Container(
                      height: 140,
                      width: double.infinity,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Constant.whiteColor,
                        borderRadius: BorderRadius.circular(20),
                        border:Border.all(color: Constant.greyColor4),
                      ),
                      child: const Text(
                        "Add your comment...",
                        style:  TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Constant.greyColor4,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20,),

            /* const Spacer(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {},
        
                style: ElevatedButton.styleFrom(
                  backgroundColor: Constant.mainColor,
                  shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.circular(15)),
                   minimumSize: const Size(220, 50),
                ),
                child: const Text('Buy Now ',
                style: TextStyle(fontSize: 18, color: Constant.whiteColor)),
              ),
            ),*/
          ],
        ),
      ),
    );
  }

  Widget CustomRadioOption({
    required String method,
    required String duration,
    required String price,
  }) {
    return InkWell(
      onTap: () {
        setState(() {
          _selectedMethod = method;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 8),
        child: Row(
          children: [
            Radio<String>(
              value: method,
              groupValue: _selectedMethod,
              activeColor: Constant.mainColor,
              onChanged: (String? value) {
                setState(() {
                  _selectedMethod = value;
                });
              },
            ),
            Text(
              '$method $duration',
              style: const TextStyle(
                  color: Constant.blackColorDark,
                  fontSize: 16,
                  fontWeight: FontWeight.w400),
            ),
            Text(
              price,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
