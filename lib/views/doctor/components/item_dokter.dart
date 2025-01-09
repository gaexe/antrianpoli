import 'package:flutter/material.dart';

Widget itemDokter() {
  return Container(
    color: Colors.white.withOpacity(0.8),
    margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
    child: const ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(
        Icons.account_box,
        size: 52,
      ),
      title: Text("dr. Johnson Lestaro Tank, Msi., Med."),
      subtitle: Text("D120039333"),
    ),
  );
}
