class Repeat {
  final List? days;

  Repeat({
    this.days,
  });

  static Repeat fromJSON(Map json) {
    final Repeat day = Repeat(
      days: json["repeat"],
    );

    return day;
  }
}
