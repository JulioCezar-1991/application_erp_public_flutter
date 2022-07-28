import 'package:flutter/material.dart';

class CircleButtonWidget extends StatelessWidget {
  final dynamic label;
  final dynamic backgroundColor;
  final Color textColor;
  final Color borderColor;
  final double height;
  final double width;
  final dynamic icon;
  final GestureTapCallback onTap;

  const CircleButtonWidget(
      {Key? key,
      this.label,
      this.backgroundColor,
      required this.textColor,
      required this.borderColor,
      required this.height,
      required this.width,
      this.icon,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Material(
        borderRadius: BorderRadius.circular(8),
        color: backgroundColor == null
            ? Theme.of(context).backgroundColor
            : backgroundColor,
        child: InkWell(
          onTap: onTap,
          child: Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              border:
                  borderColor == null ? null : Border.all(color: borderColor),
            ),
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: icon,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  label,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
