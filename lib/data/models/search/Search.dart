import '../Products.dart';

class Search {
  Search({
      this.results, 
      this.count, 
      this.maxPrice, 
      this.minPrice, 
      this.next, 
      this.previous, 
      this.canonicalUrl, 
      this.spellcheck, 
      this.availableFilters, 
      this.attributes, 
      this.relatedQueries, 
      this.categoryIsLeaf, 
      this.filterByCategoryTitle, 
      this.categories, 
      this.parentCategories,});

  Search.fromJson(dynamic json) {
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(Results.fromJson(v));
      });
    }
    count = json['count'];
    maxPrice = json['max_price'];
    minPrice = json['min_price'];
    next = json['next'];
    previous = json['previous'];
    canonicalUrl = json['canonical_url'];
    spellcheck = json['spellcheck'] != null ? Spellcheck.fromJson(json['spellcheck']) : null;
    if (json['available_filters'] != null) {
      availableFilters = [];
      json['available_filters'].forEach((v) {
        availableFilters?.add(v);
      });
    }
    if (json['attributes'] != null) {
      attributes = [];
      json['attributes'].forEach((v) {
        attributes?.add(Attributes.fromJson(v));
      });
    }
    relatedQueries = json['related_queries'];
    categoryIsLeaf = json['category_is_leaf'];
    filterByCategoryTitle = json['filter_by_category_title'];
    if (json['categories'] != null) {
      categories = [];
      json['categories'].forEach((v) {
        categories?.add(Categories.fromJson(v));
      });
    }
    if (json['parent_categories'] != null) {
      parentCategories = [];
      json['parent_categories'].forEach((v) {
        parentCategories?.add(v);
      });
    }
  }
  List<Results>? results;
  int? count;
  double? maxPrice;
  double? minPrice;
  String? next;
  dynamic previous;
  String? canonicalUrl;
  Spellcheck? spellcheck;
  List<dynamic>? availableFilters;
  List<Attributes>? attributes;
  dynamic relatedQueries;
  bool? categoryIsLeaf;
  String? filterByCategoryTitle;
  List<Categories>? categories;
  List<dynamic>? parentCategories;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (results != null) {
      map['results'] = results?.map((v) => v.toJson()).toList();
    }
    map['count'] = count;
    map['max_price'] = maxPrice;
    map['min_price'] = minPrice;
    map['next'] = next;
    map['previous'] = previous;
    map['canonical_url'] = canonicalUrl;
    if (spellcheck != null) {
      map['spellcheck'] = spellcheck?.toJson();
    }
    if (availableFilters != null) {
      map['available_filters'] = availableFilters?.map((v) => v.toJson()).toList();
    }
    if (attributes != null) {
      map['attributes'] = attributes?.map((v) => v.toJson()).toList();
    }
    map['related_queries'] = relatedQueries;
    map['category_is_leaf'] = categoryIsLeaf;
    map['filter_by_category_title'] = filterByCategoryTitle;
    if (categories != null) {
      map['categories'] = categories?.map((v) => v.toJson()).toList();
    }
    if (parentCategories != null) {
      map['parent_categories'] = parentCategories?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}