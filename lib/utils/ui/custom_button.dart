import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustButton extends StatelessWidget {
  final Widget buttonChild;
  final GestureTapCallback onTap;
  final double ? width;


  const CustButton(
      {super.key,
      required this.buttonChild,
      required this.onTap,
       this.width,
      });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: width??90.w,
        height: 52,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: const LinearGradient(
            colors: <Color>[Color(0xff176ef2), Color(0xff186eee)],
            stops: <double>[0, 1],
          ),
          boxShadow: const [
            BoxShadow(
              color: Color(0x141c18f2),
              offset: Offset(0, 4),
              blurRadius: 16.5,
            ),
          ],
        ),
        child: buttonChild,
      ),
    );
  }
}
