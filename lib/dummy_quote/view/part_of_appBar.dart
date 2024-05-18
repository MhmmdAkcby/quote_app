part of 'home_view.dart';

class _PartOfAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _PartOfAppBar({
    super.key,
  });
  final String appbarName = 'Quote';
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        appbarName,
        style: const TextStyle(color: ProjectColor.whiteColor),
      ),
      backgroundColor: ProjectColor.tealColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(_WidgetSize()._appBarRadius))),
      actions: [
        IconButton(
            onPressed: () {
              context.read<ThemeNotifer>().chnageTheme();
            },
            icon: Icon(
              context.watch<ThemeNotifer>().isLightTheme ? Icons.nightlight_round_outlined : Icons.sunny,
              color: ProjectColor.whiteColor,
            )),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _WidgetSize {
  final double _appBarRadius = 20;
}
