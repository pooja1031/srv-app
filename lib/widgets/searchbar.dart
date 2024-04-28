
import 'package:flutter/material.dart';

class SearchBars extends StatefulWidget {
  const SearchBars({super.key});

  @override
  State<SearchBars> createState() => _SearchBarsState();
}

class _SearchBarsState extends State<SearchBars> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search....',
          hintStyle: TextStyle(color: Colors.grey), 
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide.none,
          ),
          suffixIcon: Icon(Icons.search, color: Colors.orange, size: 24), 
         
        ),
      ),
    );
  }
}


