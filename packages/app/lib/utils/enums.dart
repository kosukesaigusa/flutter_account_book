import 'package:flutter/material.dart';

enum BottomNavigationBarItemEnum {
  home,
  category,
}

extension BottomNavigationBarItemEnumExt on BottomNavigationBarItemEnum {
  String get label {
    switch (this) {
      case BottomNavigationBarItemEnum.home:
        return 'ホーム';
      case BottomNavigationBarItemEnum.category:
        return 'カテゴリー';
    }
  }

  Icon get icon {
    switch (this) {
      case BottomNavigationBarItemEnum.home:
        return const Icon(Icons.home);
      case BottomNavigationBarItemEnum.category:
        return const Icon(Icons.category);
    }
  }
}
