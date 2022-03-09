import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';
import 'package:meals_app/widgets/switchListTile.dart';

class FilterScreens extends StatefulWidget {
  static const routeName = "/filter";
  final  Function saveFilters;
  final Map<String , bool> currentFilters;

  const FilterScreens({Key? key,required this.saveFilters,required this.currentFilters}) : super(key: key);




  @override
  State<FilterScreens> createState() => _FilterScreensState();
}

class _FilterScreensState extends State<FilterScreens> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegab = false;
  bool _lactoseFree = false;

  @override
  void initState() {
    _glutenFree = widget.currentFilters['gluten']!;
    _vegetarian = widget.currentFilters['vegetarian']!;
    _vegab = widget.currentFilters['vegan']!;
    _lactoseFree = widget.currentFilters['lactose']!;
  }

  /*Widget _buildSwitchListTile(
      String title, String subtitle, bool currentValue,  Function updateValue) {
    return;
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filters"),
        actions: [
          IconButton(onPressed: (){
            final selectedFilters = {
              'gluten' :_glutenFree,
              'lactose' : _lactoseFree,
              'vegan' : _vegab,
              'vegetarian' :_vegetarian,
            };
            widget.saveFilters(selectedFilters);
          }, icon: Icon(Icons.save))
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              "Adjust your meal selection",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.subtitle2,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              SwitchListStyle(
                  title: "Gluten-free",
                  subtitle: "Only include gluten-free meals",
                  currentValue: _glutenFree,
                  updateValue: (newValue) {
                    setState(() {
                      _glutenFree = newValue;
                    });
                  }),
              SwitchListStyle(
                  title: "Lactose-free",
                  subtitle: "Only include Lactose-free meals",
                  currentValue: _lactoseFree,
                  updateValue: (newValue) {
                    setState(() {
                      _lactoseFree = newValue;
                    });
                  }),
              SwitchListStyle(
                  title: "Vegetarian",
                  subtitle: "Only include vegetarian meals",
                  currentValue: _vegetarian,
                  updateValue: (newValue) {
                    setState(() {
                      _vegetarian = newValue;
                    });
                  }),
              SwitchListStyle(
                  title: "Vegan",
                  subtitle: "Only include Vegan meals",
                  currentValue: _vegab,
                  updateValue: (newValue) {
                    setState(() {
                      _vegab = newValue;
                    });
                  })
            ],
          ))
        ],
      ),
    );
  }
}
