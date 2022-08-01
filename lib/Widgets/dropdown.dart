import 'package:flutter/material.dart';
import 'package:pogo/constant.dart';

class CustomDropDown extends StatefulWidget {
  CustomDropDown({
    required this.onChanged,
    this.prefixIcon,
    this.backgroudColor,
    this.borderColor,
    this.isBorder,
  });

  Function onChanged;
  Icon? prefixIcon;
  Color? borderColor;
  Color? backgroudColor;
  bool? isBorder;

  @override
  _CustomDropDownState createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  final items = ['ON', 'OFF'];
  String value1 = 'ON';
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: widget.backgroudColor,
        // border: Border.all(
        //   color: Colors.grey.withOpacity(0.4),
        //   width: 0.5,
        //   style: BorderStyle.solid,
        // ),
      ),
      child: DropdownButtonHideUnderline(
        child: Align(
          alignment: AlignmentDirectional.centerEnd,
          child: DropdownButtonFormField<String>(
            // iconEnabledColor: Colors.transparent,
            // iconDisabledColor: Colors.transparent,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 8),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(
                  color: Colors.grey.withOpacity(0),
                  width: 0.2,
                  style: BorderStyle.solid,
                ),
              ),
              prefixIcon: widget.prefixIcon,
            ),

            hint: Center(
              child: Text(
                'כל הנהגים',
                style: TextStyle(
                    fontFamily: 'Heebo',
                    fontWeight: FontWeight.w700,
                    fontSize: 11),
              ),
            ),
            items: <String>['A', 'B', 'C', 'D'].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: new Text(value),
              );
            }).toList(),
            onChanged: (_) {},
          ),
        ),
        // DropdownButton(
        //   alignment: Alignment.bottomLeft,
        //   dropdownColor: primaryColor,

        //   icon: Icon(
        //     Icons.keyboard_arrow_down_outlined,
        //     color: Colors.black,
        //   ),
        //   value: value1,

        //   items: items.map(buildMenuItem).toList(),
        //   onChanged: (value) {
        //     widget.onChanged(value);
        //     setState(() {
        //       value1 = value as String;
        //     });
        //   },
        // ),
      ),
    );
  }
}

DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
      value: item,
      child: Text(
        item,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 11,
          fontWeight: FontWeight.w700,
          fontFamily: 'Heebo',
        ),
      ),
    );
