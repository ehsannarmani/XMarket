class Routes{
  static String getByCategory(int categoryId,{int page= 1 ,int size = 25}){
    return "https://api.torob.com/v4/base-product/search/?sort=popularity&category=$categoryId&page=$page&size=$size";
  }
  static String getProductInfo(String productId){
    return "https://api.torob.com/v4/base-product/details-log-click/?source=next&prk=$productId&rank=&max_seller_count=30&cities=";
  }
  static String getSuggestions(String query){
    return "https://api.torob.com/suggestion2/?q=$query";
  }
  static String searchProducts(String query){
    return "https://api.torob.com/v4/base-product/search/?q=$query&page=0&sort=popularity&size=24";
  }
}