import 'package:flutter/material.dart';
import '../widget/app_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const filterRoute = '/filter';

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _isInSummer = false;
  var _isInWinter = false;
  var _isForFamily = false;

  Widget buildSwitchListTile(
      String title, String subTilte, var currentValue, dynamic updateValue) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subTilte),
      value: currentValue,
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('صفحة الفلتره'),
      ),
      drawer: AppDrawer(),
      body: Center(
        child: Column(children: [
          SizedBox(
            height: 50,
          ),
          Expanded(
            child: ListView(
              children: [
                buildSwitchListTile(
                  'الرحلات الصيفية',
                  'الرحلات الصيفية فقط',
                  _isInSummer,
                  (newValue) {
                    setState(() {
                      _isInSummer = newValue;
                    });
                  },
                ),
                buildSwitchListTile(
                  'الرحلات الشتوية',
                  'الرحلات الشتوية فقط',
                  _isInWinter,
                  (newValue) {
                   setState(() {
                      _isInWinter = newValue;
                   });
                  },
                ),
                buildSwitchListTile(
                  'الرحلات العائلية',
                  'الرحلات العائلية فقط',
                  _isForFamily,
                  (newValue) {
                    setState(() {
                      _isForFamily = newValue;
                    });
                  },
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
