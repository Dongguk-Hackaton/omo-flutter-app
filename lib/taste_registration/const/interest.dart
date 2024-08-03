enum Interest {
  VALUE_FOR_MONEY("가성비"),
  PERFORMANCE("공연"),
  ROMANTIC("로맨틱"),
  EATING("먹기"),
  NIGHT_VIEW_SCENERY("야경/풍경"),
  ENTERTAINMENT("오락"),
  INTIMATE("오붓한"),
  UNUSAL("이색"),
  ACTIVITY("활동"),
  HEALING("힐링");

  final String description;

  const Interest(this.description);

  String toApiString() {
    return this.toString().split('.').last;
  }
}