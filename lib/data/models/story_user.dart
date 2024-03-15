class StoryUser {
  int? userId;
  int? storyId;
  int? index;
  int? notified;
  StoryUser({
    required this.userId,
    required this.storyId,
    required this.index,
    required this.notified,
  });
  factory StoryUser.fromJson(Map data) {
    return StoryUser(
      userId: data['user_id'],
      storyId: data['story_id'],
      index: data['index'],
      notified: data['notified'],
    );
  }
}
