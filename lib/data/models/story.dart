import 'dart:convert';

import 'package:doc_truyen_online_mobile/data/models/genre.dart';
import 'package:doc_truyen_online_mobile/pages/story_detail.dart';
import 'package:flutter/material.dart';

class Story {
  String? id;
  String name;
  String avatar;
  String slug;
  String? description;
  String? truncateDescription;
  String? commentsCount;
  Genre genre;
  List<Genre>? genres;
  Story({
    this.id,
    required this.name,
    required this.avatar,
    required this.slug,
    this.description,
    this.truncateDescription,
    required this.genre,
    this.genres,
    this.commentsCount,
  });
  factory Story.fromJson(Map<String, dynamic> data) {
    return Story(
      id: data['id'].toString(),
      name: data['name'],
      avatar: data['avatar'],
      slug: data['slug'],
      description: data['description'],
      truncateDescription: data['truncate_description'],
      genre: Genre.fromJson(data['genre']),
      genres: List.from(data['genres']).map((e) => Genre.fromJson(e)).toList(),
      commentsCount: data['comments_count'].toString(),
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
}
