enum Food {
  JOKBAL_BOSSAM("족발/보쌈"),
  JJIM_TANG_JIGAE("찜/탕/찌개"),
  TONKATSU("돈까스"),
  SASHIMI("회"),
  JAPANESE("일식"),
  PIZZA("피자"),
  MEAT_GRILL("고기/구이"),
  WESTERN("양식"),
  CHICKEN("치킨"),
  CHINESE("중식"),
  ASIAN("아시안"),
  KOREAN_RICE_NOODLE("한식/백반/죽/국수"),
  LUNCH_BOX("도시락"),
  SNACK("분식"),
  CAFE_DESSERT("카페/디저트"),
  FAST_FOOD("패스트푸드");

  final String description;

  const Food(this.description);

  String toApiString() {
    return this.toString().split('.').last;
  }
}