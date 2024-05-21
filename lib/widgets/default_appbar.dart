import 'package:flutter/material.dart';

class DefaultAppbar extends StatelessWidget
    implements PreferredSizeWidget {
  const DefaultAppbar({
    super.key,
    this.title,
    this.leading,
  });

  final String? title;
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFFFAFAFC),
      elevation: 1,
      centerTitle: true,
      leading: leading,
      title: titleWidget,
    );
  }

  Widget? get titleWidget {
    if (title == null) return null;
    return Text(
      title!,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 16,
        fontWeight: FontWeight.w700,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
