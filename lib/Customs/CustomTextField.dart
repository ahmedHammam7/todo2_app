import 'package:flutter/material.dart';


class CustomFormTextField extends StatelessWidget {
  const CustomFormTextField({this.label,this.keyboard,this.onchanged,this.obsecure=false, this.onssaved,this.icon,this.controller,this.ontab}) ;
  final String? label;
  final IconData? icon;
  final  TextInputType? keyboard;
  final  Function(String)?onchanged;
  final bool obsecure;
  final void Function()?ontab;
  final void Function(String?)? onssaved;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style:const TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
      obscureText: obsecure,
      onSaved:onssaved ,
      onTap: ontab,
      controller:controller ,
      validator: (value) {
        if(value!.isEmpty){
          return"field is required";}
      },
      onChanged:onchanged ,
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        prefixIconColor: Colors.white,
    focusedBorder: UnderlineInputBorder(
    borderRadius: BorderRadius.circular(25.0),
    borderSide:const BorderSide(
    color:  Color(0xffeb06ff),
    ),),
      enabledBorder: UnderlineInputBorder(
        borderRadius: BorderRadius.circular(25.0),
        borderSide:const BorderSide(
          color:  Color(0xffeb06ff),
        ),),
        label: Text(
          "$label",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.w400,

          ),
        ),),
      keyboardType: keyboard,
    );
  }
}
