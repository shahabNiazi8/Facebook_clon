import 'package:facebook_clon/Screen/Home_Screen.dart';
import 'package:facebook_clon/data/data.dart';
import 'package:facebook_clon/widgets/custom_app_bar.dart';
import 'package:facebook_clon/widgets/custom_tapbar.dart';
import 'package:facebook_clon/widgets/responsive.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({super.key});

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  final List<Widget> _screens = [
    const HomeScreen(),
    const Scaffold(),
    const Scaffold(),
    const Scaffold(),
    const Scaffold(),
    const Scaffold(),
  ];
  final List<IconData> _icons = [
    Icons.home,
    Icons.ondemand_video,
    MdiIcons.accountCircleOutline,
    MdiIcons.accountGroupOutline,
    MdiIcons.bellOutline,
    Icons.menu,
  ];
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final Size ScreenSize = MediaQuery.of(context).size;
    return DefaultTabController(
      length: _icons.length,
      child: Scaffold(
          appBar: Responsive.isDesktop(context)
              ? PreferredSize(
                  preferredSize: Size(ScreenSize.width, 1000),
                  child: CustomAppBar(
                      currentUser: currentUser,
                      icons: _icons,
                      selectedIndex: _selectedIndex,
                      onTap: (index) => setState(() => _selectedIndex = index)),
                )
              : null,
          body: IndexedStack(
            index: _selectedIndex,
            children: _screens,
          ),
          bottomNavigationBar: !Responsive.isDesktop(context)
              ? Container(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: CustomTabBar(
                        icons: _icons,
                        selectedIndex: _selectedIndex,
                        onTap: (index) =>
                            setState(() => _selectedIndex = index)),
                  ),
                )
              : const SizedBox.shrink()),
    );
  }
}
