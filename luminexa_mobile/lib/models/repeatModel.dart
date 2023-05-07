class Repeat {
  final List? days;

  Repeat({
    this.days,
  });

  Repeat fromJSON(Map json) {
    final Repeat day = Repeat(
      days: json["repeat"],
    );

    return day;
  }
}
