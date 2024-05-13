import 'package:emart/Ui_helper/textstyle.dart';
import 'package:emart/consts/consts.dart';

import 'Apiservice.dart';
import 'Cart Details Screen.dart';
import 'cart model.dart';

class cart1 extends StatefulWidget {
  final void Function(int) updateIndex; // Callback function to update index
  const cart1({Key? key, required this.updateIndex}) : super(key: key);

  @override
  State<cart1> createState() => _cart1State();
}

class _cart1State extends State<cart1> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child:Scaffold(
        appBar: AppBar(title: Text("Carts"), centerTitle: true,
        backgroundColor:Colors.purple ),
        body: Center(
          child: FutureBuilder(
            future: getdata(),
            builder: (context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) {
                return CircularProgressIndicator();
              } else {
                List<Cart> carts = snapshot.data;

                return ListView.builder(

                  shrinkWrap: true,
                  itemCount: carts.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 120,
                      decoration: BoxDecoration(
                          color: Colors.purple.shade200,
                          boxShadow: <BoxShadow>[
                            BoxShadow(color: Colors.black,spreadRadius: 1,blurRadius: 1,blurStyle:  BlurStyle.solid)
                          ]),
                      child: ListTile(
                        title: Text(
                          'Cart ID: ${carts[index].id}',
                        ),
                        subtitle: Text('Cart total: ${carts[index].total}'),
                        trailing: SingleChildScrollView(
                          child: Container(
                            height: 120,

                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: carts[index].products.map((product) {
                                return Text(product.title);
                              }).toList(),
                            ),
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  CartDetailsScreen(cart: carts[index]),
                            ),
                          );
                        },
                      ),
                    );
                  },
                );
              }
            },
          ),
        ),
      )
    );
  }
}
