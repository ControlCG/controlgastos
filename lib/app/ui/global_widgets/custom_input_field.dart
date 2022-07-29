import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//Diseño de cajas de texto
class CustomInutField extends StatefulWidget {
  final void Function(String)? onChanged;
  final String label;
  final Icon icon;
  final TextInputType? inputType;
  final bool isPassword;
  final String? Function(String?)? validator;
  CustomInutField({Key? key, required this.onChanged, required this.label, this.inputType, this.isPassword=false, this.validator, required this.icon,
  }) : super(key: key);

  @override
  State<CustomInutField> createState() => _nameState();
}

class _nameState extends State<CustomInutField> {
late bool _obscureText;

@override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return FormField<String>(
      validator: widget.validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      builder: (state){
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
          obscureText:_obscureText ,
          keyboardType: widget.inputType,
          onChanged: (text){
            if(widget.validator!=null){
              // ignore: invalid_use_of_protected_member
              state.setValue(text);
              state.validate();
            }
            if(widget.onChanged!=null){
              widget.onChanged!(text);
            }
          },
          decoration: InputDecoration(
            labelText: widget.label,
              border: const OutlineInputBorder(),
              suffixIcon: widget.isPassword? CupertinoButton(
                child: Icon(_obscureText? Icons.visibility : Icons.visibility_off,
                ),
                onPressed:(){
                  _obscureText=!_obscureText;
                  setState(() {});
              },
            )
            :Container(
              width: 0,
            ),
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                borderSide: BorderSide(color: Colors.transparent),
              ),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                borderSide: BorderSide(color: Colors.blue),
              ),
              prefixIcon: widget.icon,
              fillColor: Colors.grey[200],
              filled: true,
          ),
    ),
      if(state.hasError)Text(state.errorText!,
      style: const TextStyle(color: Colors.redAccent),
      )
        ],
      );
    }
  );
  }
}