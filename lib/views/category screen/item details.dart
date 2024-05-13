import 'package:emart/Ui_helper/textstyle.dart';
import 'package:emart/consts/consts.dart';
import 'package:emart/consts/list.catergory.dart';
import 'package:emart/views/category%20screen/category_details.dart';
import 'package:emart/widgets_common/category%20button%20widget.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

class itemdetails extends StatefulWidget {
  const itemdetails({
    super.key,
  });

  @override
  State<itemdetails> createState() => _itemdetailsState();
}

class _itemdetailsState extends State<itemdetails> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: SafeArea(
          child: Container(
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    IconButton(
                        iconSize: 30,
                        onPressed: () {},
                        icon: IconButton(onPressed: () {
                          Navigator.pop(context,MaterialPageRoute(builder: (context) {
                          return categoriesdetails(tit: catlistname.toString());
                          },));
                        },icon: Icon(Icons.arrow_back),)),
                    Container(
                      width: context.width * .70,
                      height: context.height * .06,
                      child: TextFormField(
                        decoration: InputDecoration(
                            hintText: "Search for products",
                            hintStyle: tb15(),
                            prefixIcon: Icon(Icons.search),
                            suffixIcon: Icon(Icons.mic),
                            contentPadding: EdgeInsets.symmetric(vertical: 0.0),
                            filled: true,
                            enabledBorder: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder()),
                      ),
                    ),
                    Expanded(
                      child: IconButton(
                          iconSize: 30,
                          onPressed: () {},
                          icon: Icon(Icons.shopping_cart)),
                    )
                  ],
                ),
              ),
              Divider(),
              //body of details
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(children: [
                    //Swiper
                    Container(
                      color: Colors.white,
                      height: 250,
                      child: VxSwiper.builder(
                        enlargeCenterPage: true,
                        height: 220,
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return Container(
                              clipBehavior: Clip.antiAlias,
                              margin: EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10)),
                              width: context.screenWidth,
                              child: Image.asset(
                                imgFc5,
                                fit: BoxFit.cover,
                              ));
                        },
                      ),
                    ),
                    //Tag
                    Container(
                      width: context.screenWidth,
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Dummy Item ',
                            style: tb25(),
                          ),
                          VxRating(
                            size: 23,
                            padding: 1,
                            selectionColor: golden,
                            onRatingUpdate: (value) {},
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text('\$ 8000',
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.orangeAccent.shade700)),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                    //Seller details
                    Container(
                      height: 70,
                      color: Colors.grey.shade400,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Seller",
                                style: tb20(),
                              ),
                              Text(
                                "Brand name",
                                style: tb15(),
                              )
                            ],
                          ),
                          CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Icon(Icons.message))
                        ]),
                      ),
                    ),
                    //color details
                    Container(
                      color: Colors.white,
                      padding: EdgeInsets.all(5),
                      child: Stack(alignment: Alignment.centerLeft, children: [
                        Expanded(
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: List.generate(
                                    3,
                                    (index) => Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 4),
                                          child: CircleAvatar(
                                            backgroundColor:
                                                Vx.randomPrimaryColor,
                                          ),
                                        )))),
                        Text(
                          'Color',
                          style: tb15(),
                        ),
                      ]),
                    ),
                    // quantity details
                    Container(
                      padding: EdgeInsets.all(5),
                      color: Colors.white,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Quantity",
                              style: tb15(),
                            ),
                            IconButton(
                                onPressed: () {}, icon: Icon(Icons.remove)),
                            Text(
                              "0",
                              style: tb15(),
                            ),
                            IconButton(onPressed: () {}, icon: Icon(Icons.add)),
                            Text(
                              "0 Available",
                              style: tb15(),
                            ),
                          ]),
                    ),
                    //Total price
                    Container(
                      padding: EdgeInsets.all(5),
                      color: Colors.white,
                      child: Row(children: [
                        Text(
                          'Total price',
                          style: tb20(rang: Colors.orange),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Text(
                          '\$ 9000',
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w500,
                              color: Colors.orange),
                        ),
                      ]),
                    ),
                    //Discription
                    Container(
                        padding: EdgeInsets.only(left: 5),
                        width: context.screenWidth,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Discription',
                              style: tb20(),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _isExpanded = !_isExpanded;
                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 13),
                                  child: Container(
                                    alignment: Alignment.centerLeft,
                                    width: double.infinity,
                                    color: Colors.white,
                                    child: Column(
                                      children: List.generate(
                                        _isExpanded ? 15 : 3,
                                        // Toggle number of lines
                                        (index) => Text(
                                          "-  features",
                                          style: TextStyle(fontSize: 15),
                                        ),
                                      ),
                                    ),
                                  ),
                                )),
                            SizedBox(
                              height: 20,
                            )
                          ],
                        )),
                    Container(
                      color: Colors.pinkAccent.shade100,
                      child: Column(
                          children: List.generate(
                              catparameterlist.length,
                              (index) => Container(
                                    color: Colors.white,
                                    padding: EdgeInsets.all(5),
                                    margin: EdgeInsetsDirectional.only(top: 3),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          catparameterlist[index],
                                          style: tb25(),
                                        ),
                                        IconButton(
                                            onPressed: () {},
                                            icon: Icon(Icons.arrow_forward))
                                      ],
                                    ),
                                  ))),
                    ),
                    Container(

                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                          buybut(voidCallback: () {
                          },
                            title: "Buy now",
                            rang: Colors.green,
                          ),
                          buybut(voidCallback: () {
                          },
                            title: 'Add to cart',
                          )
                        ]),
                      ),
                    ),

                    SizedBox(height: 15,)
                  ]),
                ),
              ),
              //Swiper
            ]),
          ),
        ),
      ),
    );
  }
}
