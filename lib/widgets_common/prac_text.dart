import 'package:emart/Ui_helper/textstyle.dart';
import 'package:emart/consts/consts.dart';

Widget custextfield(TextEditingController controller, bool tohide,
    String likhde, {IconData? iconData}) {
  return TextField(
    obscureText: tohide,
    controller: controller,
    style: tb20(),
    decoration: InputDecoration(
        suffixIcon: iconData != null ? Icon(iconData) : null,
        hintText: likhde,
        enabledBorder:
            OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
        focusedBorder:
            OutlineInputBorder(borderRadius: BorderRadius.circular(50))),
  );
}

class custextpass extends StatefulWidget {
  final bool tohide;
  final TextEditingController controller;
  final String Likhde;
  final IconData iconData;

  const custextpass(
      {super.key,
      required this.tohide,
      required this.controller,
      required this.iconData,
      required this.Likhde});

  @override
  State<custextpass> createState() => _custextpassState();
}

class _custextpassState extends State<custextpass> {
  bool _obsecuretext = true;
  @override
  Widget build(BuildContext context) {
    return TextField(
      style: tb20(),
      controller: widget.controller,
      obscureText: _obsecuretext,
      decoration: InputDecoration(
        hintText: widget.Likhde,
          suffixIcon: GestureDetector(onTap: () {
            setState(() {
              _obsecuretext = !_obsecuretext;
            });
          },child: Icon(widget.iconData
          )),
          focusedBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
          enabledBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(50))),
    );
  }
}
