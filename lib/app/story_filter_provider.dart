import 'package:flutter/material.dart';

class StoryFilterProvider extends ChangeNotifier {
  List<Map<String, dynamic>> viewList = [
    {
      "label": "Tất cả",
      "value": 0,
      "isSelected": true,
    },
    {
      "label": "Truyện Nam",
      "value": 1,
      "isSelected": false,
    },
    {
      "label": "Truyện Nữ",
      "value": 2,
      "isSelected": false,
    },
    {
      "label": "Khác",
      "value": 3,
      "isSelected": false,
    },
  ];
  List<Map<String, dynamic>> sorByList = [
    {
      "label": "Mới nhất",
      "value": "newest_updated",
      "isSelected": true,
    },
    {
      "label": "Đề cử",
      "value": "favorite",
      "isSelected": false,
    },
    {
      "label": "Mới đăng",
      "value": "newest_created",
      "isSelected": false,
    },
  ];

  void changeSortList(List<Map<String, dynamic>> sorByList) {
    this.sorByList = sorByList;
    notifyListeners();
  }

  void changeViewList(List<Map<String, dynamic>> viewList) {
    this.viewList = viewList;
    notifyListeners();
  }

  void changeSelectedSortBy(String value) {
    sorByList = sorByList
        .map((e) => {
              "label": e['label'],
              "value": e['value'],
              "isSelected": e['value'] == value ? true : false,
            })
        .toList();
    notifyListeners();
  }

  dynamic getSelected(List<Map<String, dynamic>> list) {
    var firstElement = list.firstWhere(
      (element) => element['isSelected'],
      orElse: () {
        return list[0];
      },
    );
    return firstElement['value'];
  }
}
