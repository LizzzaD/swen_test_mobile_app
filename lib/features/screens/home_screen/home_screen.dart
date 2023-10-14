import 'package:flutter/material.dart';

import '../../../core/extension/build_context_extension.dart';
import '../../../core/images/svg_icons.dart';
import 'pages/main_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // here it's ok
  // ignore: avoid-late-context
  late final _tabs = [
    Center(
      child: Text(
        '1',
        style: context.styles.regular72.copyWith(
          color: context.colors.green,
        ),
      ),
    ),
    Center(
      child: Text(
        '2',
        style: context.styles.regular72.copyWith(
          color: context.colors.green,
        ),
      ),
    ),
    const MainPage(),
    Center(
      child: Text(
        '4',
        style: context.styles.regular72.copyWith(
          color: context.colors.green,
        ),
      ),
    ),
    Center(
      child: Text(
        '5',
        style: context.styles.regular72.copyWith(
          color: context.colors.green,
        ),
      ),
    ),
  ];

  int _currentIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 6),
        child: _tabs[_currentIndex],
      ),
      bottomNavigationBar: Theme(
        data: ThemeData(
          canvasColor: context.colors.backgroundColor,
          splashColor: context.colors.white,
        ),
        child: BottomNavigationBar(
          items: [
            _currentIndex == 0
                ? BottomNavigationBarItem(
                    icon: SizedBox(
                      width: 22,
                      height: 22,
                      child: SVGIcon.group.build(color: context.colors.purple),
                    ),
                    label: '3',
                  )
                : BottomNavigationBarItem(
                    icon: SizedBox(
                      width: 16,
                      height: 16,
                      child: SVGIcon.group.build(
                        color: context.colors.grey,
                      ),
                    ),
                    label: '3',
                  ),
            _currentIndex == 1
                ? BottomNavigationBarItem(
                    icon: SizedBox(
                      width: 22,
                      height: 22,
                      child: SVGIcon.book.build(color: context.colors.purple),
                    ),
                    label: '3',
                  )
                : BottomNavigationBarItem(
                    icon: SizedBox(
                      width: 16,
                      height: 16,
                      child: SVGIcon.book.build(
                        color: context.colors.grey,
                      ),
                    ),
                    label: '3',
                  ),
            _currentIndex == 2
                ? BottomNavigationBarItem(
                    icon: SizedBox(
                      width: 22,
                      height: 22,
                      child: SVGIcon.main_page_icon.build(color: context.colors.purple),
                    ),
                    label: '3',
                  )
                : BottomNavigationBarItem(
                    icon: SizedBox(
                      width: 16,
                      height: 16,
                      child: SVGIcon.main_page_icon.build(color: context.colors.grey),
                    ),
                    label: '3',
                  ),
            _currentIndex == 3
                ? BottomNavigationBarItem(
                    icon: SizedBox(
                      width: 22,
                      height: 22,
                      child: SVGIcon.leaf.build(color: context.colors.purple),
                    ),
                    label: '3',
                  )
                : BottomNavigationBarItem(
                    icon: SizedBox(
                      width: 16,
                      height: 16,
                      child: SVGIcon.leaf.build(color: context.colors.grey),
                    ),
                    label: '3',
                  ),
            _currentIndex == 4
                ? BottomNavigationBarItem(
                    icon: SizedBox(
                      width: 22,
                      height: 22,
                      child: SVGIcon.account.build(color: context.colors.purple),
                    ),
                    label: '3',
                  )
                : BottomNavigationBarItem(
                    icon: SizedBox(
                      width: 16,
                      height: 16,
                      child: SVGIcon.account.build(color: context.colors.grey),
                    ),
                    label: '3',
                  ),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          currentIndex: _currentIndex,
          elevation: 0,
          selectedFontSize: 20,
          showSelectedLabels: false,
          showUnselectedLabels: false,
        ),
      ),
      backgroundColor: context.colors.backgroundColor,
    );
  }
}
