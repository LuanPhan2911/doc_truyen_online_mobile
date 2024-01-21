import 'package:dio/dio.dart';
import 'package:doc_truyen_online_mobile/app/story_filter_provider.dart';
import 'package:doc_truyen_online_mobile/components/story/filter_page/story_filter.dart';
import 'package:doc_truyen_online_mobile/components/story/filter_page/story_search_item.dart';
import 'package:doc_truyen_online_mobile/data/models/genre.dart';
import 'package:doc_truyen_online_mobile/data/models/story.dart';
import 'package:doc_truyen_online_mobile/data/utils/paginator.dart';
import 'package:doc_truyen_online_mobile/data/utils/story_filter_value.dart';
import 'package:doc_truyen_online_mobile/helpers/helper.dart';

import 'package:doc_truyen_online_mobile/services/story_sevice.dart';
import 'package:doc_truyen_online_mobile/styles/app_text.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';

class StorySearchPage extends StatefulWidget {
  final String? name;

  const StorySearchPage({
    super.key,
    this.name,
  });

  @override
  State<StorySearchPage> createState() => _StorySearchPageState();
}

class _StorySearchPageState extends State<StorySearchPage> {
  final _pagingController = PagingController<int, Story>(firstPageKey: 1);
  late String? sortBy;
  late int? view;
  late int? category;
  late int? character;
  late int? world;
  late int? tag;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    var storyFilterProvider =
        Provider.of<StoryFilterProvider>(context, listen: false);
    view = storyFilterProvider.getFilterSelected(StoryFilterValue.view);
    sortBy = storyFilterProvider.getFilterSelected(StoryFilterValue.sort);
    category = storyFilterProvider.getFilterSelected(StoryFilterValue.category);
    character =
        storyFilterProvider.getFilterSelected(StoryFilterValue.character);
    world = storyFilterProvider.getFilterSelected(StoryFilterValue.world);
    tag = storyFilterProvider.getFilterSelected(StoryFilterValue.tag);

    _pagingController.addPageRequestListener((pageKey) {
      fetchStory(pageKey);
    });
  }

  Future<void> fetchStory(int? page) async {
    try {
      Map<String, dynamic> query = {
        "page": page,
        "sort_by": sortBy,
      };
      if (widget.name != null) {
        query.addAll({"name": widget.name});
      }
      if (view != null && view != 0) {
        query.addAll({"view": view});
      }

      List<int> genresId = [];
      if (Genre.isExist(category)) {
        genresId.add(category!);
      }
      if (Genre.isExist(character)) {
        genresId.add(character!);
      }
      if (Genre.isExist(world)) {
        genresId.add(world!);
      }
      if (Genre.isExist(tag)) {
        genresId.add(tag!);
      }
      if (genresId.isNotEmpty) {
        query.addAll({"genres_id": genresId.join(",")});
      }

      Response res = await StoryService.getStories(query);
      var storyPaginate =
          Paginator<Story>.fromJson(res.data['data'], (t) => Story.fromJson(t));

      if (storyPaginate.isLastPage()) {
        _pagingController.appendLastPage(storyPaginate.data);
      } else {
        _pagingController.appendPage(
            storyPaginate.data, storyPaginate.nextPage());
      }
    } catch (e) {
      _pagingController.error = e;
      Helper.logWarning(e);
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            widget.name ?? "Lọc",
            maxLines: 1,
          ),
          actions: [
            IconButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return StoryFilter(setSelected: (value, type) {
                        switch (type) {
                          case StoryFilterValue.view:
                            view = value;
                            break;
                          case StoryFilterValue.sort:
                            sortBy = value;
                            break;
                          case StoryFilterValue.character:
                            character = value;
                            break;
                          case StoryFilterValue.category:
                            category = value;
                            break;
                          case StoryFilterValue.world:
                            world = value;
                            break;
                          case StoryFilterValue.tag:
                            tag = value;
                            break;
                          default:
                        }
                        _pagingController.refresh();
                      });
                    },
                  );
                },
                icon: const Icon(Icons.filter_alt))
          ],
        ),
        body: RefreshIndicator(
          onRefresh: () => Future.sync(
            () => _pagingController.refresh(),
          ),
          child: PagedListView.separated(
            builderDelegate: PagedChildBuilderDelegate<Story>(
              itemBuilder: (context, item, index) {
                return StorySearchItem(
                  story: item,
                );
              },
              noItemsFoundIndicatorBuilder: (context) {
                return const Center(
                  child: Text(
                    "Không tìm thấy truyện phù hợp",
                    style: AppText.title,
                  ),
                );
              },
            ),
            // 4
            pagingController: _pagingController,
            separatorBuilder: (context, index) => const SizedBox(
              height: 8,
            ),
          ),
        ));
  }
}
