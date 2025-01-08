class CheckModel {
  final String name;
  bool checked;
  int count;

  CheckModel({
    required this.name,
    required this.checked,
    required this.count,
  });

  copyWith({String? name, bool? checked, int? count}) {
    return CheckModel(
      name: name ?? this.name,
      checked: checked ?? this.checked,
      count: count ?? this.count,
    );
  }
}
