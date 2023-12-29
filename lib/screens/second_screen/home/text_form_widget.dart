import 'package:flutter/material.dart';

class TextFormWidget extends StatelessWidget {
  TextFormWidget({super.key});

  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode=FocusNode();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 335,
      height: 52,
      child: TextFormField(
        controller: _searchController,
        focusNode: _searchFocusNode,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.search,
        onEditingComplete: () {
          FocusManager.instance.primaryFocus!.unfocus();
        },
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color(0xFFF3F8FE),
          prefixIcon: const Icon(
            Icons.search,
            color:Color(0xffB8B8B8),
            size: 25,
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(24),
              borderSide: BorderSide.none),
          hintText: "Find things to do",
          hintStyle: const TextStyle(color: Color(0xffB8B8B8), fontSize: 13),
        ),
      ),
    );
  }
}
