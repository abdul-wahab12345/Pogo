import 'package:flutter/material.dart';
import 'package:pogo/constant.dart';

class MiniDropDown extends StatefulWidget {
  MiniDropDown({
    required this.onChanged,
    this.prefixIcon,
  });

  Function onChanged;
  Icon? prefixIcon;

  @override
  _MiniDropDownState createState() => _MiniDropDownState();
}

class _MiniDropDownState extends State<MiniDropDown> {
  Image value1 = Image.asset('assets/images/Vector.png');
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height / 100;
    var width = MediaQuery.of(context).size.width / 100;
    return Container(
      //  height: height*4,
      padding: EdgeInsets.symmetric(horizontal: 8,vertical: 0),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.grey.withOpacity(0.4),
            width: 1,
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.circular(5)),
      child: Align(
        alignment: Alignment.center,
        child: DropdownButtonHideUnderline(
          child: DropdownButtonFormField<String>(
            // iconEnabledColor: Colors.transparent,
            // iconDisabledColor: Colors.transparent,
            
            decoration: InputDecoration(
              contentPadding: EdgeInsets.zero,
              border: InputBorder.none,
              prefixIcon: widget.prefixIcon,
            ),

            hint: Center(child: Image.asset('assets/images/Vector.png')),
            items: <String>[
              'assets/images/Vector.png',
              'assets/images/icon.png',
              'assets/images/inbox.png'
            ].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Image.asset(
                  value,
                  height: height * 1.5,
                  width: height * 1.5,
                  fit: BoxFit.contain,
                ),
              );
            }).toList(),
            onChanged: (value) {
              // widget.onChanged(value);
              setState(() {
                value1 = Image.asset(value!);
              });
            },
          ),
        ),
      ),
    );
  }
}

DropdownMenuItem<Image> buildMenuItem(String item) =>
    DropdownMenuItem(value: Image.asset(item), child: Image.asset(item));
