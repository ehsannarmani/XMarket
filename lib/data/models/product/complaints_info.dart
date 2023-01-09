class ComplaintsInfo {
  ComplaintsInfo({
      this.title,
      this.summary,});

  ComplaintsInfo.fromJson(dynamic json) {
    title = json['title'];
    summary = json['summary'] != null ? json['summary'].cast<String>() : [];
  }
  String? title;
  List<String>? summary;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = title;
    map['summary'] = summary;
    return map;
  }

}