
import 'package:flutter/material.dart';

class CustButton extends StatelessWidget {
  final String buttonText;
  final GestureTapCallback onTap;

  const CustButton({super.key, required this.buttonText, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Center(
        child: Container(
          alignment: Alignment.center,
          width: 400,
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
          child: Text(
            buttonText,
            style: const TextStyle(
              fontSize: 25,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
