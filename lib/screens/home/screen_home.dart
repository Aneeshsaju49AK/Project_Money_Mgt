import 'package:flutter/material.dart';
import 'package:money_management_flutter/screens/category/screen_category.dart';
import 'package:money_management_flutter/screens/category/widget/category_add_popup.dart';
import 'package:money_management_flutter/screens/home/widgets/buttom_navigation.dart';
import 'package:money_management_flutter/screens/transactions/screen_transations.dart';

class ScreenHome extends StatelessWidget {
  ScreenHome({super.key});

  static ValueNotifier<int> selectedIndexNotifier = ValueNotifier(0);

  final _pages = [
    ScreenTransation(),
    ScreenCategory(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'MONEY MANAGER',
        ),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      bottomNavigationBar: MoneyManagerButtomNavigation(),
      body: SafeArea(
        child: SizedBox(
          child: ValueListenableBuilder(
            valueListenable: selectedIndexNotifier,
            builder: (context, updatedIndex, _) {
              return _pages[updatedIndex];
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (selectedIndexNotifier.value == 0) {
            print('Add transactions');
          } else {
            print('Add Category');
            showCategoryAddPopup(context);
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
