/// text : "گوشی a52s"
/// category : {"id":94,"title":"گوشی موبایل"}

class Suggestions {
  Suggestions({
    String? text,
    SuggestionCategory? category,
  }) {
    _text = text;
    _category = category;
  }

  Suggestions.fromJson(dynamic json) {
    _text = json['text'];
    _category = json['category'] != null
        ? SuggestionCategory.fromJson(json['category'])
        : null;
  }

  String? _text;
  SuggestionCategory? _category;

  Suggestions copyWith({
    String? text,
    SuggestionCategory? category,
  }) =>
      Suggestions(
        text: text ?? _text,
        category: category ?? _category,
      );

  String? get text => _text;

  SuggestionCategory? get category => _category;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['text'] = _text;
    if (_category != null) {
      map['category'] = _category?.toJson();
    }
    return map;
  }
}

/// id : 94
/// title : "گوشی موبایل"

class SuggestionCategory {
  SuggestionCategory({
    num? id,
    String? title,
  }) {
    _id = id;
    _title = title;
  }

  SuggestionCategory.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
  }

  num? _id;
  String? _title;

  SuggestionCategory copyWith({
    num? id,
    String? title,
  }) =>
      SuggestionCategory(
        id: id ?? _id,
        title: title ?? _title,
      );

  num? get id => _id;

  String? get title => _title;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    return map;
  }
}
