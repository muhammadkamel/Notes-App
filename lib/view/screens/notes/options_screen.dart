import 'package:flutter/material.dart';

class OptionsScreen extends StatefulWidget {
  const OptionsScreen({Key? key}) : super(key: key);

  @override
  State<OptionsScreen> createState() => _OptionsScreenState();
}

class _OptionsScreenState extends State<OptionsScreen> {
  late bool _isLocalDatabase;

  @override
  void initState() {
    super.initState();
    _isLocalDatabase = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Options"),
      ),
      body: Column(
        children: [
          const SizedBox(height: 14),
          ListTile(
            title: const Text("User Local Database"),
            subtitle: const Text(
              "Instead of using HTTP call to work with the app data, please use SQLite for this.",
            ),
            trailing: Switch(
              value: _isLocalDatabase,
              onChanged: (switchVal) {
                setState(() {
                  _isLocalDatabase = !_isLocalDatabase;
                });
              },
            ),
          ),
          const Divider(
            thickness: 1.7,
          ),
        ],
      ),
    );
  }
}
