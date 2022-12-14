//@dart=2.9

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ButtonItem extends StatelessWidget {
  const ButtonItem(
      {Key key,
        this.imagePath,
        this.onClick,
        this.text,
        this.iconData,
        this.size})
      : super(key: key);
  final String text;
  final String imagePath;
  final Function onClick;
  final IconData iconData;
  final double size;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width - 60,
        child: Card(
          color: Colors.blueGrey,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.blueGrey[50], width: 1),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  imagePath,
                  height: size,
                  width: size,
                  // color: Colors.white,
                ),
                // Icon(iconData),
                SizedBox(width: 15),
                Text(
                  text,
                  style: TextStyle(fontSize: 17, color: Colors.redAccent[100]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}