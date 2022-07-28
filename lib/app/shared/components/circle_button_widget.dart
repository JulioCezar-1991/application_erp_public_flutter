import 'package:flutter/material.dart';

class CircleButtonWidget extends StatelessWidget {
  final dynamic label;
  final dynamic backgroundColor;
  final dynamic textColor;
  final dynamic borderColor;
  final dynamic height;
  final dynamic width;
  final dynamic icon;
  final GestureTapCallback onTap;

  const CircleButtonWidget(
      {Key? key,
      this.label,
      this.backgroundColor,
      this.textColor,
      this.borderColor,
      this.height,
      this.width,
      this.icon,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Material(
        borderRadius: BorderRadius.circular(8),
        color: backgroundColor ?? Theme.of(context).backgroundColor,
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
