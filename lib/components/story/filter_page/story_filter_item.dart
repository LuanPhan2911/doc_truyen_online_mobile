import 'package:doc_truyen_online_mobile/app/story_filter_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StoryFilterItem extends StatelessWidget {
  const StoryFilterItem(
      {super.key,
      required this.filterItem,
      required this.filterType,
      required this.title,
      required this.setSelectedFilter});
  final List filterItem;
  final int filterType;
  final String title;
  final void Function(dynamic value) setSelectedFilter;

  @override
  Widget build(BuildContext context) {
    var storyFilterProvider =
        Provider.of<StoryFilterProvider>(context, listen: false);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          title: Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
        ),
        Wrap(
          spacing: 5,
          children: filterItem
              .map((item) => FilterChip(
                    label: Text(
                      item['label'],
                    ),
                    showCheckmark: false,
                    onSelected: (selected) {
                      setSelectedFilter(item['value']);
                      var newList = filterItem.map((each) {
                        return {
                          "label": each['label'],
                          "value": each['value'],
                          "isSelected": item == each ? true : false,
                        };
                      }).toList();
                      storyFilterProvider.changeFilter(newList, filterType);
                    },
                    selected: item['isSelected'],
                  ))
              .toList(),
        ),
      ],
    );
  }
}
