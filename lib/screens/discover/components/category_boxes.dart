import 'package:flutter/material.dart';

class CategoryBoxes extends StatelessWidget {
  final Function()? onTap;
  final String? text;
  final Color? color;

  const CategoryBoxes({Key? key, this.onTap, this.color, this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () => onTap!(),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: color,
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0,1),
                blurRadius: 2
              ),
            ],
          ),
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Text(text!, style: TextStyle(color: Colors.white, fontSize:  16, fontWeight: FontWeight.w500), textAlign: TextAlign.center,),
            ),
          ),
        ),
      ),
    );
  }
}








