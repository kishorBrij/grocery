import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:grocery/utils/app_style.dart';
import 'package:grocery/view/customWidget/custom_button.dart';
import 'package:grocery/view/customWidget/textField_custom.dart';

import '../../../utils/image.dart';
class WriteReview extends StatefulWidget {
  const WriteReview({Key? key}) : super(key: key);

  @override
  State<WriteReview> createState() => _WriteReviewState();
}

class _WriteReviewState extends State<WriteReview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        title:const Text("Write Your Review",style:h1Style,),
      ),
      bottomNavigationBar: Container(
        margin:const EdgeInsets.symmetric(horizontal:10,vertical: 10),
        child: CustomButton(
          onTapPress:(){},
          textButton: "Send",style: appbarStyle,
        ),
      ),
      body:SafeArea(child:SingleChildScrollView(
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin:const EdgeInsets.symmetric(vertical: 15),
              child: ListTile(
                leading:Image.asset(AppImage.banana),
                title:const Text("Banana",style: h1Style,),
                subtitle:  RatingBar.builder(
                  itemSize: 20,
                  initialRating: 3,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: const EdgeInsets.symmetric(
                      horizontal: 0.0),
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.green,
                  ),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                ),
              ),
            ),
            const SizedBox(height: 10,),
            Container(
              margin:const EdgeInsets.symmetric(horizontal:10,vertical: 15),
              child:const Text("Write Your Review",style: h1Style,),
            ),
            Container(
              margin:const EdgeInsets.symmetric(horizontal:10,vertical: 5),
              child:const CustomTextField(
                hintText:"how is the product?",
              ),
            )
          ],
        ),
      )),
    );
  }
}
