import 'package:flutter/material.dart';

class SearchView extends StatefulWidget {
  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: SizedBox(
            height: 40,
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SearchBar(
              hintText: 'Search movie..',
              leading: Icon(
                Icons.search,
                size: 25,
              ),
            ),
          ),
        ),
        SliverList(
          delegate:
              SliverChildBuilderDelegate(childCount: 90, (context, index) {
            return Text("movie n1");
          }),
        ),
      ],
    ));
  }
}
