import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:money_management_flutter/model/category/category_model.dart';
import 'package:money_management_flutter/screens/category/widget/income_categorylist.dart';

const CATEGORY_DB_NAME = 'category-database';

abstract class CategoryDbFunction {
  Future<List<CategoryModel>> getCategories();
  Future<void> insertCategory(CategoryModel value);
}

class CategoryDB implements CategoryDbFunction {
  CategoryDB._internal();

  static CategoryDB instance = CategoryDB._internal();
  factory CategoryDB() {
    return instance;
  }
  ValueNotifier<List<CategoryModel>> incomeCategoryListListener =
      ValueNotifier([]);
  ValueNotifier<List<CategoryModel>> expenseCategoryListListener =
      ValueNotifier([]);

  @override
  Future<void> insertCategory(CategoryModel value) async {
    final _categoryDB = await Hive.openBox<CategoryModel>(CATEGORY_DB_NAME);
    _categoryDB.add(value);
    refreshUi();
  }

  @override
  Future<List<CategoryModel>> getCategories() async {
    final _categoryDB = await Hive.openBox<CategoryModel>(CATEGORY_DB_NAME);
    return _categoryDB.values.toList();
  }

  Future<void> refreshUi() async {
    final _allCategories = await getCategories();
    incomeCategoryListListener.value.clear();
    expenseCategoryListListener.value.clear();
    await Future.forEach(
      _allCategories,
      (CategoryModel category) {
        if (category.type == CategoryType.income) {
          incomeCategoryListListener.value.add(category);
        } else {
          expenseCategoryListListener.value.add(category);
        }
      },
    );
    incomeCategoryListListener.notifyListeners();
    expenseCategoryListListener.notifyListeners();
  }
}
