import 'package:flutter/material.dart';

import '../../../constants.dart';
import 'rounded_icon_btn.dart';

class CartCounter extends StatelessWidget {
  const CartCounter({
    Key? key,
    required String quantity, required Null Function() onIncrement,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFF6F6F6),
        borderRadius: const BorderRadius.all(Radius.circular(40)),
      ),
      child: Row(
        children: [
          RoundIconBtn(
            iconData: Icons.remove,
            color: Colors.black38,
            press: () {},
          ),
          const Expanded(
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: defaultPadding /3),
                child: Text(
                  "1",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
          ),
          RoundIconBtn(
            iconData: Icons.add,
            press: () {},
            color: Colors.purple,
          ),
        ],
      ),
    );
  }
}
