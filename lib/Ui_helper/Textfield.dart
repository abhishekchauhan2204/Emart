import 'package:emart/Ui_helper/textstyle.dart';
import 'package:emart/consts/consts.dart';

Widget customtextfield(bool tohide, TextEditingController controller,
    IconData iconData, String hint) {
  return SizedBox(width: 300,
    child: TextField(
      style: tb25(),
      controller: controller,
      obscureText: tohide,
      decoration: InputDecoration(
          hintText: hint,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30)),

          suffixIcon: Icon(iconData)),
    ),
  );
}

class customtextf extends StatefulWidget {
  final bool tohide;
  final TextEditingController controller;
  final String text;
  final IconData iconData;

  const customtextf(
      {super.key, required this.tohide, required this.controller, required this.text, required this.iconData});

  @override
  State<customtextf> createState() => _customtextfState();
}

class _customtextfState extends State<customtextf> {
  bool _obsecuretext = true;
  @override
  Widget build(BuildContext context) {
    return SizedBox(width: 300,
        child: TextField(
          controller:widget.controller,
          obscureText: _obsecuretext,
          style: tb25(),
          decoration: InputDecoration(hintText: widget.text,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  _obsecuretext = !_obsecuretext;
                });
              },
              child: Icon(
                widget.iconData,
              ),
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30)),
          ),
        ));
  }}
