import 'package:emart/Ui_helper/textstyle.dart';
import 'package:emart/consts/consts.dart';
import 'package:emart/widgets_common/homesbutton.dart';
import 'package:get/get.dart';

class Insidehome1 extends StatefulWidget {
  const Insidehome1({super.key});

  @override
  State<Insidehome1> createState() => _Insidehome1State();
}

class _Insidehome1State extends State<Insidehome1> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
          body: Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.lightBlueAccent.shade100,
              child: SafeArea(
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Search anything',
                          hintStyle: tb15(),
                          suffixIcon: Icon(Icons.search)),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            VxSwiper.builder(
                              height: 150,
                              autoPlayInterval: Duration(seconds: 10),
                              autoPlay: true,
                              autoPlayCurve: Curves.decelerate,
                              enlargeCenterPage: true,
                              itemCount: swiperlist.length,
                              itemBuilder: (context, index) {
                                return Container(
                                    clipBehavior: Clip.antiAlias,
                                    margin: EdgeInsets.all(3),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(25),
                                        boxShadow: [
                                          BoxShadow(
                                              spreadRadius: 1,
                                              color: Colors.black,
                                              blurRadius: 3)
                                        ]),
                                    child: Image.asset(
                                        fit: BoxFit.fill, swiperlist[index]));
                              },
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                homebutton1(
                                    width: context.screenWidth * .3,
                                    height: context.screenHeight * .15,
                                    icon: icTodaysDeal,
                                    title: "Today's Deal"),
                                homebutton1(
                                    width: context.screenWidth * .3,
                                    height: context.screenHeight * .15,
                                    icon: icFlashDeal,
                                    title: "Flash deal"),
                                homebutton1(
                                  width: context.screenWidth * .3,
                                  height: context.screenHeight * .15,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            VxSwiper.builder(
                              height: 150,
                              autoPlay: true,
                              autoPlayInterval: Duration(seconds: 10),
                              enlargeCenterPage: true,
                              autoPlayCurve: Curves.decelerate,
                              itemCount: swiperlist2.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  margin: EdgeInsets.all(2),
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      boxShadow: [
                                        BoxShadow(
                                          spreadRadius: 1,
                                          blurRadius: 3,
                                          color: Colors.black,
                                        )
                                      ]),
                                  child: Image.asset(swiperlist2[index],
                                      fit: BoxFit.fill),
                                );
                              },
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: List.generate(
                                  3,
                                  (index) => homebutton1(
                                        height: context.screenHeight * .15,
                                        width: context.screenWidth * .30,
                                        icon: index == 0
                                            ? icTopCategories
                                            : index == 1
                                                ? icBrands
                                                : icTopSeller,
                                        title: index == 0
                                            ? "Top categories"
                                            : index == 1
                                                ? "Brands"
                                                : "Top sellers",
                                      )),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            // FEATURED CATEGORIES
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                  'Featured Categories',
                                  style: tb20(),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: List.generate(
                                    3,
                                    (index) => Column(
                                          children: [
                                            featuredbutton(
                                                title: featuredname1[index]
                                                    .toString(),
                                                icon: featuredicon1[index]),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            featuredbutton(
                                                title: featuredname2[index]
                                                    .toString(),
                                                icon: featuredicon2[index])
                                          ],
                                        )),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            // FEATURED PRODUCTS
                            Container(
                              alignment: Alignment.center,
                              width: context.screenWidth,
                              color: Colors.orange.shade700,
                              child: Column(children: [
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Featured product's",
                                      style: tb20(),
                                    ),
                                  ),
                                ),
                                SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                        children: List.generate(
                                            6,
                                            (index) => Container(
                                                  margin: EdgeInsets.all(5),
                                                  padding: EdgeInsets.all(5),
                                                  clipBehavior: Clip.antiAlias,
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      boxShadow: [
                                                        BoxShadow(
                                                            color: Colors.black,
                                                            blurRadius: 3)
                                                      ]),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Image.asset(
                                                        imgP1,
                                                        height: 150,
                                                        width: 150,
                                                        fit: BoxFit.fill,
                                                      ),
                                                      Text(
                                                        "laptop",
                                                        style: tb20(),
                                                      ),
                                                      Text(
                                                        "\$600",
                                                        style: TextStyle(
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                )))),
                              ]),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            //3RD SWIPER
                            VxSwiper.builder(
                              itemCount: 3,
                              height: 150,
                              aspectRatio: 16 / 9,
                              enlargeCenterPage: true,
                              autoPlayCurve: Curves.decelerate,
                              autoPlay: true,
                              autoPlayInterval: Duration(seconds: 10),
                              itemBuilder: (context, index) {
                                return Container(
                                  clipBehavior: Clip.antiAlias,
                                  margin: EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      boxShadow: [
                                        BoxShadow(
                                            spreadRadius: 1,
                                            blurRadius: 3,
                                            color: Colors.black)
                                      ]),
                                  child: Image.asset(
                                      swiperlist.elementAt(index),
                                      fit: BoxFit.fill),
                                );
                              },
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            // ALL CATEGORIES
                            GridView.builder(
                              itemCount: 6,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      mainAxisSpacing: 5,
                                      crossAxisSpacing: 5),
                              itemBuilder: (context, index) {
                                return Container(
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black,
                                          blurRadius: 3,
                                          spreadRadius: 1,
                                        )
                                      ]),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Image.asset(
                                          imgP1,
                                          height: 120,
                                          width: context.width,
                                          fit: BoxFit.cover,
                                        ),
                                        Text('Laptops',
                                            style: tb20(),
                                            textAlign: TextAlign.start),
                                        Text(
                                          '\$1000',
                                          style: TextStyle(
                                              fontSize: 25,
                                              fontWeight: FontWeight.w500),
                                        )
                                      ]),
                                );
                              },
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ))),
    );
  }
}
