class Docket extends Object {
  final int sv;
  final String description;
  final List<String> tags;
  final String court = "STJ";

  Docket({this.sv, this.description, this.tags});

  factory Docket.fromJson(Map<String, dynamic> json) {
    return Docket(
      sv: json['sv'] as int ?? -1,
      description: json['description'] as String ?? '',
      tags: json['tags'].cast<String>() as List<String> ?? List<String>(),
    );
  }

  @override
  String toString() {
    String docket = ' SV: $sv\n '
        'Description: $description\n '
        'court: $court\n'
        'tags: $tags\n';
    return docket;
  }
}