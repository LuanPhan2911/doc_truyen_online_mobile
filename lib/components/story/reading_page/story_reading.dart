import 'package:dio/dio.dart';
import 'package:doc_truyen_online_mobile/components/story/reading_page/story_reading_item.dart';
import 'package:doc_truyen_online_mobile/data/models/story.dart';
import 'package:doc_truyen_online_mobile/data/utils/paginator.dart';
import 'package:doc_truyen_online_mobile/helpers/helper.dart';
import 'package:doc_truyen_online_mobile/services/user_service.dart';
import 'package:doc_truyen_online_mobile/styles/app_text.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class StoryReading extends StatefulWidget {
  const StoryReading({super.key});

  @override
  State<StoryReading> createState() => _StoryReadingState();
}

class _StoryReadingState extends State<StoryReading> {
  final _pagingController = PagingController<int, Story>(firstPageKey: 1);
  @override
  void initState() {
    super.initState();
    _pagingController.addPageRequestListener((pageKey) {
      fetchStory(pageKey);
    });
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  Future<void> fetchStory(int? page) async {
    try {
      Response res = await UserService.getHistoryReadingPaginate(page);
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
    }
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => Future.sync(
        () => _pagingController.refresh(),
      ),
      child: PagedListView.separated(
        builderDelegate: PagedChildBuilderDelegate<Story>(
          itemBuilder: (context, item, index) {
            return StoryReadingItem(
              story: item,
              deleteStory: (story) {
                if (story != null) {
                  _pagingController.refresh();
                }
              },
            );
          },
          noItemsFoundIndicatorBuilder: (context) {
            return const Center(
              child: Text(
                "Bạn chưa từng đọc truyện nào",
                style: AppText.title,
              ),
            );
          },
        ),
        // 4
        pagingController: _pagingController,
        separatorBuilder: (context, index) => const SizedBox(
          height: 16,
        ),
      ),
    );
  }
}
