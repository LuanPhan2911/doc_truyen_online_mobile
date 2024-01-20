import 'dart:convert';

import 'package:doc_truyen_online_mobile/data/models/author.dart';
import 'package:doc_truyen_online_mobile/data/models/genre.dart';
import 'package:doc_truyen_online_mobile/data/models/story_user.dart';
import 'package:doc_truyen_online_mobile/pages/story_detail.dart';
import 'package:doc_truyen_online_mobile/pages/story_search_page.dart';
import 'package:flutter/material.dart';

class Story {
  int? id;
  String name;
  String? avatar;
  String slug;
  String? description;
  String? truncateDescription;
  int? commentsCount;
  int? chaptersCount;
  Genre? genre;
  int chapterIndex;
  List<Genre>? genres;
  StoryUser? storyUser;
  Author? author;
  Story(
      {this.id,
      required this.name,
      required this.avatar,
      required this.slug,
      this.description,
      this.truncateDescription,
      required this.genre,
      this.genres,
      this.commentsCount,
      required this.chapterIndex,
      this.chaptersCount,
      this.storyUser,
      this.author});
  factory Story.fromJson(Map data) {
    return Story(
      id: data['id'],
      name: data['name'],
      avatar: data['avatar'],
      slug: data['slug'],
      description: data['description'],
      truncateDescription: data['truncate_description'],
      genre: data['genre'] != null ? Genre.fromJson(data['genre']) : null,
      genres: data['genres'] != null
          ? List.from(data['genres']).map((e) => Genre.fromJson(e)).toList()
          : null,
      commentsCount: data['comments_count'],
      chapterIndex: data['chapter_index'] ?? 1,
      chaptersCount: data['chapters_count'],
      storyUser: data['story_user'] != null
          ? StoryUser.fromJson(data['story_user'])
          : null,
      author: data['author'] != null ? Author.fromJson(data['author']) : null,
    );
  }
  static void showStoryDetail(context, String slug) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) {
        return StoryDetail(
          slug: slug,
        );
      },
    ));
  }

  static void showFilterStories(context, {String? name}) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) {
        return StorySearchPage(
          name: name,
        );
      },
    ));
  }
}
