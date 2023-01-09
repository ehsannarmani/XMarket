class MoreInfo {
  MoreInfo({
      this.paymentOnDelivery, 
      this.freeShipping, 
      this.sameDayDelivery, 
      this.shippingTypes, 
      this.heavyItems, 
      this.sameDayFreeShipping,});

  MoreInfo.fromJson(dynamic json) {
    paymentOnDelivery = json['payment_on_delivery'];
    freeShipping = json['free_shipping'];
    sameDayDelivery = json['same_day_delivery'];
    shippingTypes = json['shipping_types'] != null ? json['shipping_types'].cast<String>() : [];
    heavyItems = json['heavy_items'];
    sameDayFreeShipping = json['same_day_free_shipping'];
  }
  String? paymentOnDelivery;
  dynamic freeShipping;
  String? sameDayDelivery;
  List<String>? shippingTypes;
  dynamic heavyItems;
  dynamic sameDayFreeShipping;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['payment_on_delivery'] = paymentOnDelivery;
    map['free_shipping'] = freeShipping;
    map['same_day_delivery'] = sameDayDelivery;
    map['shipping_types'] = shippingTypes;
    map['heavy_items'] = heavyItems;
    map['same_day_free_shipping'] = sameDayFreeShipping;
    return map;
  }

}