import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:grocery/utils/color.dart';
import 'package:grocery/viewModel/auth_view_model.dart';
import 'package:provider/provider.dart';
import '../../../provider/data/banner_data.dart';
import '../../../routes/app_routes_constant.dart';
import '../../../utils/app_style.dart';
import '../../screens/drawer_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key,}) : super(key: key);



  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int _currentPage = 0;
  late Timer _timer;
  final PageController _pageController = PageController(
    initialPage: 0,
  );
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // final homeProvider = Provider.of<HomeCategory>(context,listen: false);
    // homeProvider.getCategory(categoryData);
    //
    // final recentProductProvider=Provider.of<RecentProduct>(context,listen: false);
    // recentProductProvider.getRecentData(recentlyViewData);

    final authViewModel= Provider.of<AuthViewModel>(context,listen: false);
    authViewModel.bannerGet(context);

    authViewModel.singleBannerGet(context);

    authViewModel.categoryGet(context);

    authViewModel.topCategoryGet(context);

    authViewModel.recentCategoryGet(
        {
          "productIdList":"[102,103]"
        },context
    );

    // log("message1111$singleBannerProvider");


    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (_currentPage < bannerData.length) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {

    // final homeProvider = Provider.of<HomeCategory>(context);

    // final recentProductProvider=Provider.of<RecentProduct>(context);

    final authViewMode = Provider.of<AuthViewModel>(context);
    // log("message1111${authViewMode.singleBannerData}");
    return Scaffold(
      drawer: const DrawerPage(),
      appBar: AppBar(
        //  backgroundColor: AppColor.btnColor,
        elevation: 5,
        iconTheme: IconThemeData(color: AppColor.btnColor),
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 180,
              width: double.infinity,
              child: Center(
                  child: PageView.builder(
                      onPageChanged: (value) {
                        //bannerProvider.setCurrentIndex(value);
                      },
                      controller: _pageController,
                      itemCount: authViewMode.bannerData.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: (){
                            int args =1;

                            GoRouter.of(context).
                            pushNamed(AppConstantRoute.navigationRoute,extra: args);
                          },
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  margin:
                                  const EdgeInsets.symmetric(horizontal: 10, vertical:10),
                                  height: 150,
                                  width: double.infinity,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      authViewMode.bannerData[index]["image"],
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),

                              ],
                            ),
                          ),
                        );
                      })),
            ),
            Container(
              alignment: Alignment.center,
              height:20,
              child: authViewMode.bannerData.isEmpty?const CircularProgressIndicator():ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount:authViewMode.bannerData.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Container(
                        alignment: Alignment.center,
                        height:10,
                        width: 10,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: index == pageIndex ? AppColor.secondry : AppColor.btnColor),
                      ),
                    );
                  }),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: const Text(
                "Shop By Category",
                style: h1Style,
              ),
            ),
            Container(
              margin:const EdgeInsets.symmetric(horizontal: 10,vertical: 5),

              child: GridView.builder(
                itemCount: authViewMode.categoryData.length+1,
                shrinkWrap: true,
                primary: false,

                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 8,
                    childAspectRatio: 0.7,
                    mainAxisSpacing: 8.0),
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {


                  if(index==authViewMode.categoryData.length){
                    return GestureDetector(
                      onTap:(){
                        int args =1;
                        GoRouter.of(context).
                        pushNamed(AppConstantRoute.navigationRoute,extra: args);
                      },
                      child: SizedBox(
                        child:Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top:5),
                              alignment: Alignment.center,
                              height: 80,
                              width: 100,
                              decoration: BoxDecoration(
                                color: AppColor.btnColor,
                                borderRadius: BorderRadius.circular(10)
                              ),
                              child:CircleAvatar(
                                radius: 20,
                                  backgroundColor: AppColor.textWhite,
                                  child: Icon(Icons.add,color: AppColor.btnColor,size: 30,)),
                            ),
                             const SizedBox(height: 5,),
                             const Text("All+",style: smallBlackStyle,textAlign: TextAlign.center,),
                          ],
                        ),
                      ),
                    );
                  }
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height:80,
                        width: 100,
                        decoration: BoxDecoration(
                          border:Border.all(color: AppColor.btnColor),
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                            child: Image.network(authViewMode.categoryData[index]["image"],fit: BoxFit.cover,)),
                      ),
                      const SizedBox(height: 5,),
                      Text(authViewMode.categoryData[index]["title"],style: smallBlackStyle,textAlign: TextAlign.center,)

                    ],
                  );
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: const Text(
                "Top Fruits and Vegetable",
                style: h1Style,
              ),
            ),
          Container(
            height: 235,
            margin:const EdgeInsets.symmetric(horizontal: 5),
            child:ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: authViewMode.topCategoryData.length,
                itemBuilder: (context,index){
                // log("topProduct${authViewMode.topCategoryData}");
              return Container(
                margin:const EdgeInsets.symmetric(horizontal: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height:200,
                      width: 130,
                      decoration: BoxDecoration(
                        color: AppColor.btnColor,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child:ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child:Image.network(jsonDecode(authViewMode.topCategoryData[index]["images"])[0],fit: BoxFit.cover,),
                      ),
                    ),
                    const SizedBox(height: 5,),
                    Text(authViewMode.topCategoryData[index]["title"],style: smallBlackStyle,textAlign: TextAlign.center ,)
                  ],
                ),
              );
            }),
          ),
            authViewMode.singleBannerData.isEmpty? const CircularProgressIndicator(): Container(
              height: 200,
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              decoration: BoxDecoration(
                image:DecorationImage(image: NetworkImage(authViewMode.singleBannerData[0]["image"]),fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(10)
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: const Text(
                "Recently Viewed Product",
                style: h1Style,
              ),
            ),
            Container(
              height: 225,
              // width: double.infinity,
              margin:const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
              child:ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount:authViewMode.topCategoryData.length,
                  itemBuilder: (context,index){
                    // log("11 : ${jsonDecode(authViewMode.topCategoryData[index]["images"])[0]}");
                    return GestureDetector(
                      onTap:(){
                        GoRouter.of(context).pushNamed(AppConstantRoute.categoryRoute,extra:(authViewMode.topCategoryData[index]) );
                      },
                      child: Container(
                        width:130,
                        padding:const EdgeInsets.all( 5),
                        margin:const EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                            color: AppColor.grey.withOpacity(.1),
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment:Alignment.center,
                                child: Image.network(jsonDecode(authViewMode.topCategoryData[index]["images"])[0],fit: BoxFit.fill,height: 126,)),
                            const SizedBox(height: 5,),
                            Text(authViewMode.topCategoryData[index]["title"],style: smallBlackStyle,textAlign: TextAlign.start ,),
                            const SizedBox(height: 5,),
                            Row(
                              children: [
                                Text("₹"+" "+authViewMode.topCategoryData[index]["price"].toString(),style: textStyle,textAlign: TextAlign.center ,),
                                const SizedBox(width: 15,),
                                Text("${calculatePercentage(
                                    double.parse(authViewMode.topCategoryData[index]["price"].toString()),
                                  double.parse(authViewMode.topCategoryData[index]["old_price"].toString()),
                                ).toStringAsFixed(2)}%",style: colorTextStyle,textAlign: TextAlign.start ,),
                              ],
                            ),
                            Text("₹"+" "+authViewMode.topCategoryData[index]["old_price"].toString(),style: colorDiscountStyle,textAlign: TextAlign.start ,),
                            Text(authViewMode.topCategoryData[index]["unit"].toString(),textAlign: TextAlign.start ,),

                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      )
    );
  }
  double calculatePercentage(double price, double oldPrice) {
    return ((oldPrice-price) / oldPrice) * 100;
  }

}
