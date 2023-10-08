import 'package:flutter/material.dart';

class CustomSearchTextField extends StatelessWidget {
  final TextEditingController searchController;
  final String labelName;
  final VoidCallback searchSubmit;
  const CustomSearchTextField({
    super.key,
    required this.searchController,
    required this.labelName,
    required this.searchSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.blue,
      controller: searchController,
      style: const TextStyle(
        color: Colors.white,
      ),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(left: 20),
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(
            color: Colors.white,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(
            color: Colors.blue,
            width: 2,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(
            color: Colors.white,
          ),
        ),
        label: Text(
          labelName,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        suffixIcon: InkWell(
          onTap: () {
            if (searchController.text.isNotEmpty) {
              searchSubmit();
            } else {}
          },
          child: const Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
