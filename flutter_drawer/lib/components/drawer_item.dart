import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  final void Function()? onTap;
  final IconData leading;
  final String title;
  const DrawerItem(
      {Key? key, this.onTap, required this.leading, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 15.0),
      onTap: onTap,
      leading: Icon(leading),
      title: Text(title),
    );
  }
}
