import 'package:film/components/locals/locals.dart';
import 'package:film/presentation/pages/favorite_page.dart';
import 'package:film/presentation/pages/home_screen.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  static const path = '/mainpage';

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<_Tab> _tabs = <_Tab>[
      _Tab(
        icon: const Icon(Icons.ondemand_video),
        label: context.locale.feedTitle,
        page: const HomeScreen(),
      ),
      _Tab(
        icon: const Icon(Icons.favorite),
        label: context.locale.favouritesTitle,
        page: const FavouritesScreen(),
      ),
    ];
    return Scaffold(
      body: _tabs.elementAt(_selectedIndex).page,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: List.generate(
          _tabs.length,
          (index) {
            final _Tab tab = _tabs[index];
            return BottomNavigationBarItem(
              icon: tab.icon,
              label: tab.label,
            );
          },
        ),
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

class _Tab {
  const _Tab({required this.icon, required this.page, required this.label});

  final Icon icon;
  final String label;
  final Widget page;
}
