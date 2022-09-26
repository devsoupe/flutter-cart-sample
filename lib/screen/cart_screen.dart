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
  int _counter = 1;

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Count(
      value: _counter,
      child: Scaffold(
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
            Menu(
              decrementCallback: _decrementCounter,
              incrementCallback: _incrementCounter,
            ),
            SizedBox(
              height: 1,
            ),
            AddMore(),
            Billing(),
          ],
        ),
        bottomNavigationBar: Order(),
      ),
    );
  }
}

class Count extends InheritedWidget {
  final int value;

  const Count({
    required this.value,
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  static Count of(BuildContext context) {
    final Count? result = context.dependOnInheritedWidgetOfExactType<Count>();
    assert(result != null, 'No Count found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(Count old) {
    return old.value != value;
  }
}
