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
        child: Padding(
          padding: EdgeInsets.only(right: 10),
          child: Container(
            height: 48,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: color,
              // boxShadow: isSelected ? [
              //   BoxShadow(
              //     color: Color(0xff4A80F0).withOpacity(0.3),
              //     offset: Offset(0,4),
              //     blurRadius: 20
              //   ),
              // ]: [],
            ),
            child: Center(
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: 16, vertical: 13),
                child: Text(text!, style: TextStyle(color: Colors.white, fontSize:  17, fontWeight: FontWeight.normal),),
              ),
            ),
          ),
        ),
      ),
    );
  }
}








