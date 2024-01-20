import 'package:dio/dio.dart';
import 'package:doc_truyen_online_mobile/data/models/genre.dart';
import 'package:doc_truyen_online_mobile/data/utils/story_filter_value.dart';
import 'package:doc_truyen_online_mobile/services/genre_service.dart';
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
  List<Map<String, dynamic>> categoryList = [];
  List<Map<String, dynamic>> characterList = [];
  List<Map<String, dynamic>> worldBuildingList = [];
  List<Map<String, dynamic>> tagList = [];

  void changeFilter(List<Map<String, dynamic>> list, int type) {
    switch (type) {
      case StoryFilterValue.view:
        viewList = list;
        break;
      case StoryFilterValue.sort:
        sorByList = list;
        break;
      case StoryFilterValue.character:
        characterList = list;
        break;
      case StoryFilterValue.category:
        categoryList = list;
        break;
      case StoryFilterValue.world:
        worldBuildingList = list;
        break;
      case StoryFilterValue.tag:
        tagList = list;
        break;
      default:
    }
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

  dynamic getFilterSelected(int type) {
    List selectedList;
    switch (type) {
      case StoryFilterValue.view:
        selectedList = viewList;
        break;
      case StoryFilterValue.sort:
        selectedList = sorByList;
        break;
      case StoryFilterValue.character:
        selectedList = categoryList;
        break;
      case StoryFilterValue.category:
        selectedList = categoryList;
        break;
      case StoryFilterValue.world:
        selectedList = worldBuildingList;
        break;
      case StoryFilterValue.tag:
        selectedList = tagList;
        break;
      default:
        return null;
    }
    var firstElement = selectedList.firstWhere(
      (element) {
        return element['isSelected'];
      },
      orElse: () => {
        "value": null,
      },
    );
    return firstElement['value'];
  }

  Future<void> getGenres() async {
    try {
      Response res = await GenreService.getGenres();
      if (res.statusCode == 200) {
        var data = res.data['data'];
        var categories = Genre.castGenres(data['CATEGORY']);
        var characters = Genre.castGenres(data['CHARACTER']);
        var world = Genre.castGenres(data['WORLD']);
        var tags = Genre.castGenres(data['TAG']);

        categoryList = Genre.getFilterGenres(categories);
        characterList = Genre.getFilterGenres(characters);
        worldBuildingList = Genre.getFilterGenres(world);
        tagList = Genre.getFilterGenres(tags);
        notifyListeners();
      }
    } catch (e) {}
  }
}
