import 'package:flutter/material.dart';

final homePageAppBar = AppBar(
  title: const Text("Notes app"),
  actions: [
    IconButton(
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12))),
            backgroundColor: MaterialStateProperty.all<Color>(
                Colors.white.withOpacity(0.1))),
        onPressed: () {},
        icon: const Icon(Icons.search))
  ],
);
