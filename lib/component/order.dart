import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/count_model.dart';
import '../utils/currency_utils.dart';

class Order extends StatelessWidget {
  const Order({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Container(
          height: 65,
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                Color.fromRGBO(44, 191, 188, 1.0),
              ),
            ),
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 25,
                  height: 25,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child:
                    Consumer<CountModel>(builder: (_, countModel, __) => Text(
                      '${countModel.count}',
                      style: TextStyle(
                        color: Color.fromRGBO(44, 191, 188, 1.0),
                        fontWeight: FontWeight.bold,
                      ),
                    ),),
                  ),
                ),
                SizedBox(
                  width: 7,
                ),
                _order(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _order() {
    return Consumer<CountModel>(
      builder: (_, countModel, __) => Text(
        '${CurrencyUtils.getCommaWon(18000 * countModel.count + 3000)}원 배달 주문하기',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
