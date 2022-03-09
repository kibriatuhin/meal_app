import 'package:flutter/material.dart';
class SwitchListStyle extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool currentValue;
  final Function(bool newValue) updateValue;
  const SwitchListStyle({Key? key,required this.title,required this.subtitle,required this.currentValue,required this.updateValue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SwitchListTile(
      title: Text(
        title,
        style: TextStyle(color: Colors.black),
      ),
      subtitle: Text(subtitle),
      value: currentValue,
      onChanged:  updateValue,
    );
  }
}
