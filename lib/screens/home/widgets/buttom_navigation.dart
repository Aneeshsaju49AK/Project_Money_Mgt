import 'package:flutter/material.dart';
import 'package:money_management_flutter/screens/home/screen_home.dart';

class MoneyManagerButtomNavigation extends StatelessWidget {
  const MoneyManagerButtomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: ScreenHome.selectedIndexNotifier,
      builder: (context, updatedIndex, child) {
        return BottomNavigationBar(
          selectedItemColor: Colors.purple,
          unselectedItemColor: Colors.grey,
          currentIndex: updatedIndex,
          onTap: (newIndex) {
            ScreenHome.selectedIndexNotifier.value = newIndex;
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home), label: 'Transactions'),
            BottomNavigationBarItem(
                icon: Icon(Icons.category), label: 'Category'),
          ],
        );
      },
    );
  }
}
