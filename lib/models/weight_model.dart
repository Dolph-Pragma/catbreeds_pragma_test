class Weight {
  const Weight({
    required this.imperial,
    required this.metric,
  });

  final String imperial;
  final String metric;

  Weight copyWith({
    String? imperial,
    metric,
  }) =>
      Weight(
        imperial: imperial ?? this.imperial,
        metric: metric ?? this.metric,
      );

  factory Weight.fromJson(Map<String, dynamic> json) => Weight(
        imperial: json["imperial"],
        metric: json["metric"],
      );

  Map<String, dynamic> toJson() => {
        "imperial": imperial,
        "metric": metric,
      };
}
