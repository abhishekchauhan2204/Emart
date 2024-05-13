import 'package:emart/Ui_helper/textstyle.dart';
import 'package:emart/consts/consts.dart';
import 'package:emart/consts/list.catergory.dart';
import 'package:emart/views/category%20screen/category_details.dart';
import 'package:emart/views/homescreen/home.dart';
import 'package:emart/widgets_common/bg_widgets.dart';
import 'package:get/get.dart';

class Category1 extends StatefulWidget {
  final void Function(int) updateIndex; // Callback function to update index
  const Category1({Key? key, required this.updateIndex}) : super(key: key);

  @override
  State<Category1> createState() => _Category1State();
}

class _Category1State extends State<Category1> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: bgwidget(
            child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  setState(() {
                    widget.updateIndex(0);
                  });
                },
              ),
              automaticallyImplyLeading: true,
              title: Text("Categories"),
              backgroundColor: Colors.transparent),
          body: Container(
            padding: EdgeInsets.all(10),
            child: GridView.builder(
              shrinkWrap: true,
              itemCount: 10,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5,
                  mainAxisExtent: 200),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return categoriesdetails(tit: catlistname[index].toString());
                      },
                    ));
                  },
                  child: Container(
                    clipBehavior: Clip.antiAlias,
                    height: context.height,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black,
                              blurRadius: 2,
                              spreadRadius: 1)
                        ]),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            caticonlist[index],
                            fit: BoxFit.cover,
                            width: context.width,
                            height: 140,
                          ),
                          Text(
                            catlistname[index].toString(),
                            style: tb20(),
                          )
                        ]),
                  ),
                );
              },
            ),
          ),
        )));
  }
}
