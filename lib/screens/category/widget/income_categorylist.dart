import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:money_management_flutter/database/category/category_db.dart';

class IncomeCategoryList extends StatelessWidget {
  const IncomeCategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: CategoryDB().incomeCategoryListListener,
      builder: (context, newlist, child) {
        return ListView.separated(
            itemBuilder: (context, index) {
              final category = newlist[index];
              return Card(
                child: ListTile(
                  title: Text(category.name),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {},
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox();
            },
            itemCount: newlist.length);
      },
    );
  }
}
