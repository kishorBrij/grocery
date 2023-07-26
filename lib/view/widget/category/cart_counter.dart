import 'package:flutter/material.dart';
import 'package:grocery/utils/app_style.dart';
import 'package:grocery/utils/color.dart';
class CartCounter extends StatefulWidget {
  const CartCounter({Key? key}) : super(key: key);

  @override
  State<CartCounter> createState() => _CartCounterState();
}

class _CartCounterState extends State<CartCounter> {
  int _counter=1;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
  void _decrementCounter() {
    setState(() {
      _counter--;
      if(_counter==0){
        _counter=1;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(

   decoration: BoxDecoration(
       color: AppColor.btnColor, borderRadius: BorderRadius.circular(10)),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: (){
              _decrementCounter();
            },
            child:  const Padding(
              padding: EdgeInsets.only(left:10),
              child: Text('─',
                style: TextStyle(
                  fontSize: 21,
                  color: Colors.white
                )
              ),
            ),
          ),
          Text('$_counter',
            style: const TextStyle(
                fontSize: 16,
                color: Colors.white
            )
          ),
          GestureDetector(
            onTap: (){
              _incrementCounter();
            },
            child: const Padding(
              padding: EdgeInsets.only(right: 10),
              child: Text('+',
                style: TextStyle(
                    fontSize: 21,
                    color: Colors.white
                )
              ),
            ),
          ),
        ],
      ),
    );
  }
}
