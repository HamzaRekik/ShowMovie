import 'package:flutter/material.dart';

import '../widgets/app_drawer.dart';

class FilterScreen extends StatefulWidget {
  final Function saveFilters;
  final Map<String, bool> filters;
  const FilterScreen(this.filters, this.saveFilters, {super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _Summer = false;
  var _Winter = false;
  var _Family = false;

  @override
  void initState() {
    _Summer = widget.filters['summer']!;
    _Winter = widget.filters['winter']!;
    _Family = widget.filters['summer']!;
    super.initState();
  }

  Widget switchListTileMethod(
      String title, String subTitle, var val, Function functionn) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subTitle),
      value: val,
      onChanged: (value) => functionn(value),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.blue[400],
        title: const Text(
          'Filters',
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 22,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: const Icon(Icons.save),
              onPressed: () {
                final selectedFilter = {
                  'summer': _Summer,
                  'winter': _Winter,
                  'family': _Family,
                };
                widget.saveFilters(selectedFilter);
              },
            ),
          ),
        ],
      ),
      drawer: const AppDrawer(),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                switchListTileMethod("Summer Excursions",
                    "Show the trips in the summer only", _Summer, (value) {
                  setState(() {
                    _Summer = value;
                  });
                }),
                switchListTileMethod("Winter Excursions",
                    "Show the trips in the Winter only", _Winter, (value) {
                  setState(() {
                    _Winter = value;
                  });
                }),
                switchListTileMethod("Family Excursions",
                    "Show the trips in the family only", _Family, (value) {
                  setState(() {
                    _Family = value;
                  });
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
