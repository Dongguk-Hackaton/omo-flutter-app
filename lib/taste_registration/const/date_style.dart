enum DateStyle {
  PASSIONATE_FOR_FOOD("관광보다 먹방"),
  CULTURE_ART_HISTORY("문화/예술/역사"),
  SHOPPING("쇼핑"),
  RELAXING("여유롭게 힐링"),
  TRAVEL_VIBE("여행지 느낌 물씬"),
  MUST_VISIT_TOURIST_SPOTS("유명 관광지는 필수"),
  EXPLORE_EVERYWHERE("이곳 저곳 탐방"),
  NATURE_WITH_US("자연과 함께"),
  ACTIVITES("체험/액티비티"),
  RELAXING_AT_ONE_SPOT("한 곳에서 여유롭게"),
  HOT_PLACES("핫플레이스"),
  LOCAL_RECOMMENDATION("현지인 추천");

  final String description;

  const DateStyle(this.description);
  
  String toApiString() {
    return this.toString().split('.').last;
  }
}