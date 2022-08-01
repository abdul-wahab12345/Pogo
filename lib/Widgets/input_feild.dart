import 'package:flutter/material.dart';

class InputFeild extends StatefulWidget {
  String hinntText;

  Function validatior;
  void Function(String?)? saved;
  void Function(String)? submitted;
  TextEditingController inputController;
  TextInputType? type;
  TextInputAction? textInputAction;
  FocusNode? focusNode;
  bool secure = true;
  IconData? suffix;
  bool readOnly;
  Function? suffixPress;
  int? maxLines;
  Icon? prefix;

  InputFeild(
      {required this.hinntText,
      required this.validatior,
      required this.inputController,
      this.type,
      this.focusNode,
      this.submitted,
      this.saved,
      this.prefix,
      this.suffix,
      this.maxLines=1,
      this.suffixPress,
      this.textInputAction,
      this.readOnly = false,
      this.secure = false});

  @override
  State<InputFeild> createState() => _InputFeildState();
}

class _InputFeildState extends State<InputFeild> {
  var isError = false;

  @override
  Widget build(BuildContext context) {
    // if (height < 700) {
    //   height = 700 / 100;
    // }
    
    return Container(
 
      child: TextFormField(
       
        maxLines: widget.maxLines,
        onFieldSubmitted: widget.submitted,
        onSaved: widget.saved,
        focusNode: widget.focusNode,
        textInputAction: widget.textInputAction,
        obscureText: widget.secure,
        readOnly: widget.readOnly,
        keyboardType: widget.type,
        controller: widget.inputController,
        validator: (value) {
          var error = widget.validatior(value);
          if (error != null) {
            setState(() {
              isError = true;
            });
          } else {
            setState(() {
              isError = false;
            });
          }

          return error;
        },
        style: const TextStyle(color: Colors.black),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.zero,
          prefixIcon:widget.prefix,
          suffixIcon: IconButton(
            icon: Icon(
              widget.suffix,
              color: Colors.white,
            ),
            onPressed: widget.suffixPress as Function()?,
          ),
          fillColor: Colors.white,
          // contentPadding: const EdgeInsets.all(5),
          hintStyle: const TextStyle(color: Color.fromRGBO(168, 167, 167, 1), fontSize: 12),
          hintText: widget.hinntText,
          focusedBorder: 
          OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide:  BorderSide(color: Colors.grey.withOpacity(0.5), width: 1.0),
          ),
          enabledBorder: 
          OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide:  BorderSide(color: Colors.grey.withOpacity(0.5), width: 1.0),
          ),
          errorBorder:
           OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.red, width: 1.0),
          ),
          focusedErrorBorder:
          OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.red, width: 1.0),
          ),
          errorStyle: Theme.of(context).textTheme.caption!.copyWith(
                color: Colors.red,
                fontSize: 11,
              ),
        ),
      ),
    );
  }
}
