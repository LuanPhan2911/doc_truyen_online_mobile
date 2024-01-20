import 'package:doc_truyen_online_mobile/app/story_filter_provider.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StoryFilter extends StatefulWidget {
  final Function(String? sortBy)? setSorBy;
  final Function(int? view)? setView;
  const StoryFilter({
    super.key,
    this.setSorBy,
    this.setView,
  });

  @override
  State<StoryFilter> createState() => _StoryFilterState();
}

class _StoryFilterState extends State<StoryFilter> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var storyFilterProvider =
        Provider.of<StoryFilterProvider>(context, listen: false);
    return SingleChildScrollView(
      child: Consumer<StoryFilterProvider>(
        builder: (context, value, child) {
          var sorByList = value.sorByList;
          var viewList = value.viewList;
          return Container(
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ListTile(
                  title: Text(
                    "Sắp xếp",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                ),
                Wrap(
                  spacing: 5,
                  children: sorByList
                      .map((item) => FilterChip(
                            label: Text(item['label']),
                            showCheckmark: false,
                            onSelected: (selected) {
                              widget.setSorBy!(item['value']);

                              var newSortByList = sorByList.map((chip) {
                                return {
                                  "label": chip['label'],
                                  "value": chip['value'],
                                  "isSelected": item == chip ? true : false,
                                };
                              }).toList();
                              storyFilterProvider.changeSortList(newSortByList);
                            },
                            selected: item['isSelected'],
                          ))
                      .toList(),
                ),
                const ListTile(
                  title: Text(
                    "Góc nhìn",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                ),
                Wrap(
                  spacing: 5,
                  children: viewList
                      .map((item) => FilterChip(
                            label: Text(item['label']),
                            showCheckmark: false,
                            onSelected: (selected) {
                              widget.setView!(item['value']);
                              var newViewList = viewList.map((each) {
                                return {
                                  "label": each['label'],
                                  "value": each['value'],
                                  "isSelected": item == each ? true : false,
                                };
                              }).toList();
                              storyFilterProvider.changeViewList(newViewList);
                            },
                            selected: item['isSelected'],
                          ))
                      .toList(),
                ),
              ],
            ),
          );
        },
      ),
    );
    ;
  }
}
