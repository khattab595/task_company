import 'package:app/src/main_index.dart';

class AppScaffold extends StatelessWidget {
  final String? title;
  final Widget? titleWidget;
  final TextStyle? titleStyle;
  final Widget body;
  final Widget? floatingActionButton;
  final bool? isDrawer;
  final bool? isNotifications;
  final PreferredSizeWidget? appBar;
  final Color? backgroundAppBar;
  final Widget? bottomSheet;
  final Widget? bottomNavigationBar;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final List<Widget>? actions;
  final Widget? leading;

  const AppScaffold(
      {Key? key,
      this.title,
      this.titleWidget,
      required this.body,
      this.floatingActionButton,
      this.isDrawer = false,
      this.isNotifications = false,
      this.appBar,
      this.backgroundAppBar,
      this.bottomSheet,
      this.bottomNavigationBar,
      this.backgroundColor,
      this.actions,
      this.titleStyle,
      this.foregroundColor,
      this.leading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();

    ThemeData theme = Theme.of(context);
    return Scaffold(
      // resizeToAvoidBottomInset: false, // this code remove the keyboard overflow.
      // drawer: isDrawer! ? SideMenuPage(isCaptain: true) : null,
      primary: true,

      //SafeArea to save content from the phone top par.
      body: Scaffold(
        key: globalKey,
        drawerScrimColor: Colors.transparent,
        backgroundColor: backgroundColor ?? theme.scaffoldBackgroundColor,
        body: body,
      ),
      extendBody: true,
      backgroundColor: backgroundColor ?? theme.scaffoldBackgroundColor,
      floatingActionButton: floatingActionButton,
      bottomSheet: bottomSheet,
      bottomNavigationBar: bottomNavigationBar,
      appBar: ((title == null && titleWidget == null) && appBar == null)
          ? null
          : appBar ??
              AppBar(
                title: Text(title ?? '',
                    style: titleStyle ?? theme.appBarTheme.titleTextStyle),
                automaticallyImplyLeading: false,
                backgroundColor:
                    backgroundAppBar ?? theme.appBarTheme.backgroundColor,
                centerTitle: true,
                flexibleSpace: titleWidget,
                foregroundColor:
                    foregroundColor ?? theme.appBarTheme.foregroundColor,
                leadingWidth: 30,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor:
                      backgroundAppBar ?? theme.appBarTheme.backgroundColor,
                  statusBarBrightness: Brightness.light,
                ),
                actions: [
                  if(Navigator.canPop(context))
                  RotatedBox(
                    quarterTurns: 2,
                    child: BackButton(
                      color: context.primaryColor,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ],
                // leading: leading ?? (isDrawer!
                //     ? AppIconButton(
                //   icon: AppIcons.menu,
                //   padding: 10.paddingStart,
                //   onPressed: () {
                //     if (globalKey.currentState?.isDrawerOpen == false) {
                //       globalKey.currentState?.openDrawer();
                //     } else {
                //       globalKey.currentState?.openEndDrawer();
                //     }
                //   },
                // )
                //     : null),
              ),
    );
  }
}
