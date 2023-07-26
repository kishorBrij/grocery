import 'package:flutter/material.dart';

import '../customWidget/textField_custom.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
          child:const CustomTextField(
            hintText:"search product",
            suffixIcon: Icon(Icons.search,size:30,),
          ),
        ),
      ),
    );
  }
}
