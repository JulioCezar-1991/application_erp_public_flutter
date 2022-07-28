import 'package:flutter/material.dart';

PreferredSizeWidget appBar() {
  return AppBar(
    automaticallyImplyLeading: false,
    title: const Text("Teste"),
    actions: <Widget>[
      IconButton(
        icon: const Icon(Icons.refresh),
        onPressed: () {},
      ),
      IconButton(
        icon: const Icon(Icons.menu),
        onPressed: () {},
      ),
    ],
  );
}
