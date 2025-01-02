import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  final ValueChanged<String> onSearchChanged; // Callback for search input
  final String hintText;

  const SearchBarWidget({
    Key? key,
    required this.onSearchChanged,
    this.hintText = 'Search...',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),

        ),
        prefixIcon: Icon(Icons.search),
        suffixIcon: IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            onSearchChanged(''); // Clear the search input
          },
        ),
      ),
      onChanged: onSearchChanged, // Notify parent about query changes
    );
  }
}
