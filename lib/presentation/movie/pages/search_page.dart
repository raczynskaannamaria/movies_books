import 'package:flutter/material.dart';
import 'package:movies_books/core/resources/app_colors.dart';
import 'package:movies_books/core/widgets/search_result.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: AppColor.waterloo),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(15),
            child: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 20),
                filled: true,
                fillColor: Colors.white,
                hintText: 'Find a movie',
                hintStyle: TextStyle(color: AppColor.cello, fontSize: 15),
                prefixIcon:
                    Icon(Icons.search_off_outlined, color: AppColor.cello),
              ),
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                });
              },
            ),
          ),
          Expanded(
              child: _searchQuery.isEmpty
                  ? const Center(
                      child: Text(
                        "Enter a search",
                        style: TextStyle(fontSize: 14.0),
                      ),
                    )
                  : ListView.builder(
                      itemBuilder: (BuildContext context, int index) {
                      return SearchResult();
                    }))
        ],
      ),
    );
  }
}
