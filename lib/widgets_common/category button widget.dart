import 'package:emart/Ui_helper/textstyle.dart';
import 'package:emart/consts/consts.dart';

class buybut extends StatelessWidget {
  final String title;
  final Color rang;
  final VoidCallback voidCallback;

  const buybut({super.key, required this.title, this.rang= Colors.red, required this.voidCallback,});

  @override
  Widget build(BuildContext context) {
    return InkWell(

      onTap: () {
    },
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(color: rang,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(color: Colors.black, blurRadius: 5, spreadRadius: 1)
          ]),
        width: context.screenWidth * .45,
        height: context.screenHeight * .08,
        child: Text(title,style: tb20(),),),
    );
  }
}
