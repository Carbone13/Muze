import 'package:flutter/material.dart';
import 'package:muze/utils/colors.dart';
import 'package:muze/utils/sizes.dart';
import 'package:muze/utils/text_style.dart';

class Option extends StatefulWidget {
  String optionName;
  VoidCallback onPressed;
  bool value;

  Option({this.onPressed, this.optionName, this.value});

  @override
  _OptionState createState() => _OptionState();
}

class _OptionState extends State<Option> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          right: UISize.width(10),
          top: UISize.width(15),
          bottom: UISize.width(15)),
      child: Container(
        decoration: BoxDecoration(
            gradient: widget.value
                ? LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [
                        UIColors.gradient_2_2,
                        UIColors.gradient_2_1,
                      ])
                : null,
            boxShadow: [
              BoxShadow(
                color: widget.value
                    ? UIColors.gradient_2_shadow
                    : Colors.transparent,
                blurRadius: 40.0,
              )
            ],
            shape: BoxShape.circle,
            border: Border.all(
                color: UIColors.lightGrey, width: widget.value ? 0 : 1)),
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            borderRadius: BorderRadius.circular(50),
            onTap: () {
              widget.onPressed();
              this.setState(() {
                widget.value = !widget.value;
              });
            },
            child: Container(
              alignment: Alignment.center,
              height: UISize.width(100),
              width: UISize.width(100),
              child: Text(
                widget.optionName,
                style: StyleText.semiBoldMontserrat.copyWith(
                    fontSize: UISize.fontSize(12),
                    color: widget.value ? UIColors.white : UIColors.textDark),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
