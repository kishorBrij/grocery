import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../provider/data/sub_category_data.dart';
import '../../../routes/app_routes_constant.dart';
import '../../../utils/app_style.dart';
import '../../../utils/color.dart';
import '../../../utils/image.dart';
class SubCategory extends StatefulWidget {
  const SubCategory({Key? key}) : super(key: key);

  @override
  State<SubCategory> createState() => _SubCategoryState();
}

class _SubCategoryState extends State<SubCategory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar:AppBar(
        //  backgroundColor: AppColor.btnColor,
        elevation: 5,
        iconTheme: IconThemeData(color:AppColor.btnColor),
        title: const Text(
          "New Delhi",
          style: h1Style,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(
                onPressed: () {
                  GoRouter.of(context).pushNamed(AppConstantRoute.searchRoute);
                },
                icon: const Icon(
                  Icons.search,
                  size: 30,
                )),
          ),

        ],
      ),
      body:GridView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent:180,
              childAspectRatio: 0.9,
              crossAxisSpacing:3,
              mainAxisSpacing: 0.2),
          itemCount: subCategoryData.length,
          itemBuilder: (BuildContext ctx, index) {
            return GestureDetector(
              onTap: () {

              },
              child: Container(
                margin: const EdgeInsets.only(top:3, bottom: 2),
                height: MediaQuery.of(context).size.height * .11,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: AppColor.textWhite,
                    borderRadius: BorderRadius.circular(0)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Container(
                        padding: const EdgeInsets.only(top: 5),
                        child: Image.asset(
                          subCategoryData[index].image,
                          height: 80,
                          width:80,
                        ),
                      )
                    ]),
                    Container(
                      padding: const EdgeInsets.fromLTRB(2, 5, 2, 2),
                      child:  Text(
                        subCategoryData[index].productName,
                        style: textStyle,
                      ),
                    ),
                    Container(
                        padding: const EdgeInsets.fromLTRB(5, 0, 2, 2),
                        child: Row(
                          children: [
                            Text(subCategoryData[index].price, style: TextStyle(
                            fontSize: 15,
                            color: AppColor.textBlack,
                            fontFamily: "Avalon_Bold",
                            fontWeight: FontWeight.bold),),
                            const SizedBox(width: 10,),
                            Text(subCategoryData[index].quantity,style: textStyle),
                          ],
                        )),
                    Container(
                        padding: const EdgeInsets.fromLTRB(5, 5, 2, 2),
                        child: Row(
                          children: [
                            Text(subCategoryData[index].discount,
                          style:colorDiscountStyle,),
                          const SizedBox(width: 15,),
                          Text(subCategoryData[index].off,
                              style: colorTextStyle)
                          ],
                        )),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
