import 'more_info.dart';
import 'score_info.dart';

class Seller {
  Seller({
      this.name1, 
      this.name2, 
      this.shopName, 
      this.shopName2, 
      this.shopId, 
      this.prk, 
      this.showReportButton, 
      this.pageUrl, 
      this.isFilteredByCity, 
      this.isFilteredByOfficialShop, 
      this.shopScorePercentile, 
      this.shopVotesCount, 
      this.buttonText, 
      this.price, 
      this.priceText, 
      this.priceTextStriked, 
      this.priceTextMode, 
      this.isPriceUnreliable, 
      this.priceString, 
      this.badges, 
      this.shopScore, 
      this.moreInfo, 
      this.scoreInfo, 
      this.isAdv, 
      this.lastPriceChangeDate, 
      this.showPurchaseWarning,});

  Seller.fromJson(dynamic json) {
    name1 = json['name1'];
    name2 = json['name2'];
    shopName = json['shop_name'];
    shopName2 = json['shop_name2'];
    shopId = json['shop_id'];
    prk = json['prk'];
    showReportButton = json['show_report_button'];
    pageUrl = json['page_url'];
    isFilteredByCity = json['is_filtered_by_city'];
    isFilteredByOfficialShop = json['is_filtered_by_official_shop'];
    shopScorePercentile = json['shop_score_percentile'];
    shopVotesCount = json['shop_votes_count'];
    buttonText = json['button_text'];
    price = json['price'];
    priceText = json['price_text'];
    priceTextStriked = json['price_text_striked'];
    priceTextMode = json['price_text_mode'];
    isPriceUnreliable = json['is_price_unreliable'];
    priceString = json['price_string'];
    badges = json['badges'] != null ? json['badges'].cast<String>() : [];
    shopScore = json['shop_score'];
    moreInfo = json['more_info'] != null ? MoreInfo.fromJson(json['more_info']) : null;
    scoreInfo = json['score_info'] != null ? ScoreInfo.fromJson(json['score_info']) : null;
    isAdv = json['is_adv'];
    lastPriceChangeDate = json['last_price_change_date'];
    showPurchaseWarning = json['show_purchase_warning'];
  }
  String? name1;
  String? name2;
  String? shopName;
  String? shopName2;
  dynamic shopId;
  String? prk;
  bool? showReportButton;
  String? pageUrl;
  bool? isFilteredByCity;
  bool? isFilteredByOfficialShop;
  dynamic shopScorePercentile;
  dynamic shopVotesCount;
  String? buttonText;
  dynamic price;
  String? priceText;
  String? priceTextStriked;
  String? priceTextMode;
  bool? isPriceUnreliable;
  String? priceString;
  List<String>? badges;
  dynamic shopScore;
  MoreInfo? moreInfo;
  ScoreInfo? scoreInfo;
  bool? isAdv;
  String? lastPriceChangeDate;
  bool? showPurchaseWarning;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name1'] = name1;
    map['name2'] = name2;
    map['shop_name'] = shopName;
    map['shop_name2'] = shopName2;
    map['shop_id'] = shopId;
    map['prk'] = prk;
    map['show_report_button'] = showReportButton;
    map['page_url'] = pageUrl;
    map['is_filtered_by_city'] = isFilteredByCity;
    map['is_filtered_by_official_shop'] = isFilteredByOfficialShop;
    map['shop_score_percentile'] = shopScorePercentile;
    map['shop_votes_count'] = shopVotesCount;
    map['button_text'] = buttonText;
    map['price'] = price;
    map['price_text'] = priceText;
    map['price_text_striked'] = priceTextStriked;
    map['price_text_mode'] = priceTextMode;
    map['is_price_unreliable'] = isPriceUnreliable;
    map['price_string'] = priceString;
    map['badges'] = badges;
    map['shop_score'] = shopScore;
    if (moreInfo != null) {
      map['more_info'] = moreInfo?.toJson();
    }
    if (scoreInfo != null) {
      map['score_info'] = scoreInfo?.toJson();
    }
    map['is_adv'] = isAdv;
    map['last_price_change_date'] = lastPriceChangeDate;
    map['show_purchase_warning'] = showPurchaseWarning;
    return map;
  }

}