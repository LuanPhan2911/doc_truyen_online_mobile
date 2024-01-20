import 'package:doc_truyen_online_mobile/app/story_filter_provider.dart';
import 'package:doc_truyen_online_mobile/components/story/filter_page/story_filter_item.dart';
import 'package:doc_truyen_online_mobile/data/utils/story_filter_value.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StoryFilter extends StatefulWidget {
  final void Function(dynamic value, int type) setSelected;
  const StoryFilter({
    super.key,
    required this.setSelected,
  });

  @override
  State<StoryFilter> createState() => _StoryFilterState();
}

class _StoryFilterState extends State<StoryFilter> {
  @override
  void initState() {
    super.initState();
    Provider.of<StoryFilterProvider>(context, listen: false).getGenres();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<StoryFilterProvider>(
      builder: (context, value, child) {
        return Container(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                StoryFilterItem(
                  filterItem: value.sorByList,
                  filterType: StoryFilterValue.sort,
                  title: "Sắp xếp",
                  setSelectedFilter: (value) {
                    widget.setSelected(value, StoryFilterValue.sort);
                  },
                ),
                StoryFilterItem(
                  filterItem: value.viewList,
                  filterType: StoryFilterValue.view,
                  title: "Góc nhìn",
                  setSelectedFilter: (value) {
                    widget.setSelected(value, StoryFilterValue.view);
                  },
                ),
                StoryFilterItem(
                  title: "Thể loại",
                  filterItem: value.categoryList,
                  filterType: StoryFilterValue.category,
                  setSelectedFilter: (value) {
                    widget.setSelected(value, StoryFilterValue.category);
                  },
                ),
                StoryFilterItem(
                  title: "Tính cách nhân vật",
                  filterItem: value.characterList,
                  filterType: StoryFilterValue.character,
                  setSelectedFilter: (value) {
                    widget.setSelected(value, StoryFilterValue.character);
                  },
                ),
                StoryFilterItem(
                  title: "Bối cảnh thế giới",
                  filterItem: value.worldBuildingList,
                  filterType: StoryFilterValue.world,
                  setSelectedFilter: (value) {
                    widget.setSelected(value, StoryFilterValue.world);
                  },
                ),
                StoryFilterItem(
                  title: "Lưu phái",
                  filterItem: value.tagList,
                  filterType: StoryFilterValue.tag,
                  setSelectedFilter: (value) {
                    widget.setSelected(value, StoryFilterValue.tag);
                  },
                ),
              ],
            ));
      },
    );
    ;
  }
}
