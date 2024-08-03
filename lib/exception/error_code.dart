enum ErrorCode{
  invalidDateStyleSelection("데이트 스타일은 5개까지 등록 가능합니다."),
  invalidInterestSelection("관심사는 5개까지 등록 가능합니다."),
  invalidLikeFoodSelection("좋아하는 음식은 4개까지 등록 가능합니다."),
  invalidDislikeFoodSelection("싫어하는 음식은 4개까지 등록 가능합니다."),
  invalidActivitySelection("활동량은 0 ~ 9 사이의 값만 등록 가능합니다.");

  final String description;

  const ErrorCode(this.description);
}