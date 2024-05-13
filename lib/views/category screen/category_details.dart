import 'package:emart/Ui_helper/textstyle.dart';
import 'package:emart/consts/consts.dart';
import 'package:emart/consts/list.catergory.dart';
import 'package:emart/views/category%20screen/item%20details.dart';
import 'package:emart/widgets_common/bg_widgets.dart';
import 'package:get/get.dart';

class categoriesdetails extends StatefulWidget {
  final String tit;

  const categoriesdetails({super.key, required this.tit});

  @override
  State<categoriesdetails> createState() => _categoriesdetailsState();
}

class _categoriesdetailsState extends State<categoriesdetails> {

  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return bgwidget(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(backgroundColor: Colors.transparent, title: Text(widget.tit)),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SingleChildScrollView(physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                    children: List.generate(10, (index) {
                  EdgeInsets margin;
                  if (index == 0) {
                    margin = EdgeInsets.only(left: 10, right: 5);
                  } else if (index == 9) {
                    margin = EdgeInsets.only(left: 5, right: 10);
                  } else {
                    margin = EdgeInsets.all(7);
                  }
                  return GestureDetector( onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                    child: InkWell(onTap: () {
                       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => categoriesdetails(tit: catlistname[index].toString())));
                    },
                      child: Container(
                        decoration: BoxDecoration(
                            color: selectedIndex == index ? Colors.red : Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [BoxShadow(color: Colors.black,blurRadius: 1)]),
                        margin: margin,
                        padding: EdgeInsets.all(10),
                        child: Text(catlistname[index].toString(),style: tb15(),),
                      ),
                    ),
                  );
                })),
              ),
              Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(12),
                  child: Column(
                    children: [
                      GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 8,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisExtent: 200,
                            crossAxisSpacing: 5,
                            mainAxisSpacing: 5),
                        itemBuilder: (context, index) {
                          return InkWell(onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return itemdetails();
                            },));
                          },
                            child: Container(
                              color: Colors.transparent,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.asset(
                                      caticonlist[index],
                                      height: 140,
                                      width: context.width,
                                      fit: BoxFit.fill,
                                    ),
                                    Text(
                                      'Discription',
                                      style: tb20(),
                                    ),
                                    Text(
                                      'Price',
                                      style: tb20(rang: Colors.orange),
                                    ),
                                  ]),
                            ),
                          );
                        },
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
