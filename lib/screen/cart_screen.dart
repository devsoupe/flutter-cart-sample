import 'package:flutter/material.dart';

import '../component/add_more.dart';
import '../component/billing.dart';
import '../component/menu.dart';
import '../component/order.dart';
import '../component/store_name.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(246, 246, 246, 1.0),
      appBar: AppBar(
        leading: const BackButton(
          color: Colors.black,
        ),
        title: const Text(
          '장바구니',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 10,
          ),
          StoreName(),
          SizedBox(
            height: 1,
          ),
          Menu(),
          SizedBox(
            height: 1,
          ),
          AddMore(),
          Billing(),
        ],
      ),
      bottomNavigationBar: Order(),
    );
  }
}
