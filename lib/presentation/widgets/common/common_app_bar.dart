part of 'common_scaffold.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CommonAppBar({
    super.key,
    required this.pageTitle,
  });

  final String pageTitle;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(
        pageTitle,
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w600,
          color: context.primaryColor,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
