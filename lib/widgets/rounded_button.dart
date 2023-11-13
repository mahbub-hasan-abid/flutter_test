import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String btnname;
  final Icon? icon;
  final Color? bgColor;
  final TextStyle textstyle;
  final VoidCallback? callBack;

  const RoundedButton(
      {required this.btnname,
      this.icon,
      this.bgColor = Colors.blue,
      required this.textstyle,
      this.callBack});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        callBack!();
      },
      style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          shadowColor: bgColor,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(21),
                  bottomLeft: Radius.circular(21)))),
      child: icon != null
          ? Row(
              children: [
                icon!,
                Text(btnname,
                    style: const TextStyle(color: Colors.white, fontSize: 20)),
              ],
            )
          : Text(
              btnname,
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
    );
  }
}
